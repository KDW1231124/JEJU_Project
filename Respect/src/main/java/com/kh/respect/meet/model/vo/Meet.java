package com.kh.respect.meet.model.vo;

import java.util.Date;

public class Meet {
	
	private int meetNo;
	private String userId;
	private String nickName;
	private String gender;
	private int age;
	private String area;
	private String title;
	private String thumbnail;
	private String content;
	private String meetDate;
	private String meetDay;
	private String meetTime;
	private String address;
	private int hitsCount;
	private int replyCount;
	private Date writeDate;
	
	public Meet() {}
	
	

	public Meet(int meetNo, String userId, String nickName, String gender, int age, String area, String title,
			String thumbnail, String content, String meetDate, String meetDay, String meetTime, String address,
			int hitsCount, int replyCount, Date writeDate) {
		super();
		this.meetNo = meetNo;
		this.userId = userId;
		this.nickName = nickName;
		this.gender = gender;
		this.age = age;
		this.area = area;
		this.title = title;
		this.thumbnail = thumbnail;
		this.content = content;
		this.meetDate = meetDate;
		this.meetDay = meetDay;
		this.meetTime = meetTime;
		this.address = address;
		this.hitsCount = hitsCount;
		this.replyCount = replyCount;
		this.writeDate = writeDate;
	}



	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMeetDate() {
		return meetDate;
	}

	public void setMeetDate(String meetDate) {
		this.meetDate = meetDate;
	}

	public String getMeetDay() {
		return meetDay;
	}

	public void setMeetDay(String meetDay) {
		this.meetDay = meetDay;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "Meet [meetNo=" + meetNo + ", userId=" + userId + ", nickName=" + nickName + ", gender=" + gender
				+ ", age=" + age + ", area=" + area + ", title=" + title + ", thumbnail=" + thumbnail + ", content="
				+ content + ", meetDate=" + meetDate + ", meetDay=" + meetDay + ", meetTime=" + meetTime + ", address="
				+ address + ", hitsCount=" + hitsCount + ", replyCount=" + replyCount + ", writeDate=" + writeDate
				+ "]";
	}

	

	
	
	

	

	
	
}
