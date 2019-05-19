package com.kh.respect.schedule.model.vo;

public class TimeTable {

	private int scheduleNo;
	private int placeNo;
	private int day;
	private int time;
	
	public TimeTable() {}

	public TimeTable(int scheduleNo, int placeNo, int day, int time) {
		super();
		this.scheduleNo = scheduleNo;
		this.placeNo = placeNo;
		this.day = day;
		this.time = time;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "TimeTable [scheduleNo=" + scheduleNo + ", placeNo=" + placeNo + ", day=" + day + ", time=" + time + "]";
	}
	
}
