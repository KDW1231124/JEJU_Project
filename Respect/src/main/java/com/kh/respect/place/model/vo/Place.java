package com.kh.respect.place.model.vo;

public class Place {
	private int placeno;
	private String majorcategory;
	private String minorcategory;
	private String area;
	private String userid;
	private String title;
	private int gpa;
	private String address;
	private String phone;
	private int goodcount;
	private int bringcount;
	private int replycount;
	private int hitscount;
	private String content;
	private String thumbnail;
	private String mainimage;
	
	public Place() {}
    
    public Place(int placeno, String title, String address) {
        super();
        this.placeno = placeno;
        this.title = title;
        this.address = address;
    }
	
	

	public Place(int placeno, String majorcategory, String minorcategory, String area, String userid, String title,
			int gpa, String address, String phone, int goodcount, int bringcount, int replycount, int hitscount,
			String content, String thumbnail, String mainimage) {
		super();
		this.placeno = placeno;
		this.majorcategory = majorcategory;
		this.minorcategory = minorcategory;
		this.area = area;
		this.userid = userid;
		this.title = title;
		this.gpa = gpa;
		this.address = address;
		this.phone = phone;
		this.goodcount = goodcount;
		this.bringcount = bringcount;
		this.replycount = replycount;
		this.hitscount = hitscount;
		this.content = content;
		this.thumbnail = thumbnail;
		this.mainimage  = mainimage;
		this.mainimage = mainimage;
	}

	public int getPlaceno() {
		return placeno;
	}

	public void setPlaceno(int placeno) {
		this.placeno = placeno;
	}

	public String getMajorcategory() {
		return majorcategory;
	}

	public void setMajorcategory(String majorcategory) {
		this.majorcategory = majorcategory;
	}

	public String getMinorcategory() {
		return minorcategory;
	}

	public void setMinorcategory(String minorcategory) {
		this.minorcategory = minorcategory;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getGpa() {
		return gpa;
	}

	public void setGpa(int gpa) {
		this.gpa = gpa;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getGoodcount() {
		return goodcount;
	}

	public void setGoodcount(int goodcount) {
		this.goodcount = goodcount;
	}

	public int getBringcount() {
		return bringcount;
	}

	public void setBringcount(int bringcount) {
		this.bringcount = bringcount;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public int getHitscount() {
		return hitscount;
	}

	public void setHitscount(int hitscount) {
		this.hitscount = hitscount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getMainimage() {
		return mainimage;
	}

	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}

	@Override
	public String toString() {
        return placeno+","+title+","+address;

	}
	
	

}
