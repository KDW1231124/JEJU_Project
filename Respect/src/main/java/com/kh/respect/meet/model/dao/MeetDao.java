package com.kh.respect.meet.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;

public interface MeetDao {
	
	List<Map<String,String>> selectMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	
	int insertMeet(SqlSessionTemplate sqlSession, Meet meet);
	
	List<Map<String,String>> searchMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String start, String end, String area);
	
	Meet selectOne(SqlSessionTemplate sqlSession, int meetNo);
	
	int meetDelete(SqlSessionTemplate sqlSession, int meetNo);
	
	int meetUpdate(SqlSessionTemplate sqlSession, Meet meet);
	
	void updateMeetCnt(SqlSessionTemplate sqlSession, int meetNo);
	
	//댓글
	int meetReplyWrite(SqlSessionTemplate sqlSession, MeetReply meetReply);
	void meetReplyCountUpdate(SqlSessionTemplate sqlSession, int meetNo);
	int insertMeetReplyAttach(SqlSessionTemplate sqlSession, MeetReplyAttachment a);
	int meetReplyWrite2(SqlSessionTemplate sqlSession, MeetReply meetReply);
	void meetReplyReplyCountUpdate(SqlSessionTemplate sqlSession, int replyRefNo);
	int meetReplyDelete(SqlSessionTemplate sqlSession, int replyNo);
	int meetReplyGood(SqlSessionTemplate sqlSession, int replyNo);
	int meetReplyGoodCheck(SqlSessionTemplate sqlSession, MeetReply meetReply);
	void insertmeetReplyGood(SqlSessionTemplate sqlSession, MeetReply meetReply);
	List<Map<String, String>> meetReplyList(SqlSessionTemplate sqlSession, int meetNo);
	List<Map<String, String>> meetAttList(SqlSessionTemplate sqlSession);
	
	
	
}
