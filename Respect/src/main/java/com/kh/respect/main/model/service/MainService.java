package com.kh.respect.main.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.meet.model.vo.Meet;
import com.kh.respect.place.model.vo.Place;

public interface MainService {

	List<Place> selectMspList();

	List<Place> selectMtpList();

	List<Map<String, String>> selectMmpList();

	List<Map<String, String>> selectMnpList();

	List<Map<String, String>> selectMcpList();


	

}
