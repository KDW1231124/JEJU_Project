package com.kh.respect.user.model.service;

import java.util.Map;

import javax.mail.MessagingException;

import com.kh.respect.user.model.vo.User;

public interface UserService {

	User idSelectOne(String userId);

	User nickSelectOne(String userNick);

	User emailSelectOne(String userEmail);

	void create(User user) throws Exception;

	void userAuth(String email) throws Exception;

	void profileUpdate(Map<String, String> map);

	void PasswordUpdate(User user, String newpw) throws Exception;

	int updateUserInfo(User user);

	int userUpdatePasswordEnd(Map<String, String> map);

	int userDeleteEnd(String userId);

	int userProfileDelete(String userId);


	
	


}
