package com.kh.respect.place.model.vo;

public class PlaceGood {
	private int placeno;
	private String userid;
	
	public PlaceGood() {}

	@Override
	public String toString() {
		return "PlaceGood [placeno=" + placeno + ", userid=" + userid + "]";
	}

	public PlaceGood(int placeno, String userid) {
		super();
		this.placeno = placeno;
		this.userid = userid;
	}

	public int getPlaceno() {
		return placeno;
	}

	public void setPlaceno(int placeno) {
		this.placeno = placeno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
