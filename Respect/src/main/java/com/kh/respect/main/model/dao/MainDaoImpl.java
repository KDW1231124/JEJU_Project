package com.kh.respect.main.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.place.model.vo.Place;



@Repository
public class MainDaoImpl implements MainDao {

	@Override
	public List<Place> selectMspList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("main.selectMspList");
	}

	@Override
	public List<Place> selectMtpList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("main.selectMtpList");
	}

	@Override
	public List<Map<String, String>> selectMmpList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("main.selectMmpList");
	}

	@Override
	public List<Map<String, String>> selectMnpList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("main.selectMnpList");
	}

	@Override
	public List<Map<String, String>> selectMcpList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("main.selectMcpList");
	}
	
	
	
	
	
	

}
