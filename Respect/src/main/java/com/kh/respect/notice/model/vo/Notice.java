package com.kh.respect.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String title;
	private String content;
	private Date writeDate;
	private int hitsCount;
	
	public Notice() {}
	public Notice(int noticeNo, String title, String content, Date writeDate, int hitsCount) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.hitsCount = hitsCount;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHitsCount() {
		return hitsCount;
	}
	public void setHitsCount(int hitsCount) {
		this.hitsCount = hitsCount;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", hitsCount=" + hitsCount + "]";
	}
	
	
	

}
