package com.kh.respect.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.respect.notice.model.vo.Attachment;
import com.kh.respect.notice.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	

	@Override
	public int selectTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("mybatis.selectTotalCount");
	}

	@Override
	public List<Map<String, String>> selectNoticeList(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("mybatis.selectNoticeList",null,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Notice> selectNoticeView(SqlSession session, int noticeNo) {

		return session.selectList("mybatis.selectnoView", noticeNo);
	}

	@Override
	public int insertNoticeCount(SqlSession session, int noticeNo) {
		
		return session.insert("mybatis.insertNoCount", noticeNo);
	}

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		// TODO Auto-generated method stub
		return session.insert("mybatis.insertNotice", notice);
	}

	@Override
	public int insertAttach(SqlSession session, Attachment a) {
		// TODO Auto-generated method stub
		return session.insert("mybatis.insertAttach", a);
	}

	@Override
	public List<Attachment> selectAttach(SqlSession session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectList("mybatis.selectAttach", noticeNo);
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("mybatis.deleteNotice", noticeNo);
	}

	@Override
	public List<Map<String, String>> searchList(SqlSession session, int cPage, int numPerPage,
			String searchText) 
	{
		// TODO Auto-generated method stub
		return session.selectList("mybatis.searchNoticeList",searchText,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	
}
