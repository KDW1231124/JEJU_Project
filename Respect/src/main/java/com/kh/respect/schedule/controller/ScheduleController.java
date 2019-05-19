package com.kh.respect.schedule.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.google.gson.Gson;
import com.kh.respect.common.CompareSeqAsc;
import com.kh.respect.common.Page;
import com.kh.respect.mySchedule.model.service.MyScheduleService;
import com.kh.respect.place.model.service.PlaceService;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.schedule.model.service.ScheduleService;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReport;
import com.kh.respect.schedule.model.vo.TimeTable;
import com.kh.respect.user.model.vo.User;

@Controller
public class ScheduleController {

	@Autowired 
	private ScheduleService service;
	@Autowired
	private PlaceService pservice;
	@Autowired 
	private MyScheduleService myservice;
	
	

	
	
	@RequestMapping("/schedule/scheduleReportInsert")
	public ModelAndView scheduleReview(HttpSession session,int scheduleNo,@RequestParam(value="reportTitle" ,required=false)String [] reportTitle, @RequestParam(value="reportContent", required=false) String [] reportContent, @RequestParam(value="day",required=false) int [] day)
	{
		ModelAndView mv= new ModelAndView();
		int result=0;
				
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<ScheduleReport> list=new ArrayList<ScheduleReport>();
		ScheduleReport sr = null;
		System.out.println("제목 : "+reportTitle.length);
		System.out.println("내용 : "+reportContent.length);
		System.out.println("일차 : "+day.length);
		if(reportTitle!=null)
		{
			if(reportTitle.length==1)
			{
				sr=new ScheduleReport();
				sr.setUserId(userId);
				sr.setReportDay(day[0]);
				sr.setContent(reportContent[0]);
				sr.setTitle(reportTitle[0]);
				sr.setScheduleNo(scheduleNo);
				list.add(sr);
			}else
			{
				
				for(int i=0; i<reportTitle.length; i++)
				{
					System.out.println(reportTitle[i]);
					if(reportTitle[i]!=null&&reportTitle[i]!="")
					{
						sr=new ScheduleReport();
						sr.setScheduleNo(scheduleNo);
						sr.setUserId(userId);
						sr.setContent(reportContent[i]);
						sr.setTitle(reportTitle[i]);
						sr.setReportDay(day[i]);
						list.add(sr);
					}
					
					
//					System.out.println("리스트에 담긴 내용입니다 : "+list.get(i).getContent());
//					System.out.println("리스트에 담긴 아이디 : "+list.get(i).getUserId());
				}
			}
			
			result=service.insertScheduleReport(list);
		}
		
		
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);
		
		Gson gson=new Gson();
		String json = gson.toJson(tt);

		
		//댓글
		List<Map<String, String>> scheduleReplyList = service.scheduleReplyList(scheduleNo);
        List<Map<String, String>> scheduleAttList = service.scheduleAttList();
	      
	      String msg="";
	      String loc="/schedule/scheduleView?scheduleNo="+scheduleNo+"&userId="+userId;  
	      if(result>0)
	      {
	         msg="후기 등록 성공";
	      }
	      else
	      {
	         msg="후기 등록 실패";
	      }
	      
        mv.addObject("msg", msg);
        mv.addObject("loc",loc);
        mv.addObject("viewList",map);
        mv.addObject("tt",json);
	    mv.addObject("scheduleReplyList",scheduleReplyList);
	    mv.addObject("scheduleAttList",scheduleAttList);
		mv.setViewName("common/msg");
		return mv;
	}

	
	@RequestMapping("/schedule/scheduleReport")
	public ModelAndView scheduleReview(int scheduleNo)
	{
		ModelAndView mv= new ModelAndView();
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);
		Gson gson=new Gson();
		String json = gson.toJson(tt);
		mv.addObject("viewList",map);
		mv.addObject("tt",json);
		mv.setViewName("schedule/scheduleReportForm");
		return mv;
	}
	
	@RequestMapping("/schedule/myPlaceAddView")
	public String myPlaceAddView(String detailAddr,Model model)
	{
		model.addAttribute("detailAddr",detailAddr);
		return "schedule/myPlaceAddForm";
	}
	
	
	
	@RequestMapping("/schedule/scheduleView")
	public ModelAndView ScheduleView(HttpSession session,int scheduleNo, String userId)
	{
		ModelAndView mv= new ModelAndView();
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);

		
		List<ScheduleReport> sr=service.selectScheduleReportView(scheduleNo);
 
		Collections.sort(sr, new CompareSeqAsc());
		
		Gson gson=new Gson();
		String json = gson.toJson(tt);
		mv.addObject("viewList",map);
		mv.addObject("tt",json);
		
		if(userId!="") {
		
			Schedule schedule = new Schedule();
			schedule.setScheduleNo(scheduleNo);
			schedule.setUserId(userId);
			int goodCheck = service.goodCountCheck(schedule);
			int bringCheck = service.bringCountCheck(schedule);
			System.out.println("goodCheck : "  + goodCheck);
			System.out.println("bringCheck : "  + bringCheck);
			mv.addObject("goodCheck",goodCheck);
		    mv.addObject("bringCheck",bringCheck);
		}
		//댓글
		List<Map<String, String>> scheduleReplyList = service.scheduleReplyList(scheduleNo);
        List<Map<String, String>> scheduleAttList = service.scheduleAttList();
	      
	      mv.addObject("reportList",sr);
	      mv.addObject("scheduleReplyList",scheduleReplyList);
	      mv.addObject("scheduleAttList",scheduleAttList);
	      mv.setViewName("schedule/scheduleView");
		return mv;
	}
	
	
	
	@RequestMapping("/schedule/scheduleList")
	public ModelAndView ScheduleList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		ModelAndView mv=new ModelAndView();
		System.out.println("스케줄 컨트롤러 스케줄 리스트 첫페이지 : "+cPage);
		int numPerPage=8;
		List<Map<String,String>> list=service.selectScheduleList(cPage,numPerPage);
		System.out.println("스케줄 컨트롤러 게시물 리스트: "+list);
		
		int totalCount=service.selectTotalCount();
		System.out.println("스케줄 컨트롤러 게시물 갯수: "+totalCount);
		mv.addObject("list",list);
		mv.addObject("totalContent",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount,"scheduleList"));
		mv.setViewName("schedule/scheduleList");
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleFilter")
	public ModelAndView ScheduleListFilter(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, String tripType, String tripPartner, String sort)
	{
		ModelAndView mv=new ModelAndView();
		System.out.println("스케줄 컨트롤러 필터 sort:"+sort);
		System.out.println("스케줄 컨트롤러 필터 tripType:"+tripType);
		System.out.println("스케줄 컨트롤러 필터 partyName:"+tripPartner);
		
		int numPerPage=8;
		
		Map<String,String> map=null;
		List<Map<String,String>> list=null;
		
		if(tripPartner==null&&tripType==null&&sort==null)
		{
			list=service.selectScheduleList(cPage,numPerPage);
		}
		else
		{
			map= new HashMap();
			map.put("tripType", tripType);
			map.put("partyName", tripPartner);
			map.put("sort", sort);
			list=service.selectScheduleFilter(map,numPerPage,cPage);
		}
		
		
		
		
		int totalCount=service.selectTotalCount();
		System.out.println("스케줄 컨트롤러 게시물 리스트: "+list);
		
		mv.addObject("list",list);
		mv.addObject("totalContent",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount,"scheduleFilter"));
		mv.setViewName("schedule/scheduleList");
		
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleWrite")
	public ModelAndView ScheduleWrite(HttpSession session, ModelAndView mv)
	{
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		List<Place> list=pservice.selectSpotList(1, 5);		
			
		List<Place> userList=pservice.selectUserSpotList(userId,1,5);
				
		List<Place> putList=myservice.putPlaceList(userId, 1, 5);
		
		mv.addObject("listBar",Page.getPageBarSC(1, 5, pservice.selectTotalCount(), 1));
		mv.addObject("userListBar",Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId),2));
		mv.addObject("putListBar",Page.getPageBarSC(1, 5, myservice.putPlaceNum(userId),3));
		mv.addObject("putList",putList);
		mv.addObject("list",list);
		mv.addObject("userList",userList);
		mv.setViewName("schedule/scheduleWrite");
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleWriteEnd")
	   public ModelAndView ScheduleWriteEnd(HttpSession session, String partyName2, String title2, String startDate2, String endDate2, int people2, String travelTheme2, int openflag2, int represent, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue )
	   {
	      
	      
	      User user=(User)session.getAttribute("userLoggedIn");
	      String userId=user.getUserId();
	      
	      ModelAndView mv=new ModelAndView();
	      Schedule sc=new Schedule();
	      sc.setTitle(title2);
	      sc.setStartDate(startDate2);
	      sc.setEndDate(endDate2);
	      sc.setPeopleNum(people2);
	      sc.setTravelTheme(travelTheme2);
	      sc.setPublicFlag(openflag2);
	      sc.setPlaceNo(represent);
	      sc.setUserId(userId);
	      sc.setPartyName(partyName2);
	      System.out.println();
	      TimeTable tt=null;
	      List<TimeTable> list=new ArrayList<TimeTable>();
	      if(timevalue!=null)
	      {
	         if(timevalue[0].length()==1)
	         {
	            tt=new TimeTable();
	            tt.setDay(Integer.parseInt(timevalue[0]));
	            tt.setTime(Integer.parseInt(timevalue[1]));
	            tt.setPlaceNo(Integer.parseInt(placevalue[0]));
	            list.add(tt);
	         }
	         else
	         {
	            for(int i=0; i<timevalue.length; i++)
	            {
	               tt=new TimeTable();
	               
	               StringTokenizer st=new StringTokenizer(timevalue[i],",");
	               tt.setDay(Integer.parseInt(st.nextToken()));
	               tt.setTime(Integer.parseInt(st.nextToken()));
	               System.out.println(tt.getDay());
	               System.out.println(tt.getTime());
	               st=new StringTokenizer(placevalue[i], ",");
	               tt.setPlaceNo(Integer.parseInt(st.nextToken()));
	               System.out.println(tt.getPlaceNo());
	               list.add(tt);
	            }
	         }
	         
	      }
	      
	    
	      int result=service.insertSchedule(sc,list);
	      String msg="";
	      String loc="mySchedule/myScheduleList.do?userId="+userId+"&sort=all";
	      if(result>0)
	      {
	         msg="일정 등록 성공";
	         loc="/";
	      }
	      else
	      {
	         msg="일정 등록 실패";
	         loc="/";
	      }
	      
	      mv.addObject("msg", msg);
	      mv.addObject("loc",loc);
	      mv.setViewName("common/msg");
	      
	      return mv;
	      
	      
	   }
	
	
	
	   @RequestMapping("/scheduleReply/scheduleReplyWrite.do")
	   public ModelAndView scheduleReplyWrite(ScheduleReply schedulyReply, MultipartFile[] upFile, HttpServletRequest request) {
	      
	      String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/replyPicture");
	      
	      List<ScheduleReplyAttachment> attList=new ArrayList();
	      
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
	            ScheduleReplyAttachment attach=new ScheduleReplyAttachment();
	            attach.setOriginName(originalFilename);
	            attach.setReNamed(renamedFileName);
	            attList.add(attach);
	         }
	      }
	      //파일업로드 끝~~
	      
	      int result=service.scheduleReplyWrite(schedulyReply,attList);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="댓글을 등록하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	      }
	      else{
	         msg="댓글등록에 실패하였습니다";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   
	   @RequestMapping("/scheduleReply/scheduleReplyWrite2.do")
	   public ModelAndView scheduleReplyWrite2(ScheduleReply schedulyReply) {
	      int result = service.scheduleReplyWrite2(schedulyReply);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="답글을 등록하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	      }
	      else{
	         msg="답글등록에 실패하였습니다";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	   
	   
	   @RequestMapping("/scheduleReply/scheduleReplyDelete.do")
	   public ModelAndView scheduleReplyDelete(int replyNo, int scheduleNo, String userId) {
	      int result = service.scheduleReplyDelete(replyNo);
	      String msg="";
	      String loc="";
	      if(result>0) {
	         msg="댓글을 삭제하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+scheduleNo+"&userId="+userId;
	      }else {
	         msg="댓글 삭제에 실패하였습니다.";
	         loc="/schedule/scheduleView?scheduleNo="+scheduleNo+"&userId="+userId;
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   @RequestMapping("/scheduleReply/scheduleReplyGood.do")
	   public ModelAndView scheduleReplyGood(ScheduleReply schedulyReply) {
	      
	      int check = service.scheduleReplyGoodCheck(schedulyReply);
	      String msg="";
	      String loc="";
	      if(check>0) {
	         msg="이미 추천하셨습니다.";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	      }else {
	         
	         service.insertscheduleReplyGood(schedulyReply);
	         
	         int result = service.scheduleReplyGood(schedulyReply.getReplyNo());   
	         
	         if(result>0) {
	            msg="추천을 하였습니다!";
	            loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	         }else {
	            msg="추천에 실패하였습니다.";
	            loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo()+"&userId="+schedulyReply.getUserId();
	         }
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	
	
	@RequestMapping(value="/schedule/placeList", method = RequestMethod.POST)
	public void placeListPaging(ModelAndView mv, int cPage, HttpServletResponse response, String keyword) throws Exception
	{	
		List<Place> list=new ArrayList<Place>();
		System.out.println(keyword);
		if(keyword==null)
		{
			list=pservice.selectSpotList(cPage, 5);
		}
		else
		{
			list=pservice.selectSearchList(cPage, 5,keyword);
		}
		
		
		
		String html="";
		for(Place p:list)
		{
			
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn btn-outline-warning btn-sm mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		if(keyword==null)
		{
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectTotalCount(), 1)+"</nav>";
		}
		else
		{
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectSearchCount(keyword), 1)+"</nav>";
		}
				
			
		response.getWriter().println(html);
				
	}
	@RequestMapping(value="/schedule/userList", method = RequestMethod.POST)
	public void userListPaging(ModelAndView mv, int cPage, HttpServletResponse response, HttpSession session) throws Exception
	{	
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<Place> list=pservice.selectUserSpotList(userId,cPage,5);
		
		
		String html="";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn btn-outline-warning btn-sm mb-2 mr-1' value='"+p.toString()+"' onclick='fn_addUPlace(event)'>일정등록</button></div>";
			html+="<button class='btn btn-outline-warning btn-sm mb-2' value='"+p.toString()+"' onclick='fn_deleteUserPlace(event)'>장소삭제</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectTotalUserCount(userId), 2)+"</nav>";		
		
		response.getWriter().println(html);
				
	}
	@RequestMapping(value="/schedule/putList", method = RequestMethod.POST)
	public void putListPaging(ModelAndView mv, int cPage, HttpServletResponse response,HttpSession session) throws Exception
	{	
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<Place> list=myservice.putPlaceList(userId, 1, 5);
		
		String html="";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn btn-outline-warning btn-sm  mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, myservice.putPlaceListTotalCount(userId), 3)+"</nav>";		
				
		response.getWriter().println(html);
				
	}
	
	@RequestMapping(value="/schedule/placeSearch", method = RequestMethod.POST)
	public void placeListSearch(ModelAndView mv, String keyword, HttpServletResponse response) throws Exception
	{	
		List<Place> list=pservice.selectSearchList(1, 5,keyword);
		String html="";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn  btn-outline-warning btn-sm  mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(1, 5, pservice.selectSearchCount(keyword), 1)+"</nav>";		
				
		response.getWriter().println(html);
				
	}
	
	@RequestMapping(value="/schedule/deletePlace", method = RequestMethod.POST)
	public void userListDelete(ModelAndView mv, int placeno, HttpServletResponse response, HttpSession session) throws Exception
	{	
		int result=pservice.deleteSpot(placeno);
		
		if(result>0)
		{
			
			User user=(User)session.getAttribute("userLoggedIn");
			String userId=user.getUserId();
			List<Place> list=pservice.selectUserSpotList(userId,1,5);
			
			
			String html="";
			for(Place p:list)
			{
				html+="<div class=' col-md-13 mt-3 justify-content-center' >";
				html+="<br><p>"+p.getTitle()+"</p>";
				html+="<button class='btn  btn-outline-warning btn-sm  mb-2 mr-1' value='"+p.toString()+"' onclick='fn_addUPlace(event)'>일정등록</button></div>";
				html+="<button class='btn  btn-outline-warning btn-sm mb-2' value='"+p.toString()+"' onclick='fn_deleteUserPlace(event)'>장소삭제</button></div><hr>";
			}
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId), 2)+"</nav>";		
			
			response.getWriter().println(html);
		}
		else
		{
			String html="<script>alert('삭제실패')</script>";
			response.getWriter().println(html);
		}
		
	}
	
	@RequestMapping("schedule/updateSchedule")
	public ModelAndView updateSchedule(int scheduleNo,ModelAndView mv, HttpSession session)
	{
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		List<Place> list=pservice.selectSpotList(1, 5);		
			
		List<Place> userList=pservice.selectUserSpotList(userId,1,5);
				
		List<Place> putList=myservice.putPlaceList(userId, 1, 5);
		
		mv.addObject("listBar",Page.getPageBarSC(1, 5, pservice.selectTotalCount(), 1));
		mv.addObject("userListBar",Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId),2));
		mv.addObject("putListBar",Page.getPageBarSC(1, 5, myservice.putPlaceNum(userId),3));
		mv.addObject("putList",putList);
		mv.addObject("list",list);
		mv.addObject("userList",userList);
		mv.addObject("scheduleNo",scheduleNo);
		Map sc=service.selectSchedule(scheduleNo);
		List<Map> ttList=service.selectTimeTableList(scheduleNo);
		
		
		Gson gson=new Gson();
		String json = gson.toJson(ttList);
		mv.addObject("schedule",sc);
		mv.addObject("ttList",json);
		mv.setViewName("schedule/scheduleUpdate");
		return mv;
	}
	
	@RequestMapping(value="/schedule/scheduleUpdateEnd", method = RequestMethod.POST)
	public ModelAndView ScheduleUpdateEnd(int scheduleNo, String partyName2, String title2, String startDate2, String endDate2, int people2, String travelTheme2, int openflag2, int represent, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue )
	{
		
		ModelAndView mv=new ModelAndView();
		Schedule sc=new Schedule();
		sc.setTitle(title2);
		sc.setStartDate(startDate2);
		sc.setEndDate(endDate2);
		sc.setPeopleNum(people2);
		sc.setTravelTheme(travelTheme2);
		sc.setPublicFlag(openflag2);
		sc.setPlaceNo(represent);
		sc.setScheduleNo(scheduleNo);
		sc.setPartyName(partyName2);
		
		TimeTable tt=null;
		List<TimeTable> list=new ArrayList<TimeTable>();
		if(timevalue!=null)
		{
			if(timevalue[0].length()==1)
			{
				tt=new TimeTable();
				tt.setDay(Integer.parseInt(timevalue[0]));
				tt.setTime(Integer.parseInt(timevalue[1]));
				tt.setPlaceNo(Integer.parseInt(placevalue[0]));
				tt.setScheduleNo(scheduleNo);
				list.add(tt);
			}
			else
			{
				for(int i=0; i<timevalue.length; i++)
				{
					tt=new TimeTable();
					
					StringTokenizer st=new StringTokenizer(timevalue[i],",");
					tt.setDay(Integer.parseInt(st.nextToken()));
					tt.setTime(Integer.parseInt(st.nextToken()));
					
					st=new StringTokenizer(placevalue[i], ",");
					tt.setPlaceNo(Integer.parseInt(st.nextToken()));
					tt.setScheduleNo(scheduleNo);
					list.add(tt);
				}
			}
			
		}
		
		int result=service.updateSchedule(sc,list);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="일정 수정 성공";
			loc="/";
		}
		else
		{
			msg="일정 수정 실패";
			loc="/";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
		
	}
	

	
	//좋아요 증가및 감소
		// 뷰 호출할때 int goodCheck를 넘겨 0인지 1인지 구분하고 jsp에서 구분 (0은 추천안함, 1은이미 추천함) 
		@RequestMapping("/schedule/goodCountUpdate")
		public void goodCountUpdate(Schedule schedule,HttpServletResponse response)throws Exception {
			
			int goodCheck = service.goodCountCheck(schedule);
			if(goodCheck==0) {
				int result2 = service.goodCountUp(schedule);
				if(result2>0) {
					Map<String, String> map=service.selectOneScheduleView(schedule.getScheduleNo());
					String goodCount = String.valueOf(map.get("GOODCOUNT"));

					String html="<h6 class='ml-2' style='color:#f19221'>"+goodCount+"</h6>";
					response.getWriter().println(html);
				}
			}else {
				int result = service.goodCountDown(schedule);
				if(result >0) {
					Map<String, String> map=service.selectOneScheduleView(schedule.getScheduleNo());
					String goodCount = String.valueOf(map.get("GOODCOUNT"));
			
					String html="<h6 class='ml-2' style='color:rgb(208, 203, 203);'>"+goodCount+"</h6>";
					response.getWriter().println(html);
				}
			}
		}
		
		//찜하기 증가및 감소
		// 뷰 호출할때 int bringCheck를 넘겨 0인지 1인지 구분하고 jsp에서 구분 (0은 찜안함, 1은이미 찜함) 
		@RequestMapping("/schedule/bringCountUpdate")
		public void bringCountUpdate(Schedule schedule,HttpServletResponse response) throws Exception {
			
		
			int bringCheck = service.bringCountCheck(schedule);
			
			if(bringCheck==0) {
				int result = service.bringCountUp(schedule)	;
				if(result>0) {
					Map<String, String> map=service.selectOneScheduleView(schedule.getScheduleNo());
					String jjimCount = String.valueOf(map.get("BRINGCOUNT"));

					String html="<h6 class='ml-2' style='color:#f19221'>"+jjimCount+"</h6>";
					response.getWriter().println(html);
				}
			}else {
				int result2 = service.bringCountDown(schedule);
				if(result2>0) {
					Map<String, String> map=service.selectOneScheduleView(schedule.getScheduleNo());
					String jjimCount = String.valueOf(map.get("BRINGCOUNT"));
			
					String html="<h6 class='ml-2' style='color:rgb(208, 203, 203);'>"+jjimCount+"</h6>";
					response.getWriter().println(html);
				}
			}
			
		}
	
	
	

	@RequestMapping("/schedule/deleteSchedule")
	public ModelAndView deleteSchedule(int scheduleNo,ModelAndView mv)
	{
		int result=service.deleteSchedule(scheduleNo);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="일정 삭제 성공";
			loc="/";
		}
		else
		{
			msg="일정 삭제 실패";
			loc="/";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

	@RequestMapping("/schedule/addPlace")
	public ModelAndView addPlace(ModelAndView mv, String msg, String option)
	{
		mv.addObject("msg", msg);
		mv.addObject("option",option);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/schedule/bringSchedule")
	public void bringSchedule(int scheduleNo, HttpSession session,HttpServletResponse response) throws Exception
	{ 
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		Schedule sc=service.selectScheduleSC(scheduleNo);
		List<TimeTable> tt=service.selectTimeTableSC(scheduleNo);
		sc.setUserId(userId);
		
		int result=service.insertSchedule(sc,tt);
		String html;
		if(result>0)
		{
			html="내 일정으로 담기 성공";
		}
		else
		{
			html="내 일정으로 담기 실패";
		}
		response.getWriter().println(html);
	}
	
	
	
	@RequestMapping("/schedule/updateReport")
	public ModelAndView updateReport(ModelAndView mv, int scheduleNo)
	{
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);
		List<ScheduleReport> rList=service.selectScheduleReportView(scheduleNo);
		
		Collections.sort(rList,new CompareSeqAsc());
		
		Gson gson=new Gson();
		String json = gson.toJson(tt);
		mv.addObject("viewList",map);
        mv.addObject("tt",json);
        mv.addObject("rList",rList);
        mv.setViewName("schedule/reportUpdate");
		return mv;
	}
	@RequestMapping("/schedule/reportUpdateEnd")
	public ModelAndView updateReportEnd(HttpSession session,ModelAndView mv, int scheduleNo,String [] reportTitle, String [] reportContent,int [] day)
	{
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<ScheduleReport> list=new ArrayList<ScheduleReport>();
		ScheduleReport sr = null;
		if(reportTitle!=null)
		{
			
		
		if(reportTitle.length==1)
		{
			sr=new ScheduleReport();
			sr.setUserId(userId);
			sr.setReportDay(day[0]);
			sr.setContent(reportContent[0]);
			sr.setTitle(reportTitle[0]);
			sr.setScheduleNo(scheduleNo);
			list.add(sr);
		}else
		{

			for(int i=0; i<reportTitle.length; i++)
			{
			if(reportTitle[i]!=null&&reportTitle[i]!="")
			
			{
				sr=new ScheduleReport();
				sr.setScheduleNo(scheduleNo);
				sr.setUserId(userId);
				sr.setContent(reportContent[i]);
				sr.setTitle(reportTitle[i]);
				sr.setReportDay(day[i]);
				list.add(sr);
			}

			}
		}
		}
	
		int result=service.updateReport(list,scheduleNo);
		String msg="";
	    String loc="/schedule/scheduleView?scheduleNo="+scheduleNo+"&userId="+userId;  
	      if(result>0)
	      {
	         msg="후기 수정 성공";
	      }
	      else
	      {
	         msg="후기 수정 실패";
	      }
	      mv.addObject("msg",msg);
	      mv.addObject("loc",loc);
	      mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/schedule/deleteReport")
	public ModelAndView scheduleReportDelete(int scheduleNo,HttpSession session)
	{
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		ModelAndView mv = new ModelAndView();
		int result=service.deleteReport(scheduleNo);
		String msg="";
		String loc="/schedule/scheduleView?scheduleNo="+scheduleNo+"&userId="+userId; 
		if(result>0)
		{
			msg="후기 삭제 성공";
			
		}
		else
		{
			msg="후기 삭제 실패";
			
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/schedule/autoComplete")
	public void autoComplete(String keyword,HttpServletResponse response) throws Exception
	{
		List<String> list=pservice.searchKeyword(keyword);
		Gson gson=new Gson();
		String json = gson.toJson(list);
		response.getWriter().println(json);
	}
	@RequestMapping(value="/imageUpload", method = RequestMethod.POST)
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
}
