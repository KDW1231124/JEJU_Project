package com.kh.respect.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.message.model.vo.Message;
import com.kh.respect.user.model.vo.User;

public interface UserDao {

	User idSelectOne(SqlSessionTemplate sqlSession, String userId);

	User nickSelectOne(SqlSessionTemplate sqlSession, String userNick);

	User emailSelectOne(SqlSessionTemplate sqlSession, String userEmail);

	void insertUser(SqlSessionTemplate sqlSession, User user) throws Exception;

	void createAuthKey(SqlSessionTemplate sqlSession, String email, String user_authCode) throws Exception;

	void userAuth(SqlSessionTemplate sqlSession, String email) throws Exception;

	void profileUpdate(SqlSessionTemplate sqlSession, Map<String, String> map);

	void PasswordUpdate(SqlSessionTemplate sqlSession, User user) throws Exception;

	int updateUserInfo(SqlSessionTemplate sqlSession, User user);

	int userUpdatePasswordEnd(SqlSessionTemplate sqlSession, Map<String, String> map);

	int userDeleteEnd(SqlSessionTemplate sqlSession, String userId);

	int userProfileDelete(SqlSessionTemplate sqlSession, String userId);





	

}
