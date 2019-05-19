package com.kh.respect.meet.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.meet.model.vo.MeetReply;
import com.kh.respect.meet.model.vo.MeetReplyAttachment;


public interface MeetService {
	
	List<Map<String,String>> selectMeetList(int cPage, int numPerPage);
	int selectTotalCount();
	
	int insertMeet(Meet meet);
	
	List<Map<String, String>> searchMeetList(int cPage, int numPerPage, String start, String end, String area);
	
	Meet selectOne(int meetNo);
	
	int meetDelete(int meetNo);
	
	int meetUpdate(Meet meet);
	
	void updateMeetCnt(int meetNo);
	
	// 댓글
	List<Map<String, String>> meetReplyList(int meetNo);
	List<Map<String, String>> meetAttList();
	
	int meetReplyWrite(MeetReply meetReply, List<MeetReplyAttachment> attList);
	int meetReplyWrite2(MeetReply meetReply);
	int meetReplyDelete(int replyNo);
	int meetReplyGood(int replyNo);
	int meetReplyGoodCheck(MeetReply meetReply);
	void insertmeetReplyGood(MeetReply meetReply);
	
	
	/*int scheduleReplyWrite(ScheduleReply schedulyReply, List<ScheduleReplyAttachment> attList);

	   int scheduleReplyWrite2(ScheduleReply schedulyReply);

	   int scheduleReplyDelete(int replyNo);

	   int scheduleReplyGood(int replyNo);

	   int scheduleReplyGoodCheck(ScheduleReply schedulyReply);

	   void insertscheduleReplyGood(ScheduleReply schedulyReply);

	   List<Map<String, String>> scheduleReplyList(int scheduleNo);

	   List<Map<String, String>> scheduleAttList();*/
	
}
