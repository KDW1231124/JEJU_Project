package com.kh.respect.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.respect.user.model.service.UserService;
import com.kh.respect.user.model.vo.User;

public class NewUser extends HandlerInterceptorAdapter{

	@Autowired
	UserService service;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("------------------------------");
		System.out.println("1번");
		HttpSession session = request.getSession();
		System.out.println("2번");
		Object obj = session.getAttribute("userLoggedIn");
		System.out.println("인터셉터에서 obj: " + obj);
		
		System.out.println("modelAndView : " + modelAndView );
		System.out.println("response : " + response);
		

		if(obj!=null&&modelAndView!=null) {

			User u = (User)obj;
			System.out.println("인터셉터에서 아이디 : " + u.getUserId());
			User newUser = service.idSelectOne(u.getUserId());
			
			modelAndView.addObject("userLoggedIn",newUser);
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
}

