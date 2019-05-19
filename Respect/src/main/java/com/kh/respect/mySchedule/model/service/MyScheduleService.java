package com.kh.respect.mySchedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.mySchedule.model.vo.Delete;
import com.kh.respect.place.model.vo.Place;

public interface MyScheduleService {

	int myScheduleNum(String userId);

	int putScheduleNum(String userId);

	int putPlaceNum(String userId);

	int myScheduleReportNum(String userId);

	List<Map<String, String>> myScheduleListRowTwo(String userId);

	List<Map<String, String>> putScheduleListRowTwo(String userId);

	List<Map<String, String>> putPlaceListRowTwo(String userId);

	List<Map<String, String>> myScheduleReportListRowTwo(String userId);

	List<Map<String, String>> myScheduleList(String userId);

	List<Map<String, String>> myScheduleListBefore(String userId);

	List<Map<String, String>> myScheduleListIng(String userId);

	List<Map<String, String>> myScheduleListAfter(String userId);

	int myScheduleDelete(int scheduleNo);

	List<Map<String, String>> putScheduleList(String userId);

	List<Place> putPlaceList(String userId,int cPage, int numPerPage);

	int putPlaceListTotalCount(String userId);

	List<Map<String, String>> myScheduleReport(String userId);

	int myScheduleReportDelete(int reportNo);

	int putPlaceDelete(Delete del);

	int putScheduleDelete(Delete del);

	

	
}
