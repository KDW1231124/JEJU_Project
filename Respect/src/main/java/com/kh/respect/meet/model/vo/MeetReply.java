package com.kh.respect.meet.model.vo;

import java.util.Date;

public class MeetReply {
	
	private int replyNo;
	private int meetNo;
	private int replyRef;
	private String userId;
	private Date writeDate;
	private String content;
	private int goodCount;
	private int meetReplyLevel;
	private int replyCount;
	
	public MeetReply() {}

	public MeetReply(int replyNo, int meetNo, int replyRef, String userId, Date writeDate, String content,
			int goodCount, int meetReplyLevel, int replyCount) {
		super();
		this.replyNo = replyNo;
		this.meetNo = meetNo;
		this.replyRef = replyRef;
		this.userId = userId;
		this.writeDate = writeDate;
		this.content = content;
		this.goodCount = goodCount;
		this.meetReplyLevel = meetReplyLevel;
		this.replyCount = replyCount;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
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

	public int getMeetReplyLevel() {
		return meetReplyLevel;
	}

	public void setMeetReplyLevel(int meetReplyLevel) {
		this.meetReplyLevel = meetReplyLevel;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "MeetReply [replyNo=" + replyNo + ", meetNo=" + meetNo + ", replyRef=" + replyRef + ", userId=" + userId
				+ ", writeDate=" + writeDate + ", content=" + content + ", goodCount=" + goodCount + ", meetReplyLevel="
				+ meetReplyLevel + ", replyCount=" + replyCount + "]";
	}
	
	
	
	
	
	
}
