package com.kh.respect.schedule.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.ScheduleReport;
import com.kh.respect.schedule.model.vo.TimeTable;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Override
	public int insertSchedule(SqlSessionTemplate session, Schedule sc) {
		
		return session.insert("schedule.insertSchedule",sc);
	}

	@Override
	public int insertTimeTable(SqlSessionTemplate session, TimeTable tt) {
		
		return session.insert("schedule.insertTimeTable",tt);
	}



	//추천수정수정
	
		@Override
	public int deleteScheduleReport(SqlSessionTemplate session, int scheduleNo) {
		return session.delete("schedule.deleteScheduleReport",scheduleNo);
	}

		@Override
	public int updateScheduleReportFlag(SqlSessionTemplate session, int scheduleNo) {
		return session.update("schedule.updateReportFlag",scheduleNo);
	}

		@Override
		public int goodCountCheck(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.selectOne("schedule.goodCountCheck", schedule);
		}

		@Override
		public void insertScheduleGoodCount(SqlSessionTemplate session, Schedule schedule) {
			
			session.insert("schedule.insertScheduleGoodCount",schedule);
			
		}

		@Override
		public int goodCountUp(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.goodCountUp", schedule);
		}

		@Override
		public void deleteScheduleDownCount(SqlSessionTemplate session, Schedule schedule) {
			
			session.delete("schedule.deleteScheduleDownCount",schedule);
		}

		@Override
		public int goodCountDown(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.goodCountDown", schedule);
		}
		
		//찜하기 수정수정

		@Override
		public int bringCountCheck(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.selectOne("schedule.bringCountCheck", schedule);
		}

		@Override
		public void insertSchedulebringCount(SqlSessionTemplate session, Schedule schedule) {
			session.insert("schedule.insertSchedulebringCount",schedule);
			
		}

		@Override
		public int bringCountUp(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.bringCountUp", schedule);
		}

		@Override
		public void deleteBringDownCount(SqlSessionTemplate session, Schedule schedule) {
			session.delete("schedule.deleteBringDownCount",schedule);
			
		}

		@Override
		public int bringCountDown(SqlSessionTemplate session, Schedule schedule) {
			
			return session.update("schedule.bringCountDown", schedule);
		}
		
		
	
	
	
	
	


	@Override
	public List<Map<String, String>> selectScheduleList(SqlSessionTemplate session, int cPage, int numPerPage) {
		
		return session.selectList("schedule.selectScheduleList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	@Override
	public int selectTotalCount(SqlSessionTemplate session) {
		
		return session.selectOne("schedule.selectTotalCount");
	}

	@Override

	public List<Map<String, String>> selectScheduleFilter(SqlSessionTemplate session, Map<String, String> map,
			int numPerPage, int cPage) {
		return session.selectList("schedule.selectScheduleFilter",map,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public Map<String, String> selectOneScheduleView(SqlSessionTemplate session, int scheduleNo) {
		return session.selectOne("schedule.selectOneScheduleView",scheduleNo);
	}

	@Override
	public List<TimeTable> selectOneTimetableView(SqlSessionTemplate session, int scheduleNo) {
		return session.selectList("schedule.selectOneTimetableView",scheduleNo);
	}


	public Map selectSchedule(SqlSessionTemplate session, int scheduleNo) {
		return session.selectOne("schedule.selectSchedule",scheduleNo);
	}

	@Override
	public List<Map> selectTimeTableList(SqlSessionTemplate session, int scheduleNo) {
		return session.selectList("schedule.selectTimeTableList",scheduleNo);
	}

	@Override
	public int updateSchedule(SqlSessionTemplate session, Schedule sc) {
		return session.update("schedule.updateSchedule",sc);
	}

	@Override
	public int deleteTimeTable(SqlSessionTemplate session, int scheduleNo) {
		return session.delete("schedule.deleteTimeTable",scheduleNo);
	}
	

	@Override
	public int deleteSchedule(SqlSessionTemplate session, int scheduleNo) {
		
		return session.delete("schedule.scheduleDelete",scheduleNo);
	}


	

	


	//댓글
	//스케쥴댓글
	   @Override
	   public int scheduleReplyWrite(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.scheduleReplyWrite",schedulyReply);
	   }

	   @Override
	   public void scheduleReplyCountUpdate(SqlSessionTemplate session, int scheduleNo) {
	      // TODO Auto-generated method stub
	      session.update("schedule.scheduleReplyCountUpdate",scheduleNo);
	   }

	   @Override
	   public int insertScheduleReplyAttach(SqlSessionTemplate session, ScheduleReplyAttachment a) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.insertScheduleReplyAttach",a);
	   }
	   

	   @Override
	   public int scheduleReplyWrite2(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.scheduleReplyWrite2",schedulyReply);
	   }


	   @Override
	   public void scheduleReplyReplyCountUpdate(SqlSessionTemplate session, int replyRefNo) {
	      session.update("schedule.scheduleReplyReplyCountUpdate",replyRefNo);
	      
	   }

	   @Override
	   public int scheduleReplyDelete(SqlSessionTemplate session, int replyNo) {
	      // TODO Auto-generated method stub
	      return session.delete("schedule.scheduleReplyDelete",replyNo);
	   }

	   @Override
	   public int scheduleReplyGood(SqlSessionTemplate session, int replyNo) {
	      // TODO Auto-generated method stub
	      return session.update("schedule.scheduleReplyGood",replyNo);
	   }

	   @Override
	   public int scheduleReplyGoodCheck(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.selectOne("schedule.scheduleReplyGoodCheck", schedulyReply);
	   }

	   @Override
	   public void insertscheduleReplyGood(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      session.insert("schedule.insertscheduleReplyGood", schedulyReply);
	   }

	   @Override
	   public List<Map<String, String>> scheduleReplyList(SqlSessionTemplate session, int scheduleNo) {
	      // TODO Auto-generated method stub
	      return session.selectList("schedule.scheduleReplyList",scheduleNo);
	   }

	   @Override
	   public List<Map<String, String>> scheduleAttList(SqlSessionTemplate session) {
	      // TODO Auto-generated method stub
	      return session.selectList("schedule.scheduleAttList");
	   }


		@Override
		public void updateHitsCountUp(SqlSessionTemplate session, int scheduleNo) {
			session.update("schedule.updateHitsCountUp",scheduleNo);
			
		}

	@Override
	public Schedule selectScheduleSC(SqlSessionTemplate session, int scheduleNo) {
		return session.selectOne("schedule.selectScheduleSC",scheduleNo);
	}

	@Override
	public List<TimeTable> selectTimeTableSC(SqlSessionTemplate session, int scheduleNo) {
		return session.selectList("schedule.selectTimeTableSC",scheduleNo);
	}

	
	@Override
	public int insertScheduleReport(SqlSessionTemplate session, ScheduleReport sr) {
		
		return session.insert("schedule.insertScheduleReport",sr);
	}

	@Override
	public List<ScheduleReport> selectScheduleReportView(SqlSessionTemplate session,int scheduleNo) {
		return session.selectList("schedule.selectScheduleReportView",scheduleNo);
	}

	@Override
	public int deleteReport(SqlSessionTemplate session, int scheduleNo) {
		return session.delete("schedule.deleteReport",scheduleNo);
	}

	@Override
	public int updateReportFlag(SqlSessionTemplate session, int scheduleNo) {
		return session.update("schedule.updateReportFlag2",scheduleNo);
	}

	
	

}
