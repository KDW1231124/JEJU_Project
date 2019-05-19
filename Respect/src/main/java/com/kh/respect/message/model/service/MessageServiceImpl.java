package com.kh.respect.message.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.message.model.dao.MessageDao;
import com.kh.respect.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String,String>> receiveMessageList(String userId, int cPage, int numPerPage) {
		
		return dao.receiveMessageList(sqlSession, userId, cPage, numPerPage);
	}

	@Override
	public int receiveMessageTotalCount(String userId) {
		
		return dao.receiveMessageTotalCount(sqlSession,userId);
	}

	@Override
	public Message receiveMessageView(int msgNo) {
		dao.readFlagChange(sqlSession,msgNo);
		return dao.receiveMessageView(sqlSession,msgNo);
	}

	@Override
	public List<Map<String, String>> writeMessageList(String userId, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.writeMessageList(sqlSession, userId, cPage, numPerPage);
	}

	@Override
	public int writeMessageTotalCount(String userId) {
		
		return dao.writeMessageTotalCount(sqlSession,userId);
	}

	@Override
	public Message writeMessageView(int msgNo) {
		
		return dao.writeMessageView(sqlSession,msgNo);
	}

	@Override
	public int sendMessageEnd(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.sendMessageEnd(sqlSession, map);
	}

	@Override
	public int receiveMessageDelete(int msgNo) {
		// TODO Auto-generated method stub
		return dao.receiveMessageDelete(sqlSession,msgNo);
	}

	@Override
	public int wrtieMessageDelete(int msgNo) {
		// TODO Auto-generated method stub
		return dao.wrtieMessageDelete(sqlSession,msgNo);
	}
	
	
	
	
	
	
}
