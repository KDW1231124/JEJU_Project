package com.kh.respect.place.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;
import com.kh.respect.place.model.service.PlaceService;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceReply;
import com.kh.respect.place.model.vo.PlaceReplyAttachment;
import com.kh.respect.user.model.vo.User;



@Controller
public class PlaceController {
	
	private Logger logger=LoggerFactory.getLogger(PlaceController.class);
	
	@Autowired
	private PlaceService service;
	
	
	@RequestMapping("/spot/mySpotAdd.do")
	public void mySpotAdd(HttpSession session,String myTitle,String myAddr, String myContent,HttpServletResponse response) throws Exception
	{
		User user=(User)session.getAttribute("userLoggedIn");
	    String userId=user.getUserId();
	    
	    System.out.println("유저아이디 : "+userId);
	    System.out.println("제목 : "+myTitle);
	    System.out.println("주소 : "+myAddr);
	    System.out.println("내용 : "+myContent);
	    
	    ModelAndView mv= new ModelAndView();
		Place place = new Place();
		place.setTitle(myTitle);
		place.setUserid(userId);
		place.setAddress(myAddr);
		place.setContent(myContent);
		
		int result = service.insertMySpot(place);
 
		
		
		
		List<Place> list=service.selectUserSpotList(userId,1,5);
		
		
		String html="";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn btn-sm btn-outline-warning mb-2 mr-1' value='"+p.toString()+"' onclick='fn_addUPlace(event)'>일정등록</button></div>";
			html+="<button class='btn btn-sm btn-outline-warning mb-2' value='"+p.toString()+"' onclick='fn_deleteUserPlace(event)'>장소삭제</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(1, 5, service.selectTotalUserCount(userId), 2)+"</nav>";		
		
		response.getWriter().println(html);		
				
	
	}
	
	@RequestMapping("/spot/spotList.do")
	public ModelAndView spotList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		System.out.println("목록페이지(cPage) : "+cPage);
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectSpotList(cPage, numPerPage);
		
		int totalCount = service.selectTotalCount();
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "spotList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}
	
	@RequestMapping("/spot/placeList.do")
	public ModelAndView placeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectPlaceList(cPage, numPerPage);
		
		int totalCount = service.selectPlaceCount();
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "placeList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}
	
	@RequestMapping("/spot/accommList.do")
	public ModelAndView accommList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectAccommList(cPage, numPerPage);
		
		int totalCount = service.selectAccommCount();
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "accommList.do"));
		mv.setViewName("spot/accommList");
		
		return mv;
	}
	
	@RequestMapping("/spot/foodList.do")
	public ModelAndView foodList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectFoodList(cPage, numPerPage);
		
		int totalCount = service.selectFoodCount();
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "foodList.do"));
		mv.setViewName("spot/foodList");
		
		return mv;
	}

	@RequestMapping("/spot/spotEnroll.do")
	public String spotEnroll() {
		return "spot/spotEnroll";
	}
	
	@RequestMapping(value="/spot/spotEnrollEnd.do", method=RequestMethod.POST)
	public ModelAndView spotEnrollEnd(MultipartFile thumbnail, MultipartFile mainimage, HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String majorcategory = request.getParameter("majorcategory");
		String minorcategory = request.getParameter("minorcategory");
		String area = request.getParameter("area");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String content = request.getParameter("content");
		
		Place place = new Place();
		place.setTitle(title);
		place.setMajorcategory(majorcategory);
		place.setMinorcategory(minorcategory);
        place.setArea(area);
		place.setAddress(address);
		place.setPhone(phone);
		place.setContent(content);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/spot/thumbnail");
		String saveDir2 = request.getSession().getServletContext().getRealPath("/resources/upload/spot/mainimage");
		
		System.out.println(saveDir);
		
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setThumbnail(renamedFileName);
		}
		
		if(!mainimage.isEmpty()) {
			String originalFileName = mainimage.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			// 확장자를 구분해냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			
			try {
				// 서버에 해당경로에 파일을 저장하는 명령
				mainimage.transferTo(new File(saveDir2+"/"+renamedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setMainimage(renamedFileName);
		}
		
		int result = service.insertPlace(place);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "등록 성공";
			loc = "/spot/spotList.do";
		}
		else {
			msg = "등록 실패";
			loc = "/spot/spotList.do";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/spot/spotView.do")
	public String selectSpot(int spotno, Model model) {
		
		// 조회수 증가, 중복 증가
		service.updateSpotCnt(spotno);
		
		Place place = service.selectPlace(spotno);
		
		//댓글
		List<Map<String, String>> placeReplyList = service.placeReplyList(spotno);
        List<Map<String, String>> placeAttList = service.placeAttList();
		
        model.addAttribute("placeReplyList",placeReplyList);
        model.addAttribute("placeAttList",placeAttList);
		
		model.addAttribute("place", place);
		
		return "spot/spotView";
	}
	
	@RequestMapping("/spot/spotViewLogin.do")
	public String selectSpot(int spotno, String userid, Model model) {
		
		// 조회수 증가, 중복 증가
		service.updateSpotCnt(spotno);
		
		Place place = service.selectPlace(spotno);
		
		PlaceGood pg = new PlaceGood();
		pg.setUserid(userid);
		pg.setPlaceno(spotno); 
		
		boolean like_ck = true;
		boolean bring_ck = true;
		
		// 좋아요하지 않은 경우
		if(service.selectLike(pg)==null) {
			like_ck = false;
			if(service.selectBring(pg)==null) {
				bring_ck = false;
			}
			else {
				bring_ck = true;
			}
		}
		// 좋아요한 경우
		else {
			like_ck = true;
			if(service.selectBring(pg)==null) {
				bring_ck = false;
			}
			else {
				bring_ck = true;
			}
		}
		
		//댓글
		List<Map<String, String>> placeReplyList = service.placeReplyList(spotno);
	    List<Map<String, String>> placeAttList = service.placeAttList();
		
	    model.addAttribute("placeReplyList",placeReplyList);
	    model.addAttribute("placeAttList",placeAttList);
		
		model.addAttribute("place", place);
		model.addAttribute("like_ck", like_ck);
		model.addAttribute("bring_ck", bring_ck);
		
		return "spot/spotView";
	}
	
	@RequestMapping(value="/spotUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String imageUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws IOException {
		System.out.println("uploadFile :: "+uploadFile[0]);
		ModelAndView mv = new ModelAndView();
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> map = new HashMap();
		
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/spot/spotUpload");
		
		List<String> attList = new ArrayList();
		
		File dir = new File(saveDir);
		// 폴더가 없을경우 생성
		if(dir.exists()==false) {
		   dir.mkdirs();
		}
		
		for(MultipartFile f : uploadFile) {
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
  
      String jsonStr = mapper.writeValueAsString(attList);
      
      return jsonStr;
	}
	
	@RequestMapping("/spot/spotUpdate.do")
	public String spotUpdate(int placeno, Model model) {
		
		Place place = service.selectPlace(placeno);
		
		model.addAttribute("place", place);
		
		return "spot/spotUpdate";
	}
	
	@RequestMapping(value="/spot/spotUpdateEnd.do", method=RequestMethod.POST)
	public ModelAndView spotUpdateEnd(MultipartFile thumbnail, MultipartFile mainimage, HttpServletRequest request) {
		
		String title = request.getParameter("title");
		String majorcategory = request.getParameter("majorcategory");
		String minorcategory = request.getParameter("minorcategory");
		String area = request.getParameter("area");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String content = request.getParameter("content");
		
		Place place = new Place();
		place.setTitle(title);
		place.setMajorcategory(majorcategory);
		place.setMinorcategory(minorcategory);
        place.setArea(area);
		place.setAddress(address);
		place.setPhone(phone);
		place.setContent(content);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/spot/thumbnail");
		String saveDir2 = request.getSession().getServletContext().getRealPath("/resources/upload/spot/mainimage");
		
		System.out.println(saveDir);
		
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setThumbnail(renamedFileName);
		}
		
		if(!mainimage.isEmpty()) {
			String originalFileName = mainimage.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			// 확장자를 구분해냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			
			try {
				// 서버에 해당경로에 파일을 저장하는 명령
				mainimage.transferTo(new File(saveDir2+"/"+renamedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			place.setMainimage(renamedFileName);
		}
		
		int result = service.updatePlace(place);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "수정 성공";
			loc = "/spot/spotList.do";
//			loc = "/spot/spotView.do?spotno="+place.getPlaceno();
		}
		else {
			msg = "수정 실패";
			loc = "/spot/spotList.do";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
//	@RequestMapping(value = "/spot/spotSearchList.do", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> spotSearchList(@RequestBody PlaceSpring place) throws Exception  {
//		
//		System.out.println("목록페이지(cPage) : "+place);
//		
//		return service.spotSearchList(place);
//	}
	
	
	@RequestMapping(value="/spot/like.do", method=RequestMethod.POST)
	@ResponseBody
	public String like(PlaceGood pg) throws Exception {
		
		String userid = pg.getUserid();
		int placeno = pg.getPlaceno(); 
		
		int result = 0;
		String msg = "";
		boolean like_ck = true;
		int like_cnt = 0;
		
		if(service.selectLike(pg)==null) {
			result = service.insertLike(pg);
			service.increaseLike(pg.getPlaceno());
			msg = "좋아요하였습니다.";
			like_ck = true;
		}
		else {
			result = service.deleteLike(pg);
			service.decreaseLike(pg.getPlaceno());
			msg = "좋아요를취소하였습니다.";
			like_ck = false;
		}
		
		like_cnt = service.selectPlaceLikecnt(pg.getPlaceno());
		
		ObjectMapper mapper = new ObjectMapper();
		Map map = new HashMap();
		//ModelAndView mv=new ModelAndView();
//	    obj.put("placeNo", pg.getPlaceno());
//	    obj.put("like_check", like_check);
//	    obj.put("like_cnt", like_cnt);
	    //mv.addObject("msg", msg);
//	    return obj.toString();
		map.put("msg", URLEncoder.encode(msg, "UTF-8"));
		map.put("like_ck", like_ck);
		map.put("like_cnt", like_cnt);
		
		String temp = mapper.writeValueAsString(map);
	    return temp;
	}
	
	@RequestMapping(value="/spot/bring.do", method=RequestMethod.POST)
	@ResponseBody
	public String bring(PlaceGood pg) throws Exception {
		
		String userid = pg.getUserid();
		int placeno = pg.getPlaceno(); 
		
		int result = 0;
		String msg = "";
		boolean bring_ck = true;
		int bring_cnt = 0;
		
		if(service.selectBring(pg)==null) {
			result = service.insertBring(pg);
			service.increaseBring(pg.getPlaceno());
			msg = "찜하였습니다.";
			bring_ck = true;
		}
		
		else {
			result = service.deleteBring(pg);
			service.decreaseBring(pg.getPlaceno());
			msg = "찜을취소하였습니다.";
			bring_ck = false;
		}
		
		bring_cnt = service.selectPlaceBringcnt(pg.getPlaceno());
		
		logger.info("bring_cnt"+bring_cnt);
		
		ObjectMapper mapper = new ObjectMapper();
		Map map = new HashMap();
		map.put("msg", URLEncoder.encode(msg, "UTF-8"));
		map.put("bring_ck", bring_ck);
		map.put("bring_cnt", bring_cnt);
		
		String temp = mapper.writeValueAsString(map);
	    return temp;
	}
	
/*	@RequestMapping(value="/spot/likeAndBring.do", method=RequestMethod.POST)
	@ResponseBody
	public String likeAndBring(PlaceGood pg) throws Exception {
		
		String userid = pg.getUserid();
		int placeno = pg.getPlaceno(); 
		
		boolean like_ck = true;
		boolean bring_ck = true;
		
		// 좋아요하지 않은 경우
		if(service.selectLike(pg)==null) {
			like_ck = false;
			if(service.selectBring(pg)==null) {
				bring_ck = false;
			}
			else {
				bring_ck = true;
			}
		}
		// 좋아요한 경우
		else {
			like_ck = true;
			if(service.selectBring(pg)==null) {
				bring_ck = false;
			}
			else {
				bring_ck = true;
			}
		}
		
		ObjectMapper mapper = new ObjectMapper();
		Map map = new HashMap();
		
		map.put("like_ck", like_ck);
		map.put("bring_ck", bring_ck);
		
		String temp = mapper.writeValueAsString(map);
	    return temp;
	}*/
	
	@RequestMapping("/spot/searchCategoryList.do")
	public ModelAndView searchCategoryList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String minorcategory) {
		
		System.out.println(minorcategory);
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.searchCategoryList(cPage, numPerPage, minorcategory);
		
		int totalCount = service.categoryTotalCount(minorcategory);
		
		mv.addObject("minorcategory", minorcategory);
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "searchCategoryList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}
	
	@RequestMapping("/spot/searchAreaList.do")
	public ModelAndView searchAreaList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String area, String major) {
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.searchAreaList(cPage, numPerPage, area, major);
		
		int totalCount = service.areaTotalCount(area, major);
		
		mv.addObject("area", area);
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "searchAreaList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}
	
	@RequestMapping("/spot/searchfoodCategoryList.do")
	public ModelAndView searchfoodCategoryList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String minorcategory) {
		
		System.out.println(minorcategory);
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.searchCategoryList(cPage, numPerPage, minorcategory);
		
		String majorcategory = list.get(0).getMajorcategory();
		
		int totalCount = service.categoryTotalCount(minorcategory);
		
		mv.addObject("minorcategory", minorcategory);
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "searchfoodCategoryList.do"));
		mv.setViewName("spot/foodList");
		
		return mv;
	}
	
	@RequestMapping("/spot/searchaccommCategoryList.do")
	public ModelAndView searchaccommCategoryList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String minorcategory) {
		
		System.out.println(minorcategory);
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.searchCategoryList(cPage, numPerPage, minorcategory);
		
		String majorcategory = list.get(0).getMajorcategory();
		
		int totalCount = service.categoryTotalCount(minorcategory);
		
		mv.addObject("minorcategory", minorcategory);
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "searchaccommCategoryList.do"));
		mv.setViewName("spot/accommList");
		
		return mv;
	}
	
	@RequestMapping(value="/spot/selectSearchList.do", method = RequestMethod.GET)
	public ModelAndView selectSearchList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String keyword) {	
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 6;
		
		List<Place> list = service.selectSearchList(1, 6 ,keyword);
		
		int totalCount = service.categoryTotalCount(keyword);
		
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar", Page.getPage(cPage, numPerPage, totalCount, "searchCategoryList.do"));
		mv.setViewName("spot/spotList");
		
		return mv;
	}

	   /////////////////// 댓글 /////////////////////////////// 
	   
	   @RequestMapping("/place/placeReplyWrite.do")
	   public ModelAndView placeReplyWrite(PlaceReply placeReply, MultipartFile[] upFile, HttpServletRequest request) {
	      
	      String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/replyPicture");
	      
	      List<PlaceReplyAttachment> attList=new ArrayList();
	      
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
	            PlaceReplyAttachment attach=new PlaceReplyAttachment();
	            attach.setOriginName(originalFilename);
	            attach.setReNamed(renamedFileName);
	            attList.add(attach);
	         }
	      }
	      //파일업로드 끝~~
	      
	      int result=service.placeReplyWrite(placeReply,attList);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="댓글을 등록하였습니다!";
	         loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	      }
	      else{
	         msg="댓글등록에 실패하였습니다";
	         loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   
	   @RequestMapping("/place/placeReplyWrite2.do")
	   public ModelAndView placeReplyWrite2(PlaceReply placeReply) {
	      int result = service.placeReplyWrite2(placeReply);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="답글을 등록하였습니다!";
	         loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	      }
	      else{
	         msg="답글등록에 실패하였습니다";
	         loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	   
	   
	   @RequestMapping("/place/placeReplyDelete.do")
	   public ModelAndView placeReplyDelete(int replyNo, int placeNo) {
	      int result = service.placeReplyDelete(replyNo);
	      String msg="";
	      String loc="";
	      if(result>0) {
	         msg="댓글을 삭제하였습니다!";
	         loc="/spot/spotViewLogin.do?spotno="+placeNo;
	      }else {
	         msg="댓글 삭제에 실패하였습니다.";
	         loc="/spot/spotViewLogin.do?spotno="+placeNo;
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   @RequestMapping("/place/placeReplyGood.do")
	   public ModelAndView placeReplyGood(PlaceReply placeReply) {
	      System.out.println("아이디 : " + placeReply.getUserId());
	      System.out.println("q버놓번호 : " + placeReply.getPlaceNo());
	      int check = service.placeReplyGoodCheck(placeReply);
	      String msg="";
	      String loc="";
	      if(check>0) {
	         msg="이미 추천하셨습니다.";
	         loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	      }else {
	         
	         service.insertplaceReplyGood(placeReply);
	         
	         int result = service.placeReplyGood(placeReply.getReplyNo());   
	         
	         if(result>0) {
	            msg="추천을 하였습니다!";
	            loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	         }else {
	            msg="추천에 실패하였습니다.";
	            loc="/spot/spotViewLogin.do?spotno="+placeReply.getPlaceNo()+"&userid="+placeReply.getUserId();
	         }
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	
	
}
