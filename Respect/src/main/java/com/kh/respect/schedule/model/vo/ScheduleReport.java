package com.kh.respect.schedule.model.vo;

import java.util.Date;

public class ScheduleReport {
	private int reportNo;
	private int scheduleNo;
	private String userId;
	private String title;
	private Date writeDate;
	private String content;
	private int reportDay;
	private String writeDate1;
	
	public ScheduleReport() {}

	public ScheduleReport(int reportNo, int scheduleNo, String userId, String title, Date writeDate, String content,
			int reportDay) {
		super();
		this.reportNo = reportNo;
		this.scheduleNo = scheduleNo;
		this.userId = userId;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.reportDay = reportDay;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReportDay() {
		return reportDay;
	}

	public void setReportDay(int reportDay) {
		this.reportDay = reportDay;
	}

	public String getWriteDate1() {
		return writeDate1;
	}

	public void setWriteDate1(String writeDate1) {
		this.writeDate1 = writeDate1;
	}

	@Override
	public String toString() {
		return "ScheduleReport [reportNo=" + reportNo + ", scheduleNo=" + scheduleNo + ", userId=" + userId + ", title="
				+ title + ", writeDate=" + writeDate + ", content=" + content + ", reportDay=" + reportDay + "]";
	}
	
	
}
