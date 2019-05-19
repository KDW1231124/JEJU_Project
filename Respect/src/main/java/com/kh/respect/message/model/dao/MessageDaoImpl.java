package com.kh.respect.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Override
	public List<Map<String, String>> receiveMessageList(SqlSessionTemplate sqlSession, String userId, int cPage,
			int numPerPage) {
		
		return sqlSession.selectList("message.receiveMessageList",userId,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int receiveMessageTotalCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.receiveMessageTotalCount",userId);
	}
	
	

	@Override
	public void readFlagChange(SqlSessionTemplate sqlSession, int msgNo) {
		sqlSession.update("message.readFlagChange",msgNo);
		
	}

	@Override
	public Message receiveMessageView(SqlSessionTemplate sqlSession, int msgNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.receiveMessageView",msgNo);
	}

	@Override
	public List<Map<String, String>> writeMessageList(SqlSessionTemplate sqlSession, String userId, int cPage,
			int numPerPage) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.writeMessageList",userId,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int writeMessageTotalCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.writeMessageTotalCount",userId);
	}

	@Override
	public Message writeMessageView(SqlSessionTemplate sqlSession, int msgNo) {
		
		return sqlSession.selectOne("message.writeMessageView",msgNo);
	}

	@Override
	public int sendMessageEnd(SqlSessionTemplate sqlSession, Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("message.sendMessageEnd",map);
	}

	@Override
	public int receiveMessageDelete(SqlSessionTemplate sqlSession, int msgNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("message.receiveMessageDelete",msgNo);
	}

	@Override
	public int wrtieMessageDelete(SqlSessionTemplate sqlSession, int msgNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("message.wrtieMessageDelete",msgNo);
	}
	
	
	
	
	
	

}
