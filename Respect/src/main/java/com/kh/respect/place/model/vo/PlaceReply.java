package com.kh.respect.place.model.vo;

import java.util.Date;

public class PlaceReply {
	
	private int replyNo;
	private int placeNo;
	private int replyRef;
	private String userId;
	private Date writeDate;
	private String content;
	private int goodCount;
	private int placeReplyLevel;
	private int replyCount;
	
	public PlaceReply() {}

	public PlaceReply(int replyNo, int placeNo, int replyRef, String userId, Date writeDate, String content,
			int goodCount, int placeReplyLevel, int replyCount) {
		super();
		this.replyNo = replyNo;
		this.placeNo = placeNo;
		this.replyRef = replyRef;
		this.userId = userId;
		this.writeDate = writeDate;
		this.content = content;
		this.goodCount = goodCount;
		this.placeReplyLevel = placeReplyLevel;
		this.replyCount = replyCount;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
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

	public int getPlaceReplyLevel() {
		return placeReplyLevel;
	}

	public void setPlaceReplyLevel(int placeReplyLevel) {
		this.placeReplyLevel = placeReplyLevel;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "PlaceReply [replyNo=" + replyNo + ", placeNo=" + placeNo + ", replyRef=" + replyRef + ", userId=" + userId
				+ ", writeDate=" + writeDate + ", content=" + content + ", goodCount=" + goodCount + ", placeReplyLevel="
				+ placeReplyLevel + ", replyCount=" + replyCount + "]";
	}
	
	
	
	
	
	
}
