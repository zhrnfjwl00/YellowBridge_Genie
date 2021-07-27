package com.kh.YellowBridge.adoption.model.vo;

import java.util.Date;

public class AdoptionReply {
	private int rId;
	private String rContent;
	private int refBid;
	private String rWriter;
	private String rNickname;
	private String rWriterNo;
	private Date rCreateDate;
	private String rStatus;
	
	public AdoptionReply() {}

	public AdoptionReply(int rId, String rContent, int refBid, String rWriter, String rNickname, String rWriterNo,
			Date rCreateDate, String rStatus) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.rNickname = rNickname;
		this.rWriterNo = rWriterNo;
		this.rCreateDate = rCreateDate;
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

	public String getrWriterNo() {
		return rWriterNo;
	}

	public void setrWriterNo(String rWriterNo) {
		this.rWriterNo = rWriterNo;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "AdoptionReply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", rNickname=" + rNickname + ", rWriterNo=" + rWriterNo + ", rCreateDate=" + rCreateDate
				+ ", rStatus=" + rStatus + "]";
	}


	
}
