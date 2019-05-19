package com.kh.respect.schedule.model.vo;

import java.sql.Date;

public class ScheduleReply {

	private int replyNo;
	private int scheduleNo;
	private int replyRef;
	private String userId;
	private Date writeDate;
	private String content;
	private int goodCount;
	private int scheduleReplyLevel;
	private int replyCount;

	public ScheduleReply() {

	}

	public ScheduleReply(int replyNo, int scheduleNo, int replyRef, String userId, Date writeDate, String content,
			int goodCount, int scheduleReplyLevel, int replyCount) {
		super();
		this.replyNo = replyNo;
		this.scheduleNo = scheduleNo;
		this.replyRef = replyRef;
		this.userId = userId;
		this.writeDate = writeDate;
		this.content = content;
		this.goodCount = goodCount;
		this.scheduleReplyLevel = scheduleReplyLevel;
		this.replyCount = replyCount;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getReplyRef() {
		return replyRef;
	}

	public void setReplyRef(int replyRef) {
		this.replyRef = replyRef;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	public int getScheduleReplyLevel() {
		return scheduleReplyLevel;
	}

	public void setScheduleReplyLevel(int scheduleReplyLevel) {
		this.scheduleReplyLevel = scheduleReplyLevel;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "ScheduleReply [replyNo=" + replyNo + ", scheduleNo=" + scheduleNo + ", replyRef=" + replyRef
				+ ", userId=" + userId + ", writeDate=" + writeDate + ", content=" + content + ", goodCount="
				+ goodCount + ", scheduleReplyLevel=" + scheduleReplyLevel + ", replyCount=" + replyCount + "]";
	}

}

