package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class Reply {
	private int rId;
	private String rContent;
	private int refBid;
	private String rWriter;
	private Date rCreateDate;
	private String rStatus;
	private int memberNo;
	private String memberNick;
	
	public Reply() {}

	public Reply(int rId, String rContent, int refBid, String rWriter, Date rCreateDate, String rStatus, int memberNo,
			String memberNick) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rStatus = rStatus;
		this.memberNo = memberNo;
		this.memberNick = memberNick;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", rCreateDate=" + rCreateDate + ", rStatus=" + rStatus + ", memberNo=" + memberNo + ", memberNick="
				+ memberNick + "]";
	}

	

}
