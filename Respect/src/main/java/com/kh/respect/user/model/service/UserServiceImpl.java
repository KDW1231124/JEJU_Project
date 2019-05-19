package com.kh.respect.user.model.service;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.respect.common.MailHandler;
import com.kh.respect.common.TempKey;
import com.kh.respect.user.model.dao.UserDao;
import com.kh.respect.user.model.vo.User;



@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private JavaMailSender mailSender;

	@Autowired
	UserDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public User idSelectOne(String userId) {
		// TODO Auto-generated method stub
		return dao.idSelectOne(sqlSession,userId);
	}

	@Override
	public User nickSelectOne(String userNick) {
		// TODO Auto-generated method stub
		return dao.nickSelectOne(sqlSession,userNick);
	}

	@Override
	public User emailSelectOne(String userEmail) {
		// TODO Auto-generated method stub
		return dao.emailSelectOne(sqlSession,userEmail);
	}

	@Transactional
	@Override
	public void create(User user) throws Exception{
		dao.insertUser(sqlSession,user); // 회원가입 DAO

		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(sqlSession,user.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[제주도 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:9090/respect/user/emailConfirm?email=").append(user.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("vid8569@gmail.com", "관리자");
		sendMail.setTo(user.getEmail());
		sendMail.send();
		
	}

	@Override
	public void userAuth(String email) throws Exception {
		dao.userAuth(sqlSession,email);
		
	}

	@Override
	public void profileUpdate(Map<String, String> map) {
		dao.profileUpdate(sqlSession,map);
		
	}

	@Override
	public void PasswordUpdate(User user, String newpw) throws Exception {
		dao.PasswordUpdate(sqlSession,user);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[제주도 임시비밀번호입니다.]");
		sendMail.setText(
				new StringBuffer().append("<h1>임시 비밀번호</h1>").append("<br>"+newpw).toString());
		sendMail.setFrom("vid8569@gmail.com", "관리자");
		sendMail.setTo(user.getEmail());
		sendMail.send();
	}

	@Override
	public int updateUserInfo(User user) {
		return dao.updateUserInfo(sqlSession, user);
		
	}

	@Override
	public int userUpdatePasswordEnd(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userUpdatePasswordEnd(sqlSession,map);
	}

	@Override
	public int userDeleteEnd(String userId) {
		// TODO Auto-generated method stub
		return dao.userDeleteEnd(sqlSession, userId);
	}

	@Override
	public int userProfileDelete(String userId) {
		// TODO Auto-generated method stub
		return dao.userProfileDelete(sqlSession, userId);
	}

	
	
	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
