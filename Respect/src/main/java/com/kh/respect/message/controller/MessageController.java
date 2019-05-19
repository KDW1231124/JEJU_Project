package com.kh.respect.message.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.Page;
import com.kh.respect.common.PageS;
import com.kh.respect.message.model.service.MessageService;
import com.kh.respect.user.model.service.UserService;
import com.kh.respect.user.model.vo.User;

@SessionAttributes(value= {"userLoggedIn"})
@Controller
public class MessageController {

	
	@Autowired
	MessageService service;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/message/receiveMessageList.do")
	public ModelAndView receiveMessageList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,String userId) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		mv.addObject("receiveMessageList",service.receiveMessageList(userId,cPage,numPerPage));
		int totalCount = service.receiveMessageTotalCount(userId);
		mv.addObject("receiveMessageTotalCount", totalCount);
		mv.addObject("pageBar",PageS.getPage(cPage, numPerPage, totalCount, "receiveMessageList.do", userId));
		mv.addObject("cPage",cPage);
		mv.setViewName("/message/receiveMessageList");
		return mv;
		
	}
	
	@RequestMapping("/message/receiveMessageView.do")
	public String receiveMessageView(int msgNo, int cPage, Model model) {
		model.addAttribute("message",service.receiveMessageView(msgNo));
		model.addAttribute("cPage", cPage);
		return "/message/receiveMessageView";
		
	}
	
	@RequestMapping("/message/writeMessageList.do")
	public ModelAndView writeMessageList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,String userId) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		mv.addObject("writeMessageList",service.writeMessageList(userId,cPage,numPerPage));
		int totalCount = service.writeMessageTotalCount(userId);
		mv.addObject("writeMessageTotalCount", totalCount);
		mv.addObject("pageBar",PageS.getPage(cPage, numPerPage, totalCount, "writeMessageList.do", userId));
		mv.addObject("cPage",cPage);
		mv.setViewName("/message/writeMessageList");
		return mv;
		
	}
	
	@RequestMapping("/message/writeMessageView.do")
	public String writeMessageView(int msgNo, int cPage, Model model) {
		model.addAttribute("message",service.writeMessageView(msgNo));
		model.addAttribute("cPage", cPage);
		
		return"/message/writeMessageView";
		
	}
	
	@RequestMapping("/message/sendMessage.do")
	public String sendMessage() {
		return "/message/sendMessage";
	}
	
	@RequestMapping("/message/sendMessageEnd.do")
	public ModelAndView sendMessageEnd(String receiverNick, String messageTitle, String messageContent, String writeId) {
		ModelAndView mv=new ModelAndView();
		String msg = "";
		String loc = "/message/sendMessage.do"; 
		
		User receiverUser = userService.nickSelectOne(receiverNick);
		Map<String,String> map=new HashMap();
		map.put("writeId", writeId);
		map.put("receiveId", receiverUser.getUserId());
		map.put("title", messageTitle);
		map.put("content", messageContent);
		int result = service.sendMessageEnd(map);
		if(result>0) {
			msg = "쪽지가 전송되었습니다.";
			
		}else {
			msg = "쪽지전송에 실패했습니다.";
			
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	@RequestMapping("/message/messageAnswer.do")
	public String messageAnswer(String receiverNick, Model model) {
		model.addAttribute("receiverNick",receiverNick);
		return "/message/messageAnswer";
	}
	
	@RequestMapping("/message/receiveMessageDelete.do")
	public ModelAndView receiveMessageDelete(String val, String userId, int cPage ) {
		ModelAndView mv = new ModelAndView();
		String[] arr = val.split(",");
		int allDel = 0;
		for(int i = 0; i<arr.length; i++) {
			int msgNo = Integer.parseInt(arr[i]);
			int result = service.receiveMessageDelete(msgNo);
			if(result>0) {
				allDel+=1;
			}
		}
		
		mv.addObject("msg","총 "+allDel+"개의 메세지를 삭제했습니다.");
		mv.addObject("loc","/message/receiveMessageList.do?userId="+userId+"&cPage="+cPage);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	@RequestMapping("/message/wrtieMessageDelete.do")
	public ModelAndView wrtieMessageDelete(String val, String userId, int cPage ) {
		ModelAndView mv = new ModelAndView();
		String[] arr = val.split(",");
		int allDel = 0;
		for(int i = 0; i<arr.length; i++) {
			int msgNo = Integer.parseInt(arr[i]);
			int result = service.wrtieMessageDelete(msgNo);
			if(result>0) {
				allDel+=1;
			}
		}
		mv.addObject("msg","총 "+allDel+"개의 메세지를 삭제했습니다.");
		mv.addObject("loc","/message/writeMessageList.do?userId="+userId+"&cPage="+cPage);
		mv.setViewName("common/msg");
		return mv;
	}
}


