package com.kh.respect.meet.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.meet.model.dao.MeetDao;
import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;

@Service
public class MeetServiceImpl implements MeetService {

	@Autowired
	MeetDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectMeetList(int cPage, int numPerPage) {
		
		return dao.selectMeetList(sqlSession, cPage, numPerPage);
	}


	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sqlSession);
	}


	@Override
	public int insertMeet(Meet meet) {
		int result = dao.insertMeet(sqlSession, meet);
		return result;
	}


	@Override
	public List<Map<String, String>> searchMeetList(int cPage, int numPerPage, String start, String end, String area) {
		return dao.searchMeetList(sqlSession, cPage, numPerPage, start, end, area);
	}


	@Override
	public Meet selectOne(int meetNo) {
		return dao.selectOne(sqlSession, meetNo);
	}


	@Override
	public int meetDelete(int meetNo) {
		return dao.meetDelete(sqlSession, meetNo);
	}


	@Override
	public int meetUpdate(Meet meet) {
		return dao.meetUpdate(sqlSession, meet);
	}


	@Override
	public void updateMeetCnt(int meetNo) {
		dao.updateMeetCnt(sqlSession, meetNo);
	}


	@Override
	public List<Map<String, String>> meetReplyList(int meetNo) {
		return dao.meetReplyList(sqlSession, meetNo);
	}


	@Override
	public List<Map<String, String>> meetAttList() {
		return dao.meetAttList(sqlSession);
	}


	@Override
	public int meetReplyWrite(MeetReply meetReply, List<MeetReplyAttachment> attList) {
		int result = 0;
		int meetNo=0;
		int replyNo=0;
		meetNo = meetReply.getMeetNo();
		dao.meetReplyCountUpdate(sqlSession,meetNo);
		result = dao.meetReplyWrite(sqlSession, meetReply);
		replyNo = meetReply.getReplyNo();
		if(attList.size()>0) {
		   for(MeetReplyAttachment a : attList) {
		      a.setReplyNo(replyNo);
		      result= dao.insertMeetReplyAttach(sqlSession,a);
		   }
		}
		return result;
	}

	@Override
	public int meetReplyWrite2(MeetReply meetReply) {
		int replyRefNo = meetReply.getReplyRef();
		int meetNo = meetReply.getMeetNo();
		dao.meetReplyReplyCountUpdate(sqlSession, replyRefNo);
		dao.meetReplyCountUpdate(sqlSession, meetNo);
		return dao.meetReplyWrite2(sqlSession, meetReply);
	}

	@Override
	public int meetReplyDelete(int replyNo) {
		return dao.meetReplyDelete(sqlSession, replyNo);
	}

	@Override
	public int meetReplyGood(int replyNo) {
		return dao.meetReplyGood(sqlSession, replyNo);
	}

	@Override
	public int meetReplyGoodCheck(MeetReply meetReply) {
		return dao.meetReplyGoodCheck(sqlSession, meetReply);
	}

	@Override
	public void insertmeetReplyGood(MeetReply meetReply) {
		dao.insertmeetReplyGood(sqlSession, meetReply);
	}
	
	
	
	

}
