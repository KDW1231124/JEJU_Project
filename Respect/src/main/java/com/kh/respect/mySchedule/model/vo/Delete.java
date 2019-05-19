package com.kh.respect.mySchedule.model.vo;

public class Delete {
	private int no;
	private String userId;
	
	public Delete() {
		
	}

	public Delete(int no, String userId) {
		super();
		this.no = no;
		this.userId = userId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Delete [no=" + no + ", userId=" + userId + "]";
	}
	
	
}
