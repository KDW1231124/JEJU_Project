package com.kh.respect.mySchedule.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.PageS;
import com.kh.respect.mySchedule.model.service.MyScheduleService;
import com.kh.respect.mySchedule.model.vo.Delete;
import com.kh.respect.place.model.vo.Place;

@Controller
public class MyScheduleController {
	@Autowired
	MyScheduleService service;
	
	@RequestMapping("/mySchedule/allMySchedule.do")
	public ModelAndView allMySchedule(String userId) {
		ModelAndView mv = new ModelAndView();
		
		int myScheduleNum = service.myScheduleNum(userId);
		int putScheduleNum = service.putScheduleNum(userId);
		int putPlaceNum = service.putPlaceNum(userId);
		int myScheduleReportNum = service.myScheduleReportNum(userId);
		
		List<Map<String, String>> myScheduleList=service.myScheduleListRowTwo(userId);
		List<Map<String, String>> putScheduleList=service.putScheduleListRowTwo(userId);
		List<Map<String, String>> putPlaceList=service.putPlaceListRowTwo(userId);
		List<Map<String, String>> myScheduleReportList=service.myScheduleReportListRowTwo(userId);
		
		mv.addObject("myScheduleNum",myScheduleNum);
		mv.addObject("putScheduleNum",putScheduleNum);
		mv.addObject("putPlaceNum",putPlaceNum);
		mv.addObject("myScheduleReportNum",myScheduleReportNum);
		mv.addObject("myScheduleList",myScheduleList);
		mv.addObject("putScheduleList",putScheduleList);
		mv.addObject("putPlaceList",putPlaceList);
		mv.addObject("myScheduleReportList",myScheduleReportList);
		
		mv.setViewName("/mySchedule/allMySchedule");
		
		return mv;
	}
	
	@RequestMapping("/mySchedule/myScheduleList.do")
	public ModelAndView myScheduleList(String userId, String sort) {
		ModelAndView mv = new ModelAndView();
		int myScheduleNum = service.myScheduleNum(userId);
		int putScheduleNum = service.putScheduleNum(userId);
		int putPlaceNum = service.putPlaceNum(userId);
		int myScheduleReportNum = service.myScheduleReportNum(userId);
		List<Map<String, String>> myScheduleList = null;
		
		
		
		if(sort.equals("all")) {
			myScheduleList=service.myScheduleList(userId);
		}else if(sort.equals("before")) {
			myScheduleList=service.myScheduleListBefore(userId);
		}else if(sort.equals("ing")) {
			myScheduleList=service.myScheduleListIng(userId);
		}else if(sort.equals("after")) {
			myScheduleList=service.myScheduleListAfter(userId);
		}
		
		
		mv.addObject("myScheduleNum",myScheduleNum);
		mv.addObject("putScheduleNum",putScheduleNum);
		mv.addObject("putPlaceNum",putPlaceNum);
		mv.addObject("myScheduleReportNum",myScheduleReportNum);
		mv.addObject("myScheduleList",myScheduleList);
		mv.addObject("sort",sort);
		
		mv.setViewName("/mySchedule/myScheduleList");
		
		return mv;
	}
	
	@RequestMapping("/mySchedule/myScheduleDelete.do")
	public ModelAndView myScheduleDelete(int scheduleNo,String userId, String sort) {
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/mySchedule/myScheduleList.do?userId="+userId+"&sort="+sort;
		
		int result = service.myScheduleDelete(scheduleNo);
		if(result>0) {
			msg="나의 여행일정이 삭제되었습니다.";
		}else {
			msg="삭제에 실패했습니다.";
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	@RequestMapping("/mySchedule/putScheduleList.do")
	public ModelAndView putScheduleList(String userId) {
		ModelAndView mv = new ModelAndView();
		int myScheduleNum = service.myScheduleNum(userId);
		int putScheduleNum = service.putScheduleNum(userId);
		int putPlaceNum = service.putPlaceNum(userId);
		int myScheduleReportNum = service.myScheduleReportNum(userId);
		List<Map<String, String>> putScheduleList =service.putScheduleList(userId);
		
		mv.addObject("myScheduleNum",myScheduleNum);
		mv.addObject("putScheduleNum",putScheduleNum);
		mv.addObject("putPlaceNum",putPlaceNum);
		mv.addObject("myScheduleReportNum",myScheduleReportNum);
		
		mv.addObject("putScheduleList",putScheduleList);
		mv.setViewName("/mySchedule/putScheduleList");
		
		return mv;
		
	}
	
	@RequestMapping("/mySchedule/putPlaceList.do")
	public ModelAndView putPlaceList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,String userId) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=8;
		List<Place> putPlaceList =service.putPlaceList(userId,cPage,numPerPage);
		
		mv.addObject("putPlaceList",putPlaceList);
		int totalCount = service.putPlaceListTotalCount(userId);
		mv.addObject("putPlaceListTotalCount", totalCount);
		mv.addObject("pageBar",PageS.getPage(cPage, numPerPage, totalCount, "putPlaceList.do", userId));
		mv.addObject("cPage",cPage);
		
		
		int myScheduleNum = service.myScheduleNum(userId);
		int putScheduleNum = service.putScheduleNum(userId);
		int putPlaceNum = service.putPlaceNum(userId);
		int myScheduleReportNum = service.myScheduleReportNum(userId);
		
		//주소를 담을 배열
		List<String> addList = new ArrayList<String>();
		for(int i = 0; i<putPlaceList.size(); i++) {
			
			String address = putPlaceList.get(i).getAddress();
			addList.add(address);
		}
		
		
		mv.addObject("addList",addList);
		mv.addObject("myScheduleNum",myScheduleNum);
		mv.addObject("putScheduleNum",putScheduleNum);
		mv.addObject("putPlaceNum",putPlaceNum);
		mv.addObject("myScheduleReportNum",myScheduleReportNum);
		
		mv.setViewName("/mySchedule/putPlaceList");
		
		return mv;
		
	}
	
	@RequestMapping("/mySchedule/myScheduleReportList.do")
	public ModelAndView myScheduleReport(String userId) {
		
		ModelAndView mv = new ModelAndView();
		int myScheduleNum = service.myScheduleNum(userId);
		int putScheduleNum = service.putScheduleNum(userId);
		int putPlaceNum = service.putPlaceNum(userId);
		int myScheduleReportNum = service.myScheduleReportNum(userId);
		List<Map<String, String>> myScheduleReport =service.myScheduleReport(userId);
		
		mv.addObject("myScheduleNum",myScheduleNum);
		mv.addObject("putScheduleNum",putScheduleNum);
		mv.addObject("putPlaceNum",putPlaceNum);
		mv.addObject("myScheduleReportNum",myScheduleReportNum);
		
		mv.addObject("myScheduleReport",myScheduleReport);
		mv.setViewName("/mySchedule/myScheduleReportList");
		
		return mv;
		
	}
	
	@RequestMapping("/mySchedule/myScheduleReportDelete.do")
	public ModelAndView myScheduleReportDelete(int reportNo,String userId) {
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/mySchedule/myScheduleReportList.do?userId="+userId;
		
		
		int result = service.myScheduleReportDelete(reportNo);
		if(result>0) {
			msg="찜한 여행일정이 삭제되었습니다.";
		}else {
			msg="삭제에 실패했습니다.";
		}
		
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/mySchedule/putPlaceDelete.do")
	public ModelAndView putPlaceDelete(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,int placeNo,String userId) {
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/mySchedule/putPlaceList.do?cPage="+cPage+"&userId="+userId;
		
		Delete del = new Delete(placeNo,userId);
		
		int result = service.putPlaceDelete(del);
		if(result>0) {
			msg="찜한 여행지가 삭제되었습니다.";
		}else {
			msg="삭제에 실패했습니다.";
		}
		
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	@RequestMapping("/mySchedule/putScheduleDelete.do")
	public ModelAndView putScheduleDelete(int scheduleNo,String userId) {
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/mySchedule/putScheduleList.do?userId="+userId;
		
		Delete del = new Delete(scheduleNo,userId);
		
		int result = service.putScheduleDelete(del);
		if(result>0) {
			msg="찜한 일정이 삭제되었습니다.";
		}else {
			msg="삭제에 실패했습니다.";
		}
		
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	
}
