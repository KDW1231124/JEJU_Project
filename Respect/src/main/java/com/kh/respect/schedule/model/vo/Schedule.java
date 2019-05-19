package com.kh.respect.schedule.model.vo;

import java.sql.Date;

public class Schedule {
	private int scheduleNo;
	private String travelTheme;
	private String partyName;
	private String userId;
	private String title;
	private String startDate;
	private String endDate;
	private int peopleNum;
	private int publicFlag;
	private int bringCount;
	private int reportFlag;
	private int goodCount;
	private int hitsCount;
	private int replyCount;
	private Date writeDate;
	private int placeNo;
	
	public Schedule() {}
	
	public Schedule(int scheduleNo, String travelTheme, String partyName, String userId, String title, String startDate,
			String endDate, int peopleNum, int publicFlag, int bringCount, int reportFlag, int goodCount, int hitsCount,
			int replyCount, Date writeDate, int placeNo) {
		super();
		this.scheduleNo = scheduleNo;
		this.travelTheme = travelTheme;
		this.partyName = partyName;
		this.userId = userId;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.peopleNum = peopleNum;
		this.publicFlag = publicFlag;
		this.bringCount = bringCount;
		this.reportFlag = reportFlag;
		this.goodCount = goodCount;
		this.hitsCount = hitsCount;
		this.replyCount = replyCount;
		this.writeDate = writeDate;
		this.placeNo = placeNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getTravelTheme() {
		return travelTheme;
	}

	public void setTravelTheme(String travelTheme) {
		this.travelTheme = travelTheme;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}

	public int getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}

	public int getBringCount() {
		return bringCount;
	}

	public void setBringCount(int bringCount) {
		this.bringCount = bringCount;
	}

	public int getReportFlag() {
		return reportFlag;
	}

	public void setReportFlag(int reportFlag) {
		this.reportFlag = reportFlag;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	public int getHitsCount() {
		return hitsCount;
	}

	public void setHitsCount(int hitsCount) {
		this.hitsCount = hitsCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	
	public String getNickname() {
		return userId;
	}

	

	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", travelTheme=" + travelTheme + ", partyName=" + partyName
				+ ", userId=" + userId + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", peopleNum=" + peopleNum + ", publicFlag=" + publicFlag + ", bringCount=" + bringCount
				+ ", reportFlag=" + reportFlag + ", goodCount=" + goodCount + ", hitsCount=" + hitsCount
				+ ", replyCount=" + replyCount + ", writeDate=" + writeDate + ", placeNo=" + placeNo + "]";
	}
	
	
}
