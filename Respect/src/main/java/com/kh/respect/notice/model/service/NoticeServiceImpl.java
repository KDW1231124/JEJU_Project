package com.kh.respect.notice.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.notice.model.dao.NoticeDao;
import com.kh.respect.notice.model.vo.Attachment;
import com.kh.respect.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	
	@Autowired
	private SqlSession session;
	
	


	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(session, cPage, numPerPage);
	}




	@Override
	public int selectTotalCount() {
		// TODO Auto-generated method stub
		return dao.selectTotalCount(session);
	}




	@Override
	public List<Notice> selectNoticeView(int noticeNo) {

		List<Notice> list = dao.selectNoticeView(session,noticeNo);
		
		return list;
	}


	
	
	@Override
	public int insertNoticeCount(int noticeNo, boolean hasRead) {
		
		int result=0;
		
		if(!hasRead)
		{	
			result=dao.insertNoticeCount(session, noticeNo);
		}
		
		return result;
	}


	@Override
	public int insertNotice(Notice notice, List<Attachment> attList) {
		
		int result=0;
		int noticeNo=0;
		
		result=dao.insertNotice(session,notice);
		//시퀀스의 현재값이 들어가 있음
		noticeNo=notice.getNoticeNo();
		if(attList.size()>0) {
			
			for(Attachment a : attList) {
				
				a.setNoticeNo(noticeNo);
				result=dao.insertAttach(session,a);
			}
		}
		
		
		return result;
	}


	@Override
	public List<Attachment> selectAttach(int noticeNo) {
		return dao.selectAttach(session, noticeNo);
	}




	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(session,noticeNo);
	}




	@Override
	public List<Map<String, String>> searchList(int cPage, int numPerPage, String searchText) {
		// TODO Auto-generated method stub
		return dao.searchList(session, cPage, numPerPage, searchText);
	}




	
	
	
	



	
	
	
	
}
