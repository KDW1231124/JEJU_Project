package com.kh.respect.schedule.model.vo;

public class ScheduleReplyAttachment {

	private int attachNo;
	private int replyNo;
	private String originName;
	private String reNamed;
	
	public ScheduleReplyAttachment() {
		
	}

	public ScheduleReplyAttachment(int attachNo, int replyNo, String originName, String reNamed) {
		super();
		this.attachNo = attachNo;
		this.replyNo = replyNo;
		this.originName = originName;
		this.reNamed = reNamed;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getReNamed() {
		return reNamed;
	}

	public void setReNamed(String reNamed) {
		this.reNamed = reNamed;
	}

	@Override
	public String toString() {
		return "ScheduleReplyAttachment [attachNo=" + attachNo + ", replyNo=" + replyNo + ", originName=" + originName
				+ ", reNamed=" + reNamed + "]";
	}
	
	
}

