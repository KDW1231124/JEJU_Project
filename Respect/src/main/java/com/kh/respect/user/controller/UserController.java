package com.kh.respect.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.respect.user.model.service.UserService;
import com.kh.respect.user.model.vo.User;


@SessionAttributes(value= {"userLoggedIn"})
@Controller
public class UserController {
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService service;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/user/userEnroll.do")
	public ModelAndView userEnroll() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userEnroll");
		return mv;
	}
	
	
	@RequestMapping("/user/checkId.do")
	@ResponseBody
	public String checkId(String userId, Model model) throws JsonProcessingException {
		Map<String,Object> map = new HashMap<String,Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		boolean flag = service.idSelectOne(userId)!=null?true:false;
		
		map.put("flag", flag);
		
		jsonStr=mapper.writeValueAsString(map);//컨버터가 알아서 UTF처리까지 완료해준다 (Json에 쏴주는 형식에 맞춰서 view에 쏴준다)
		return jsonStr;
		
	}
	
	@RequestMapping("/user/checkNick.do")
	@ResponseBody
	public String checkNick(String userNick, Model model) throws JsonProcessingException {
		Map<String,Object> map = new HashMap<String,Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		boolean flag = service.nickSelectOne(userNick)!=null?true:false;
		
		map.put("flag", flag);
		
		jsonStr=mapper.writeValueAsString(map);//컨버터가 알아서 UTF처리까지 완료해준다 (Json에 쏴주는 형식에 맞춰서 view에 쏴준다)
		return jsonStr;
		
	}
	
	@RequestMapping("/user/checkEmail.do")
	@ResponseBody
	public String checkEmail(String userEmail, Model model) throws JsonProcessingException {
		Map<String,Object> map = new HashMap<String,Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		
		boolean flag = service.emailSelectOne(userEmail)!=null?true:false;
		
		map.put("flag", flag);
		
		jsonStr=mapper.writeValueAsString(map);//컨버터가 알아서 UTF처리까지 완료해준다 (Json에 쏴주는 형식에 맞춰서 view에 쏴준다)
		return jsonStr;
		
	}
	
	@RequestMapping(value = "/user/registerEnd", method = RequestMethod.POST)
	public ModelAndView RegisterPost(MultipartFile upFile,User user, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("받아온값 : " + user);
		
		
		logger.info("회원가입...");
		logger.info(user.toString());
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/profile");
		
		File dir=new File(saveDir);
		//경로가 없으면 경로를 만들어랏!!
		if(dir.exists()==false) dir.mkdirs();
		String oriPw=user.getPassword();
		String enPw = bCryptPasswordEncoder.encode(oriPw);
		user.setPassword(enPw);
		
		service.create(user);
		if(!upFile.isEmpty())
		{
			String originalFilename=upFile.getOriginalFilename();
			//확장자 가져오기
			String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			try 
			{
				/*서버의 해당경로에 파일을 저장하는 명령*/
				upFile.transferTo(new File(saveDir+"/"+renamedFileName));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			Map<String,String> map=new HashMap();
			map.put("userId", user.getUserId());
			map.put("renamed", renamedFileName);
			service.profileUpdate(map);
		}
		
		
		rttr.addFlashAttribute("authmsg" , "회원가입이 완료 되었습니다. E-Mail 인증 후에 로그인 해주세요.");
		ModelAndView mv = new ModelAndView();
		String msg = "회원가입이 완료 되었습니다. E-Mail 인증 후에 로그인 해주세요.";
		String loc="/";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping(value = "/user/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception { // 이메일인증
		service.userAuth(email);
		model.addAttribute("email", email);

		return "/user/emailConfirm";
	}
	
	
	@RequestMapping("/user/userLogin.do")
	public String userLogin() {
		return "/user/userLogin";
	}
	
	@RequestMapping(value="/user/loginEnd", method= RequestMethod.POST)
	public ModelAndView loginEnd(String userId, String password, String saveId, HttpServletResponse response) {
		User user = service.idSelectOne(userId);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc="";
		
		if(user!=null) {
			if(bCryptPasswordEncoder.matches(password, user.getPassword())) {
				if(user.getLeaveFlag()==0) {
					if(user.getEmailCheck()==1) {
						msg=user.getUserId()+"님 환영합니다";
                        loc="/";
                        
                        mv.addObject("userLoggedIn",user);
                        if(saveId!=null)
                        {
                           Cookie c= new Cookie("saveId",userId);
                           c.setMaxAge(30*24*60*60);
                           c.setPath("/");
                           response.addCookie(c);
                        }else
                        {
                            Cookie c=new Cookie("saveId",userId);
                            c.setMaxAge(0);
                            c.setPath("/");
                            response.addCookie(c);
                         }
					}else {
						msg="E-Mail 인증 후에 로그인해주세요";
                        loc="/";
					}
				}else {
					msg="탈퇴한 회원입니다";
                    loc="/";
				}
			}else {
				msg="비밀번호를 다시 확인해주세요";
                loc="/user/userLogin.do";
			}
		}else {
			msg="ID를 다시 확인해주세요";
            loc="/user/userLogin.do";
		}
		
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		//넘길뷰화면
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	@RequestMapping("/user/userLogout.do")
	public String userLogout(SessionStatus ss, Model model) {
		
		model.addAttribute("loc","/");
		model.addAttribute("msg","정상적으로 로그아웃 되었습니다.");
		
		if(logger.isDebugEnabled()) {
			logger.debug("로그인아웃 : " + ss);
		}
			//세션있냐??
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "common/msg";
	}
	
	
	@RequestMapping("/user/findPassword.do")
	public String findPassword() {
		return "user/findPassword";
	}
	
	@RequestMapping("/user/findPasswordEnd.do")
	public ModelAndView findPasswordEnd(String userId, String email) throws Exception {
		ModelAndView mv = new ModelAndView();
		User user = service.idSelectOne(userId);
		String msg ="";
		String loc="";
		String newpw="";
		if(user!=null) {
			if(user.getEmail().equals(email)) {
				for(int i =0; i<=6; i++) {
					newpw+=(char)((Math.random() * 26) + 97);
				}for(int i =0; i<=3; i++) {
					newpw+=Integer.toString((int)(Math.random()*9)+1);
				}
				String[] special= {"!","@","#","$","%","^","*","+","=","-"};
				int index = (int)(Math.random()*10)+1;
				newpw+= special[index];
				
				String enPw = bCryptPasswordEncoder.encode(newpw);
				user.setPassword(enPw);
				service.PasswordUpdate(user,newpw);
				msg="임시비밀번호를 E-Mail로 보내드렸습니다.";
				loc ="/";
				
				
			}else {
				msg="E-Mail주소를 다시 확인해주세요.";
				loc="/user/findPassword.do";
			}
		}else {
			msg="ID를 다시 확인해주세요.";
			loc="/user/findPassword.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		
		return mv;
	}
	
	@RequestMapping("/user/userUpdateProfile.do")
	public String myInfoView() {
		return "/user/userUpdateProfile";
		
	}
	
	@RequestMapping("/user/userUpdate.do")
	public String userUpdate(Model model) {
		
		
		return "/user/userUpdate";
	}
	
	
	@RequestMapping("/user/userUpdateEnd.do")
	public ModelAndView userUpdateEnd(User user) {
		ModelAndView mv = new ModelAndView();
		int result = service.updateUserInfo(user);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg="회원정보가 변경되었습니다.";
			loc="/user/userUpdate.do";

			
		}else {
			msg="변경에 실패했습니다.";
			loc="/user/userUpdate.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		
		
		return mv;
	}
	
	@RequestMapping("/user/userUpdatePassword.do")
	public String updatePassword() {
		return "/user/updatePassword";
	}
	
	@RequestMapping("/user/userUpdatePasswordEnd.do")
	public ModelAndView userUpdatePasswordEnd(String userId, String userPw1, String userPw2) {
		ModelAndView mv = new ModelAndView();
		User user = service.idSelectOne(userId);
		String rawPassword=userPw1;
		String encodedPassword=user.getPassword();
		
		String enPw2 = bCryptPasswordEncoder.encode(userPw2);
		String msg = "";
		String loc = "";
	
		if(passwordEncoder.matches(rawPassword, encodedPassword)) {
			Map<String,String> map=new HashMap();
			map.put("userId", userId);
			map.put("enPw2", enPw2);
			int result = service.userUpdatePasswordEnd(map);
			if(result>0) {
				msg = "비밀번호가 변경되었습니다.";
				loc = "/";
			}else {
				msg = "비밀번호 변경에 실패했습니다.";
				loc = "/user/userUpdatePassword.do";
			}
		}else {
			msg = "현재 비밀번호가 다릅니다.";
			loc = "/user/userUpdatePassword.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}

	
	@RequestMapping("/user/userDelete.do")
	public String userDelete() {
		return "/user/userDelete";
	}
	
	@RequestMapping("/user/userDeleteEnd.do")
	public ModelAndView userDeleteEnd(String userId, String password, SessionStatus ss) {
		ModelAndView mv = new ModelAndView();
		User user = service.idSelectOne(userId);
		String rawPassword=password;
		String encodedPassword=user.getPassword();
		
		String msg = "";
		String loc = "";
		if(passwordEncoder.matches(rawPassword, encodedPassword)) {
			
			int result = service.userDeleteEnd(userId);
			if(result>0) {
				msg = "회원탈퇴가 완료되었습니다.";
				loc = "/";
				if(!ss.isComplete()) {
					ss.setComplete();
				}
				
			}else {
				msg = "회원탈퇴 실패입니다.";
				loc = "/user/userDelete.do";
			}
		}else {
			msg = "현재 비밀번호가 다릅니다";
			loc = "/user/userDelete.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/user/userProfileDelete.do")
	public ModelAndView userProfileDelete(@ModelAttribute("userLoggedIn") User oriUser) {
		ModelAndView mv = new ModelAndView();
		String userId = oriUser.getUserId();
		
		String msg = "";
		String loc = "";
		
		
		int result = service.userProfileDelete(userId);
		if(result>0) {
			msg = "프로필사진이 삭제되었습니다.";
			loc = "/user/userUpdateProfile.do";
		}else {
			msg = "프로필삭제 실패했습니다.";
			loc = "/user/userUpdateProfile.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/user/userUpdateProfileEnd.do")
	public ModelAndView userUpdateProfileEnd(MultipartFile upFile, String userId, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/profile");
		
		String msg = "";
		String loc = "";
		
		File dir=new File(saveDir);
		//경로가 없으면 경로를 만들어랏!!
		if(dir.exists()==false) dir.mkdirs();
		
		if(!upFile.isEmpty())
		{
			String originalFilename=upFile.getOriginalFilename();
			//확장자 가져오기
			String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum=(int)(Math.random()*1000);
			String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName+="_"+rndNum+"."+ext;
			try 
			{
				/*서버의 해당경로에 파일을 저장하는 명령*/
				upFile.transferTo(new File(saveDir+"/"+renamedFileName));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			Map<String,String> map=new HashMap();
			map.put("userId", userId);
			map.put("renamed", renamedFileName);
			service.profileUpdate(map);
			msg="프로필사진이 변경되었습니다.";
			loc="/user/userUpdateProfile.do";
		}else {
			msg="사진변경에 실패했습니다.";
			loc = "/user/userUpdateProfile.do";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	
	
	
}
