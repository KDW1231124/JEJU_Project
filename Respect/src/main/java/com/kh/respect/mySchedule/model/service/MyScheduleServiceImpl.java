package com.kh.respect.mySchedule.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.mySchedule.model.dao.MyScheduleDao;
import com.kh.respect.mySchedule.model.vo.Delete;
import com.kh.respect.place.model.vo.Place;

@Service
public class MyScheduleServiceImpl implements MyScheduleService {

	@Autowired
	MyScheduleDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int myScheduleNum(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleNum(sqlSession,userId);
	}

	@Override
	public int putScheduleNum(String userId) {
		// TODO Auto-generated method stub
		return dao.putScheduleNum(sqlSession,userId);
	}

	@Override
	public int putPlaceNum(String userId) {
		// TODO Auto-generated method stub
		return dao.putPlaceNum(sqlSession,userId);
	}

	@Override
	public int myScheduleReportNum(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleReportNum(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListRowTwo(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleListRowTwo(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> putScheduleListRowTwo(String userId) {
		// TODO Auto-generated method stub
		return dao.putScheduleListRowTwo(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> putPlaceListRowTwo(String userId) {
		// TODO Auto-generated method stub
		return dao.putPlaceListRowTwo(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleReportListRowTwo(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleReportListRowTwo(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleList(String userId) {
		
		return dao.myScheduleList(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListBefore(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleListBefore(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListIng(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleListIng(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleListAfter(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleListAfter(sqlSession,userId);
	}

	@Override
	public int myScheduleDelete(int scheduleNo) {
		// TODO Auto-generated method stub
		return dao.myScheduleDelete(sqlSession,scheduleNo);
	}

	@Override
	public List<Map<String, String>> putScheduleList(String userId) {
		// TODO Auto-generated method stub
		return dao.putScheduleList(sqlSession,userId);
	}

	@Override
	public List<Place> putPlaceList(String userId, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.putPlaceList(sqlSession,userId,cPage,numPerPage);
	}

	@Override
	public int putPlaceListTotalCount(String userId) {
		
		return dao.putPlaceListTotalCount(sqlSession,userId);
	}

	@Override
	public List<Map<String, String>> myScheduleReport(String userId) {
		// TODO Auto-generated method stub
		return dao.myScheduleReport(sqlSession,userId);
	}

	@Override
	public int myScheduleReportDelete(int reportNo) {
		// TODO Auto-generated method stub
		return dao.myScheduleReportDelete(sqlSession,reportNo);
	}

	@Override
	public int putPlaceDelete(Delete del) {
		// TODO Auto-generated method stub
		return dao.putPlaceDelete(sqlSession,del);
	}

	@Override
	public int putScheduleDelete(Delete del) {
		// TODO Auto-generated method stub
		return dao.putScheduleDelete(sqlSession,del);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
