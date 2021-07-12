package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class SReply {
	private int rNo;
	private String rContent;
	private Date rDate;
	private String rStatus;
	private int memNo;
	private int bNo;
	
	public SReply() {}

	public SReply(int rNo, String rContent, Date rDate, String rStatus, int memNo, int bNo) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rStatus = rStatus;
		this.memNo = memNo;
		this.bNo = bNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	@Override
	public String toString() {
		return "SReply [rNo=" + rNo + ", rContent=" + rContent + ", rDate=" + rDate + ", rStatus=" + rStatus
				+ ", memNo=" + memNo + ", bNo=" + bNo + "]";
	}
	
	
	
	

}
