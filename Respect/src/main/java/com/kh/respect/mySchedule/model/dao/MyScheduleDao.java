package com.kh.respect.mySchedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.mySchedule.model.vo.Delete;
import com.kh.respect.place.model.vo.Place;

public interface MyScheduleDao {

	int myScheduleNum(SqlSessionTemplate sqlSession, String userId);

	int putScheduleNum(SqlSessionTemplate sqlSession, String userId);

	int putPlaceNum(SqlSessionTemplate sqlSession, String userId);

	int myScheduleReportNum(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleListRowTwo(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> putScheduleListRowTwo(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> putPlaceListRowTwo(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleReportListRowTwo(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleList(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleListBefore(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleListIng(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleListAfter(SqlSessionTemplate sqlSession, String userId);

	int myScheduleDelete(SqlSessionTemplate sqlSession, int scheduleNo);

	List<Map<String, String>> putScheduleList(SqlSessionTemplate sqlSession, String userId);

	List<Place> putPlaceList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);

	int putPlaceListTotalCount(SqlSessionTemplate sqlSession, String userId);

	List<Map<String, String>> myScheduleReport(SqlSessionTemplate sqlSession, String userId);

	int myScheduleReportDelete(SqlSessionTemplate sqlSession, int reportNo);

	int putPlaceDelete(SqlSessionTemplate sqlSession, Delete del);

	int putScheduleDelete(SqlSessionTemplate sqlSession, Delete del);

}
