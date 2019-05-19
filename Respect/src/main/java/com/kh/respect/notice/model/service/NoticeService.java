package com.kh.respect.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.notice.model.vo.Attachment;
import com.kh.respect.notice.model.vo.Notice;


public interface NoticeService {


	List<Notice> selectNoticeView(int noticeNo);

	int insertNoticeCount(int noticeNo, boolean hasRead);

	int insertNotice(Notice notice, List<Attachment> attList);

	List<Attachment> selectAttach(int noticeNo);

	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectTotalCount();

	int deleteNotice(int noticeNo);

	List<Map<String, String>> searchList(int cPage, int numPerPage, String searchText);


}
