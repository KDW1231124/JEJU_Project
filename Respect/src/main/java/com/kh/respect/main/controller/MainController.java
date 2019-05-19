package com.kh.respect.main.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.ImgExtract;
import com.kh.respect.main.model.service.MainService;
import com.kh.respect.place.model.vo.Place;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/mainPage")
	public ModelAndView placeMainList(ModelAndView mv){
		
		List<Place> slist = service.selectMspList();
		List<Place> tlist = service.selectMtpList();
		List<Map<String, String>> mlist = service.selectMmpList();
		List<Map<String, String>> nlist = service.selectMnpList();
		List<Map<String, String>> clist = service.selectMcpList();
		
		ImgExtract ie=new ImgExtract();
		
//		System.out.println(ie.imgExtract("<img src='/respect/resources/uploadImg/20180918_164442203_5777.jpg' data-filename='20180918_164442203_5777.jpg' style='width: 513px;'>"));
		
		mv.addObject("slist", slist);
		mv.addObject("tlist", tlist);
		mv.addObject("mlist", mlist);
		mv.addObject("nlist", nlist);
		mv.addObject("clist", clist);
		mv.addObject("ie", ie);
		mv.setViewName("main/main");
		
		return mv;
	}
	
	
	
	

}
