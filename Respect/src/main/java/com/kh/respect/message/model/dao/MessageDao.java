package com.kh.respect.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.message.model.vo.Message;

public interface MessageDao {

	List<Map<String, String>> receiveMessageList(SqlSessionTemplate sqlSession, String userId, int cPage,
			int numPerPage);

	int receiveMessageTotalCount(SqlSessionTemplate sqlSession, String userId);

	Message receiveMessageView(SqlSessionTemplate sqlSession, int msgNo);

	void readFlagChange(SqlSessionTemplate sqlSession, int msgNo);

	List<Map<String, String>> writeMessageList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);

	int writeMessageTotalCount(SqlSessionTemplate sqlSession, String userId);

	Message writeMessageView(SqlSessionTemplate sqlSession, int msgNo);

	int sendMessageEnd(SqlSessionTemplate sqlSession, Map<String, String> map);

	int receiveMessageDelete(SqlSessionTemplate sqlSession, int msgNo);

	int wrtieMessageDelete(SqlSessionTemplate sqlSession, int msgNo);

}
