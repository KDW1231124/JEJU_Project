package com.kh.respect.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.respect.notice.model.vo.Attachment;
import com.kh.respect.notice.model.vo.Notice;

public interface NoticeDao {


	List<Notice> selectNoticeView(SqlSession session, int noticeNo);

	int insertNoticeCount(SqlSession session, int noticeNo);

	int insertNotice(SqlSession session, Notice notice);

	int insertAttach(SqlSession session, Attachment a);

	List<Attachment> selectAttach(SqlSession session, int noticeNo);

	int selectTotalCount(SqlSession session);

	List<Map<String, String>> selectNoticeList(SqlSession session, int cPage, int numPerPage);

	int deleteNotice(SqlSession session, int noticeNo);

	List<Map<String, String>> searchList(SqlSession session, int cPage, int numPerPage, String searchText);




}
