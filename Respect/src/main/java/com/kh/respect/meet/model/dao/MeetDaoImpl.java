package com.kh.respect.meet.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;

@Repository
public class MeetDaoImpl implements MeetDao {

	@Override
	public List<Map<String, String>> selectMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		
		return sqlSession.selectList("meet.selectMeetList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meet.selectTotalCount");
	}

	@Override
	public int insertMeet(SqlSessionTemplate sqlSession, Meet meet) {
		return sqlSession.insert("meet.insertMeet", meet);
	}

	@Override
	public List<Map<String, String>> searchMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String start, String end, String area) {
		Map<String, String> map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("area", area);
		
		return sqlSession.selectList("meet.searchMeetList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
		
	}

	@Override
	public Meet selectOne(SqlSessionTemplate sqlSession, int meetNo) {
		return sqlSession.selectOne("meet.selectOne", meetNo);
	}

	@Override
	public int meetDelete(SqlSessionTemplate sqlSession, int meetNo) {
		return sqlSession.delete("meet.meetDelete", meetNo);
	}

	@Override
	public int meetUpdate(SqlSessionTemplate sqlSession, Meet meet) {
		return sqlSession.update("meet.meetUpdate", meet);
	}

	@Override
	public void updateMeetCnt(SqlSessionTemplate sqlSession, int meetNo) {
		sqlSession.update("meet.updateMeetCnt", meetNo);
	}
	
	/////////////   댓글     ////////////////
	@Override
	public List<Map<String, String>> meetReplyList(SqlSessionTemplate sqlSession, int meetNo) {
		return sqlSession.selectList("meet.meetReplyList", meetNo);
	}

	@Override
	public List<Map<String, String>> meetAttList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("meet.meetAttList");
	}

	@Override
	public int meetReplyWrite(SqlSessionTemplate sqlSession, MeetReply meetReply) {
		return sqlSession.insert("meet.meetReplyWrite", meetReply);
	}

	@Override
	public void meetReplyCountUpdate(SqlSessionTemplate sqlSession, int meetNo) {
		sqlSession.update("meet.meetReplyCountUpdate", meetNo);
	}

	@Override
	public int insertMeetReplyAttach(SqlSessionTemplate sqlSession, MeetReplyAttachment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("meet.insertMeetReplyAttach", a);
	}

	@Override
	public int meetReplyWrite2(SqlSessionTemplate sqlSession, MeetReply meetReply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("meet.meetReplyWrite2",meetReply);
	}

	@Override
	public void meetReplyReplyCountUpdate(SqlSessionTemplate sqlSession, int replyRefNo) {
		sqlSession.update("meet.meetReplyReplyCountUpdate", replyRefNo);
	}

	@Override
	public int meetReplyDelete(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.delete("meet.meetReplyDelete",replyNo);
	}

	@Override
	public int meetReplyGood(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("meet.meetReplyGood",replyNo);
	}

	@Override
	public int meetReplyGoodCheck(SqlSessionTemplate sqlSession, MeetReply meetReply) {
		return sqlSession.selectOne("meet.meetReplyGoodCheck", meetReply);
	}

	@Override
	public void insertmeetReplyGood(SqlSessionTemplate sqlSession, MeetReply meetReply) {
		sqlSession.insert("meet.insertmeetReplyGood", meetReply);
	}
	
	
	

}
