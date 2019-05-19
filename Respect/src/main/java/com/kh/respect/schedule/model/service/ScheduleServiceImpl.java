package com.kh.respect.schedule.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.schedule.model.dao.ScheduleDao;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReport;
import com.kh.respect.schedule.model.vo.TimeTable;


@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private ScheduleDao dao;
	
	@Override
	
	public int insertSchedule(Schedule sc, List<TimeTable> list) {
		
		int result=0;
		int scheduleNo=0;
		
		result=dao.insertSchedule(session,sc);
		
		scheduleNo=sc.getScheduleNo();
		
		if(result>0)
		{
			
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					
					tt.setScheduleNo(scheduleNo);
					result=dao.insertTimeTable(session,tt);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map<String, String>> selectScheduleList(int cPage, int numPerPage) {
		
		return dao.selectScheduleList(session,cPage,numPerPage);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(session);
	}


	

	@Override
	public List<Map<String, String>> selectScheduleFilter(Map<String, String> map, int numPerPage, int cPage) {
		return dao.selectScheduleFilter(session,map,numPerPage,cPage);
	}

	@Override
	public Map<String, String> selectOneScheduleView(int scheduleNo) {
		dao.updateHitsCountUp(session, scheduleNo);
		return dao.selectOneScheduleView(session, scheduleNo);
	}

	@Override
	public List<TimeTable> selectOneTimetableView(int scheduleNo) {
		return dao.selectOneTimetableView(session,scheduleNo);
	}
	
	
	//댓글
	
	//스케쥴댓글
	   @Override
	   public int scheduleReplyWrite(ScheduleReply schedulyReply, List<ScheduleReplyAttachment> attList) {
	      int result = 0;
	      int scheduleNo=0;
	      int replyNo=0;
	      scheduleNo = schedulyReply.getScheduleNo();
	      dao.scheduleReplyCountUpdate(session,scheduleNo);
	      result = dao.scheduleReplyWrite(session, schedulyReply);
	      replyNo = schedulyReply.getReplyNo();
	      if(attList.size()>0) {
	         for(ScheduleReplyAttachment a : attList) {
	            a.setReplyNo(replyNo);
	            result= dao.insertScheduleReplyAttach(session,a);
	         }
	      }
	      
	      
	      return result;
	      
	      
	      
	   }
	   
	   

	   @Override
	   public int scheduleReplyWrite2(ScheduleReply schedulyReply) {
	      int replyRefNo = schedulyReply.getReplyRef();
	      int scheduleNo = schedulyReply.getScheduleNo();
	      dao.scheduleReplyReplyCountUpdate(session, replyRefNo);
	      dao.scheduleReplyCountUpdate(session, scheduleNo);
	      return dao.scheduleReplyWrite2(session, schedulyReply);
	   }

	   @Override
	   public int scheduleReplyDelete(int replyNo) {
	      
	      return dao.scheduleReplyDelete(session, replyNo);
	   }

	   @Override
	   public int scheduleReplyGood(int replyNo) {
	      // TODO Auto-generated method stub
	      return dao.scheduleReplyGood(session, replyNo);
	   }

	   @Override
	   public int scheduleReplyGoodCheck(ScheduleReply schedulyReply) {
	      
	      return dao.scheduleReplyGoodCheck(session,schedulyReply);
	   }

	   @Override
	   public void insertscheduleReplyGood(ScheduleReply schedulyReply) {
	      
	      dao.insertscheduleReplyGood(session,schedulyReply);
	   }

	   @Override
	   public List<Map<String, String>> scheduleReplyList(int scheduleNo) {
	      
	      return dao.scheduleReplyList(session, scheduleNo);
	   }

	   @Override
	   public List<Map<String, String>> scheduleAttList() {
	      // TODO Auto-generated method stub
	      return dao.scheduleAttList(session);
	   }

	
	
	


	

	@Override
	public Map selectSchedule(int scheduleNo) {
		return dao.selectSchedule(session, scheduleNo);
	}

	@Override
	public List<Map> selectTimeTableList(int scheduleNo) {
		return dao.selectTimeTableList(session,scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule sc, List<TimeTable> list) {
		int result=0;
		int scheduleNo=0;
		result=dao.updateSchedule(session,sc);
		System.out.println("업데이트 후 "+ result);
		scheduleNo=sc.getScheduleNo();
		result=dao.deleteTimeTable(session,scheduleNo);
		System.out.println("딜리트 후"+ result);
		if(result>0)
		{
			
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					result=dao.insertTimeTable(session,tt);
					System.out.println("인서트중");
				}
			}
		}
		return result;
	}
	
	@Override
	public int insertScheduleReport(List<ScheduleReport> list) {

		int result=0;
		int result2=0;
		for(ScheduleReport sr: list)
		{ 
			System.out.println("insert ing!!!");
			result=dao.insertScheduleReport(session,sr);
		}
		if(result>0)
		{
			int scheduleNo=list.get(0).getScheduleNo();
			result2=dao.updateScheduleReportFlag(session,scheduleNo);
		}
		return result2; 
		
	}
	
	
	
	
//	@Override
//	public int deleteSchedule(int scheduleNo) {
//		return dao.deleteSchedule(session, scheduleNo);
//	}
	@Override
	public int deleteSchedule(int scheduleNo) {
		return dao.deleteSchedule(session, scheduleNo);
	}

	
	
	
	
	
	//추천수정수정

	

	

		@Override
		public int goodCountCheck(Schedule schedule) {
			
			return dao.goodCountCheck(session,schedule);
		}

		@Override
		public int goodCountUp(Schedule schedule) {
			dao.insertScheduleGoodCount(session,schedule);
			return dao.goodCountUp(session,schedule);
		}

		@Override
		public int goodCountDown(Schedule schedule) {
			dao.deleteScheduleDownCount(session,schedule);
			return dao.goodCountDown(session,schedule);
		}
		
		//찜하기수정수정

		@Override
		public int bringCountCheck(Schedule schedule) {
			
			return dao.bringCountCheck(session,schedule);
		}

		@Override
		public int bringCountUp(Schedule schedule) {
			
			dao.insertSchedulebringCount(session,schedule);
			return dao.bringCountUp(session,schedule);
		}

		@Override
		public int bringCountDown(Schedule schedule) {
			dao.deleteBringDownCount(session,schedule);
			return dao.bringCountDown(session,schedule);
		}

		
		public Schedule selectScheduleSC(int scheduleNo) {
			return dao.selectScheduleSC(session, scheduleNo);
		}

		@Override
		public List<TimeTable> selectTimeTableSC(int scheduleNo) {
			return dao.selectTimeTableSC(session,scheduleNo);
		}
	
		@Override
		public List<ScheduleReport> selectScheduleReportView(int scheduleNo) {
			return dao.selectScheduleReportView(session,scheduleNo);
		}

		@Override
		public int updateReport(List<ScheduleReport> list, int scheduleNo) {
			int result=0;
			result=dao.deleteReport(session,scheduleNo);
			for(ScheduleReport sr: list)
			{ 
				result=dao.insertScheduleReport(session,sr);
			}
			return result; 
		}

		@Override
		public int deleteReport(int scheduleNo) {
			
			int result=dao.deleteReport(session, scheduleNo);
			result=updateReportFlag(scheduleNo);
			return result;
		}
		@Override 
		public int updateReportFlag(int scheduleNo)
		{
			return dao.updateReportFlag(session,scheduleNo);
		}

		

	
}
