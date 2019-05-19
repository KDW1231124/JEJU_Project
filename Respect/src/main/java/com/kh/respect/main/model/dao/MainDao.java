package com.kh.respect.main.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.place.model.vo.Place;

public interface MainDao {

	List<Place> selectMspList(SqlSession session);

	List<Place> selectMtpList(SqlSession session);

	List<Map<String, String>> selectMmpList(SqlSession session);

	List<Map<String, String>> selectMnpList(SqlSession session);

	List<Map<String, String>> selectMcpList(SqlSession session);


	

}
