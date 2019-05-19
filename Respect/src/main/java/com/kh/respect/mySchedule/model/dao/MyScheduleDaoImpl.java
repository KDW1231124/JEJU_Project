package com.kh.respect.mySchedule.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.mySchedule.model.vo.Delete;
import com.kh.respect.place.model.vo.Place;

@Repository
public class MyScheduleDaoImpl implements MyScheduleDao {

	@Override
	public int myScheduleNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mySchedule.myScheduleNum", userId);
	}

	@Override
	public int putScheduleNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mySchedule.putScheduleNum", userId);
	}

	@Override
	public int putPlaceNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mySchedule.putPlaceNum", userId);
	}

	@Override
	public int myScheduleReportNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mySchedule.myScheduleReportNum", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListRowTwo(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleListRowTwo", userId);
	}

	@Override
	public List<Map<String, String>> putScheduleListRowTwo(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.putScheduleListRowTwo", userId);
	}

	@Override
	public List<Map<String, String>> putPlaceListRowTwo(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.putPlaceListRowTwo", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleReportListRowTwo(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleReportListRowTwo", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleList(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleList", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListBefore(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleListBefore", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListIng(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleListIng", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListAfter(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleListAfter", userId);
	}

	@Override
	public int myScheduleDelete(SqlSessionTemplate sqlSession, int scheduleNo) {
		
		return sqlSession.delete("mySchedule.myScheduleDelete", scheduleNo);
	}

	@Override
	public List<Map<String, String>> putScheduleList(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.putScheduleList", userId);
	}

	@Override
	public List<Place> putPlaceList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.putPlaceList", userId,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int putPlaceListTotalCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mySchedule.putPlaceListTotalCount", userId);
	}

	@Override
	public List<Map<String, String>> myScheduleReport(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySchedule.myScheduleReport", userId);
	}

	@Override
	public int myScheduleReportDelete(SqlSessionTemplate sqlSession, int reportNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mySchedule.myScheduleReportDelete",reportNo);
	}

	@Override
	public int putPlaceDelete(SqlSessionTemplate sqlSession, Delete del) {
	
		return sqlSession.delete("mySchedule.putPlaceDelete",del);
	}

	@Override
	public int putScheduleDelete(SqlSessionTemplate sqlSession, Delete del) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mySchedule.putScheduleDelete",del);
	}
	
	
	

	
	
	
	
	
	
	
	
}
