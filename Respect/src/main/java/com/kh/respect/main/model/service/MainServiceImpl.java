package com.kh.respect.main.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.main.model.dao.MainDao;
import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.place.model.vo.Place;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Place> selectMspList() {
		// TODO Auto-generated method stub
		return dao.selectMspList(session);
	}

	@Override
	public List<Place> selectMtpList() {
		// TODO Auto-generated method stub
		return dao.selectMtpList(session);
	}

	@Override
	public List<Map<String, String>> selectMmpList() {
		// TODO Auto-generated method stub
		return dao.selectMmpList(session);
	}

	@Override
	public List<Map<String, String>> selectMnpList() {
		// TODO Auto-generated method stub
		return dao.selectMnpList(session);
	}

	@Override
	public List<Map<String, String>> selectMcpList() {
		// TODO Auto-generated method stub
		return dao.selectMcpList(session);
	}
	
	
	
	
	
}
