package com.kh.YellowBridge.free.model.vo;

import java.sql.Date;

public class Reply {
	private int rId;
	private String rContent;
	private int refBid;
	private String rWriter;
	private String rNickname;
	private int rWriterNo;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	
	public Reply() {}

	public Reply(int rId, String rContent, int refBid, String rWriter, String rNickname, int rWriterNo,
			Date rCreateDate, Date rModifyDate, String rStatus) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.rNickname = rNickname;
		this.rWriterNo = rWriterNo;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getrNickname() {
		return rNickname;
	}

	public void setrNickname(String rNickname) {
		this.rNickname = rNickname;
	}

	public int getrWriterNo() {
		return rWriterNo;
	}

	public void setrWriterNo(int rWriterNo) {
		this.rWriterNo = rWriterNo;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", rNickname=" + rNickname + ", rWriterNo=" + rWriterNo + ", rCreateDate=" + rCreateDate
				+ ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + "]";
	}
	
	
}
