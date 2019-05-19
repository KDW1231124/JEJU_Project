package com.kh.respect.message.model.vo;

import java.sql.Date;

public class Message {
	private String msgNo; //메시지번호
	private String writer; //보낸이
	private String receiver; //받는지
	private String title; //제목
	private String content; //내용
	private Date writeDate; //보낸날짜
	private int readFlag; //읽기여부
	private int recdel; //받는이가 삭제했는지
	private int wridel; // 보낸이가 삭제했는지..
	private String nickName;
	public Message() {
		
	}
	public Message(String msgNo, String writer, String receiver, String title, String content, Date writeDate,
			int readFlag, int recdel, int wridel, String nickName) {
		super();
		this.msgNo = msgNo;
		this.writer = writer;
		this.receiver = receiver;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.readFlag = readFlag;
		this.recdel = recdel;
		this.wridel = wridel;
		this.nickName = nickName;
	}
	public String getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(String msgNo) {
		this.msgNo = msgNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public int getReadFlag() {
		return readFlag;
	}
	public void setReadFlag(int readFlag) {
		this.readFlag = readFlag;
	}
	public int getRecdel() {
		return recdel;
	}
	public void setRecdel(int recdel) {
		this.recdel = recdel;
	}
	public int getWridel() {
		return wridel;
	}
	public void setWridel(int wridel) {
		this.wridel = wridel;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", writer=" + writer + ", receiver=" + receiver + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", readFlag=" + readFlag + ", recdel=" + recdel
				+ ", wridel=" + wridel + ", nickName=" + nickName + "]";
	}

	
	
}
