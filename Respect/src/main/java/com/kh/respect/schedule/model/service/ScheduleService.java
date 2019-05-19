package com.kh.respect.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReport;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleService {

	int insertSchedule(Schedule sc, List<TimeTable> list);
	int updateReportFlag(int scheduleNo);

	//좋아요증가부터

	int goodCountCheck(Schedule schedule);

	int goodCountUp(Schedule schedule);

	int goodCountDown(Schedule schedule);

	int bringCountCheck(Schedule schedule);

	int bringCountUp(Schedule schedule);

	int bringCountDown(Schedule schedule);

	List<Map<String, String>> selectScheduleList(int cPage, int numPerPage);

	int selectTotalCount();

	List<Map<String, String>> selectScheduleFilter(Map<String, String> map, int numPerPage, int cPage);

	Map<String, String> selectOneScheduleView(int scheduleNo);

	List<TimeTable> selectOneTimetableView(int scheduleNo);


	//댓글
	int scheduleReplyWrite(ScheduleReply schedulyReply, List<ScheduleReplyAttachment> attList);

   int scheduleReplyWrite2(ScheduleReply schedulyReply);

   int scheduleReplyDelete(int replyNo);

   int scheduleReplyGood(int replyNo);

   int scheduleReplyGoodCheck(ScheduleReply schedulyReply);

   void insertscheduleReplyGood(ScheduleReply schedulyReply);

   List<Map<String, String>> scheduleReplyList(int scheduleNo);

   List<Map<String, String>> scheduleAttList();


	
	Map selectSchedule(int scheduleNo);
	
	List<Map> selectTimeTableList(int scheduleNo);
	
	int updateSchedule(Schedule sc, List<TimeTable> list);


	int insertScheduleReport(List<ScheduleReport> list);


	List<ScheduleReport> selectScheduleReportView(int scheduleNo);


	
	int deleteSchedule(int scheduleNo);
	int deleteReport(int scheduleNo);
	Schedule selectScheduleSC(int scheduleNo);
	List<TimeTable> selectTimeTableSC(int scheduleNo);
	int updateReport(List<ScheduleReport> list,int scheduleNo);
}
