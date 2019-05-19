package com.kh.respect.meet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.respect.common.Page;
import com.kh.respect.meet.model.service.MeetService;
import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;



@Controller
public class MeetController {
	
	private Logger logger=LoggerFactory.getLogger(MeetController.class);
	
	@Autowired
	MeetService service;
	
	@RequestMapping("/meet/meetList.do")
	public ModelAndView meetList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		
		List<Map<String,String>> list = service.selectMeetList(cPage, numPerPage);

		int totalCount=service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("pagebar", Page.getPage(cPage, numPerPage, totalCount, "meetList.do"));
		mv.addObject("totalCount", totalCount);
		mv.setViewName("meet/meetList");
		
		return mv;
	}
	
	@RequestMapping("/meet/searchMeet.do")
	public ModelAndView searchMeet(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
            @RequestParam(value="daterange", required=false, defaultValue="1800/01/01 - 3000/12/31") String range,
             @RequestParam(value="area") String area) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println(range);
		System.out.println("area == "+area);
		String start = range.substring(0, 10);
		System.out.println(start);
		String end = range.substring(13);
		System.out.println(end);
		
		int numPerPage = 10;
		
		List<Map<String,String>> list = service.searchMeetList(cPage, numPerPage, start, end, area);
		int totalCount=service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("pagebar", Page.getPage(cPage, numPerPage, totalCount, "meetList.do"));
		mv.setViewName("meet/meetList");
		
		return mv;
	}
	
	@RequestMapping("/meet/meetForm.do")
	public String meetForm()
	{
		return "/meet/meetForm";
	}
	
	@RequestMapping(value="/meet/meetFormEnd.do", method = RequestMethod.POST)
	public ModelAndView insertMeet(@RequestParam(value="title") String title,
								  @RequestParam(value="area") String area,
								  @RequestParam(value="address") String address,
								  @RequestParam(value="userId") String userId,
								  @RequestParam(value="meetDate") String meetDate,
								  @RequestParam(value="meetTime") String meetTime,
								  @RequestParam(value="content") String content,
								  MultipartFile thumbnail, HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		Meet meet = new Meet(0, userId, null, null, 0, area, title, null, content, meetDate, null, meetTime, address, 0, 0, null);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/meet/thumbnail");
		
		File dir = new File(saveDir);
		
		if(dir.exists()==false) dir.mkdirs();
		
		if(!thumbnail.isEmpty()) {
			String originalFileName = thumbnail.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			// 확장자를 구분해냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			
			try {
				// 서버에 해당경로에 파일을 저장하는 명령
				thumbnail.transferTo(new File(saveDir+"/"+renamedFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			meet.setThumbnail(renamedFileName);
		}
		
		
		int result = service.insertMeet(meet);
		System.out.println(result);
		
		String msg = "";
		String loc = "";
		
		if(result>0)
		{
			msg = "모임 등록에 성공하였습니다.";
			loc = "/meet/meetList.do";
		}
		else 
		{
			msg = "모임 등록에 실패하였습니다.";
			loc = "/meet/meetList.do";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping(value="/meet/meetView.do")
	public ModelAndView selectOne(int meetNo)
	{
		ModelAndView mv = new ModelAndView();
		
		Meet meet = service.selectOne(meetNo);
		
		String meetTime = meet.getMeetTime();
		String meetDate = meet.getMeetDate().substring(0, 10);
		service.updateMeetCnt(meetNo);
		
		//댓글
		List<Map<String, String>> meetReplyList = service.meetReplyList(meetNo);
        List<Map<String, String>> meetAttList = service.meetAttList();
		
        mv.addObject("meetReplyList",meetReplyList);
		mv.addObject("meetAttList",meetAttList);
		
		mv.addObject("meet", meet);
		mv.addObject("meetDate", meetDate);
		mv.addObject("meetTime", meetTime);
		mv.setViewName("meet/meetView");
		
		return mv;
	}
	
	@RequestMapping("/meet/meetUpdate.do")
	public String meetUpdate(int meetNo, Model model)
	{
		Meet meet = service.selectOne(meetNo);
		String meetDate = meet.getMeetDate().substring(0, 10);
		String meetTime = meet.getMeetTime();
		
		model.addAttribute("meet",meet);
		model.addAttribute("meetDate", meetDate);
		model.addAttribute("meetTime", meetTime);
		
		return "meet/meetUpdate";
	}
	
	@RequestMapping(value = "/meet/meetUpdateEnd.do", method = RequestMethod.POST)
	public ModelAndView meetUpdateEnd(@RequestParam(value="meetNo") int meetNo,
									  @RequestParam(value="title") String title,
									  @RequestParam(value="area") String area,
									  @RequestParam(value="address") String address,
									  @RequestParam(value="userId") String userId,
									  @RequestParam(value="meetDate") String meetDate,
									  @RequestParam(value="meetTime") String meetTime,
									  @RequestParam(value="content") String content)
	{
		ModelAndView mv = new ModelAndView();
		Meet meet = new Meet(meetNo, userId, null, null, 0, area, title, null, content, meetDate, null, meetTime, address, 0, 0, null);
		
		int result = service.meetUpdate(meet);
		System.out.println("result :: "+result);
		String msg = "";
		String loc = "";
		
		if(result>0)
		{
			msg="수정이 완료되었습니다.";
			loc="/meet/meetList.do";
		}
		else 
		{
			msg="수정애 실패하였습니다.";
			loc="/meet/meetList.do";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/meet/meetDelete.do")
	public ModelAndView meetDelete(@RequestParam(value="meetNo") int meetNo)
	{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("meetNo == "+ meetNo);
		
		String msg = "";
		String loc = "";
		
		int result = service.meetDelete(meetNo);
		
		if(result>0)
		{
			msg = "해당 모임이 삭제되었습니다.";
			loc = "/meet/meetList.do";
		}
		else 
		{
			msg = "모임 삭제에 실패하였습니다.";
			loc = "/meet/meetList.do";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
   @RequestMapping(value="/imageUpload.do", method = RequestMethod.POST)
   @ResponseBody
   public String imageUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws IOException
   {
      System.out.println("uploadFile :: "+uploadFile[0]);
      ObjectMapper mapper=new ObjectMapper();
      Map<String,Object> map=new HashMap();
      
      String saveDir = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
      
      List<String> attList = new ArrayList();
      
      File dir = new File(saveDir);
      // 폴더가 없을경우 생성
      if(dir.exists()==false)
      {
         dir.mkdirs();
      }
      
      for(MultipartFile f : uploadFile)
      {
         if(!f.isEmpty())
         {
            String originName = f.getOriginalFilename();
            String ext = originName.substring(originName.lastIndexOf(".")+1);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
            int rndNum = (int)(Math.random()*10000);
            String renamed = sdf.format(new Date(System.currentTimeMillis()));
            //String renamed = "meet";
            renamed += "_" + rndNum + "." + ext;
            try {
               // 서버 경로에 파일을 저장
               f.transferTo(new File(saveDir+"/"+renamed));
            }
            catch(Exception e)
            {
               e.printStackTrace();
            }
            attList.add(renamed);
         }
      }
      
      String jsonStr=mapper.writeValueAsString(attList);
      
      return jsonStr;
   }
   
   /////////////////// 댓글 /////////////////////////////// 
   
   @RequestMapping("/meet/meetReplyWrite.do")
   public ModelAndView meetReplyWrite(MeetReply meetReply, MultipartFile[] upFile, HttpServletRequest request) {
      
      String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/replyPicture");
      
      List<MeetReplyAttachment> attList=new ArrayList();
      
      File dir=new File(saveDir);
      //경로가 없으면 경로를 만들어랏!!
      if(dir.exists()==false) dir.mkdirs();
      
      for(MultipartFile f : upFile)
      {
         if(!f.isEmpty())
         {
            String originalFilename=f.getOriginalFilename();
            //확장자 가져오기
            String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
            int rndNum=(int)(Math.random()*1000);
            String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
            renamedFileName+="_"+rndNum+"."+ext;
            try 
            {
               /*서버의 해당경로에 파일을 저장하는 명령*/
               f.transferTo(new File(saveDir+"/"+renamedFileName));
            }
            catch (Exception e) {
               e.printStackTrace();
            }
            MeetReplyAttachment attach=new MeetReplyAttachment();
            attach.setOriginName(originalFilename);
            attach.setReNamed(renamedFileName);
            attList.add(attach);
         }
      }
      //파일업로드 끝~~
      
      int result=service.meetReplyWrite(meetReply,attList);
      
      String msg="";
      String loc="";
      if(result>0){
         msg="댓글을 등록하였습니다!";
         loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
      }
      else{
         msg="댓글등록에 실패하였습니다";
         loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
      }
      
      ModelAndView mv=new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc", loc);
      mv.setViewName("common/msg");
      return mv;
   }
   
   
   @RequestMapping("/meet/meetReplyWrite2.do")
   public ModelAndView meetReplyWrite2(MeetReply meetReply) {
      int result = service.meetReplyWrite2(meetReply);
      
      String msg="";
      String loc="";
      if(result>0){
         msg="답글을 등록하였습니다!";
         loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
      }
      else{
         msg="답글등록에 실패하였습니다";
         loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
      }
      
      ModelAndView mv=new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc", loc);
      mv.setViewName("common/msg");
      return mv;
      
   }
   
   
   @RequestMapping("/meet/meetReplyDelete.do")
   public ModelAndView meetReplyDelete(int replyNo, int meetNo) {
      int result = service.meetReplyDelete(replyNo);
      String msg="";
      String loc="";
      if(result>0) {
         msg="댓글을 삭제하였습니다!";
         loc="/meet/meetView.do?meetNo="+meetNo;
      }else {
         msg="댓글 삭제에 실패하였습니다.";
         loc="/meet/meetView.do?meetNo="+meetNo;
      }
      ModelAndView mv=new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc", loc);
      mv.setViewName("common/msg");
      return mv;
   }
   
   @RequestMapping("/meet/meetReplyGood.do")
   public ModelAndView meetReplyGood(MeetReply meetReply) {
      System.out.println("아이디 : " + meetReply.getUserId());
      System.out.println("q버놓번호 : " + meetReply.getMeetNo());
      int check = service.meetReplyGoodCheck(meetReply);
      String msg="";
      String loc="";
      if(check>0) {
         msg="이미 추천하셨습니다.";
         loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
      }else {
         
         service.insertmeetReplyGood(meetReply);
         
         int result = service.meetReplyGood(meetReply.getReplyNo());   
         
         if(result>0) {
            msg="추천을 하였습니다!";
            loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
         }else {
            msg="추천에 실패하였습니다.";
            loc="/meet/meetView.do?meetNo="+meetReply.getMeetNo();
         }
      }
      ModelAndView mv=new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc", loc);
      mv.setViewName("common/msg");
      return mv;
      
   }
   
   
   
}
	
	
	

