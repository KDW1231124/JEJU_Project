package com.kh.respect.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.respect.message.model.vo.Message;
import com.kh.respect.user.controller.UserController;
import com.kh.respect.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Override
	public User idSelectOne(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("user.idSelectOne",userId);
	}

	@Override
	public User nickSelectOne(SqlSessionTemplate sqlSession, String userNick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.nickSelectOne",userNick);
	}

	@Override
	public User emailSelectOne(SqlSessionTemplate sqlSession, String userEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.emailSelectOne",userEmail);
	}

	@Override
	public void insertUser(SqlSessionTemplate sqlSession, User user) throws Exception{
		// TODO Auto-generated method stub

		logger.info("dao "+user);
		System.out.println("DAO 로그 : 회원가입 중");
		sqlSession.insert("user.insertUser", user);
//			System.out.println(vo.toString());
		
	}

	@Override
	public void createAuthKey(SqlSessionTemplate sqlSession, String email, String user_authCode) throws Exception{
		User user = new User();
		user.setEmailHash(user_authCode);
		user.setEmail(email);

		sqlSession.selectOne("user.createAuthKey", user);
		
	}

	@Override
	public void userAuth(SqlSessionTemplate sqlSession, String email) throws Exception {
		sqlSession.update("user.userAuth", email);
		
	}

	@Override
	public void profileUpdate(SqlSessionTemplate sqlSession, Map<String, String> map) {
		
		sqlSession.update("user.profileUpdate", map);
	}

	@Override
	public void PasswordUpdate(SqlSessionTemplate sqlSession, User user) throws Exception{
		sqlSession.update("user.PasswordUpdate", user);
	}

	@Override
	public int updateUserInfo(SqlSessionTemplate sqlSession, User user) {
		return sqlSession.update("user.updateUserInfo",user);		
	}

	@Override
	public int userUpdatePasswordEnd(SqlSessionTemplate sqlSession, Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.userUpdatePasswordEnd", map);
	}

	@Override
	public int userDeleteEnd(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.userDeleteEnd",userId);
	}

	@Override
	public int userProfileDelete(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.userProfileDelete",userId);
	}



	
	
	
	
	
	
	
	
	
	

}
