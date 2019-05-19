package com.kh.respect.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.Page;
import com.kh.respect.notice.model.service.NoticeService;
import com.kh.respect.notice.model.vo.Attachment;
import com.kh.respect.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	
	
	@RequestMapping("/notice/notice-board.do")
	public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		
		List<Map<String, String>> list = service.selectNoticeList(cPage, numPerPage);
		int totalCount=service.selectTotalCount();
		String pageBar=Page.getPage(cPage, numPerPage, totalCount, "notice-board.do");
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar",pageBar);
		mv.setViewName("notice/notice-board");
		return mv;
		
	}
	
	@RequestMapping("/notice/notice-view.do")
	public String noticeView(Model model, int noticeNo, HttpServletRequest request, HttpServletResponse response) {
		
		//조회수 같은계정 한번만 증가
		//client가 보낸 쿠키 확인
		Cookie[] cookie=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;
		if(cookie!=null) {
			outer:
				for(Cookie c:cookie) {
					String name = c.getName();
					String value=c.getValue();
					if("boardCookie".equals(name)) {
						boardCookieVal=value;
						if(value.contains("|"+noticeNo+"|")) { //읽언던적이있따면?
							hasRead=true;
							break outer;
						}
					}
				}
		}
		
		//읽지 않았다면 쿠키를 만들어서 저장
		if(!hasRead) {
			Cookie boardCookie=new Cookie("boardCookie",boardCookieVal+"|"+noticeNo+"|"); //10||20||30|
			//session끊어지면 지우기!
			//브라우저 끊어져야 삭제
			boardCookie.setMaxAge(-1);
			
			response.addCookie(boardCookie);
		}
		
		int result = service.insertNoticeCount(noticeNo,hasRead);
		
		
		List<Notice> list = service.selectNoticeView(noticeNo);
		model.addAttribute("attachmentList",service.selectAttach(noticeNo));
		
		model.addAttribute("list",list);
		
		return "notice/notice-view";
	}
	
	@RequestMapping("/notice/noticeWrite.do")
	public String noticeWrite() {
		
		return "notice/notice-write";
	}
	
	
	@RequestMapping("/notice/noticeWriteEnd.do")
	public ModelAndView insertNotice(Notice notice, MultipartFile upFile, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		List<Attachment> attList = new ArrayList();
		
		File dir = new File(saveDir);
		//경로 없을때 만든다
		if(dir.exists()==false) {
			
			dir.mkdirs();
		}
		
		System.out.println(upFile);
			
			if(!upFile.isEmpty()) {
					String originalFileName=upFile.getOriginalFilename();
					//bs.html .뒤에부터 잘라낸다 확장자(html)만 받음
					String ext=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
					int rndNum=(int)(Math.random()*1000);
					//현재시간을 기준으로 들어감
					String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
					renamedFileName+="_"+rndNum+"."+ext;
					try {
						
						//서버에 해당 경로에 파일을 저장하는 명령
						upFile.transferTo(new File(saveDir+"/"+renamedFileName));
					}catch (Exception e) {
						e.printStackTrace();
					}
					
					Attachment attach=new Attachment();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attList.add(attach);
					
				}
		//파일 업로드 끝~
		int result=service.insertNotice(notice,attList);
		
		String msg="";
		String loc="";
		if(result>0) {
			
			msg="파일등록 완료!";
			loc="/notice/notice-view.do?noticeNo="+notice.getNoticeNo();
		}
		else {
			msg="파일등록 실패!";
			loc="/notice/notice-board.do";
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	@RequestMapping("/notice/fileDownload.do")
	public void fileDownload(String oName, String rName, HttpServletRequest request, HttpServletResponse response) {
		
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		File saveFile=new File(saveDir+"/"+rName);
		try {
			
			FileInputStream fis = new FileInputStream(saveFile);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			String resFileName="";
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||request.getHeader("user-agent").indexOf("Trident")!=-1;
			
			if(isMSIE) {
				resFileName = URLEncoder.encode(oName, "UTF-8");
				resFileName = resFileName.replaceAll("\\+", "%20");
				
			}else {
				
				resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
				
			}
			
			response.setContentType("application/otect-stream;charset=utf-8");
			response.addHeader("content-Disposition", "attachment;filename=\""+resFileName+"\"");
			
			int read=0;
			while((read=bis.read())!=-1) {
				
				sos.write(read);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
			try {
				sos.close();
				bis.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/notice/notice-del.do")
	public ModelAndView deleteNotice(int noticeNo) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = service.deleteNotice(noticeNo);
		
		String msg="";
		String loc="";
		if(result>0) {
			
			msg="삭제 완료!";
			loc="/notice/notice-board.do";
		}
		else {
			msg="삭제 실패!";
			loc="/notice/notice-board.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	@RequestMapping("/notice/noticeSearch")
	public ModelAndView noticeSearch(ModelAndView mv, String searchText, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		
		int numPerPage = 10;
		List<Map<String, String>> list = service.searchList(cPage, numPerPage, searchText);
		int totalCount=service.selectTotalCount();
		String pageBar=Page.getPage(cPage, numPerPage, totalCount, "notice-board.do");
		mv.addObject("list", list);
		mv.addObject("totalContents", totalCount);
		mv.addObject("pageBar",pageBar);
		mv.setViewName("notice/notice-board");
		return mv;
		
	}
	
	
	@RequestMapping("/notice/traffic-board.do")
	public String trafficView() {
		
		return "traffic/traffic-view";
		
	}
	
	
}
