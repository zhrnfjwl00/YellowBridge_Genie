package com.kh.YellowBridge.volunteer.model.vo;

import java.sql.Date;

public class VolReply {
	private int volrId;
	private String volrContent;
	private int volrefBid;
	private String volrWriter;
	private String volrNickname;
	private int volrWriterNo;
	private Date volrCreateDate;
	private Date volrModifyDate;
	private String volrStatus;
	
	public VolReply() {}

	public VolReply(int volrId, String volrContent, int volrefBid, String volrWriter, Date volrCreateDate,
			Date volrModifyDate, String volrStatus) {
		super();
		this.volrId = volrId;
		this.volrContent = volrContent;
		this.volrefBid = volrefBid;
		this.volrWriter = volrWriter;
		this.volrCreateDate = volrCreateDate;
		this.volrModifyDate = volrModifyDate;
		this.volrStatus = volrStatus;
	}
	
	public VolReply(int volrId, String volrContent, int volrefBid, String volrWriter, int volrWriterNo,
			Date volrCreateDate, Date volrModifyDate, String volrStatus) {
		super();
		this.volrId = volrId;
		this.volrContent = volrContent;
		this.volrefBid = volrefBid;
		this.volrWriter = volrWriter;
		this.volrWriterNo = volrWriterNo;
		this.volrCreateDate = volrCreateDate;
		this.volrModifyDate = volrModifyDate;
		this.volrStatus = volrStatus;
	}
	
	public VolReply(int volrId, String volrContent, int volrefBid, String volrWriter, String volrNickname,
			int volrWriterNo, Date volrCreateDate, Date volrModifyDate, String volrStatus) {
		super();
		this.volrId = volrId;
		this.volrContent = volrContent;
		this.volrefBid = volrefBid;
		this.volrWriter = volrWriter;
		this.volrNickname = volrNickname;
		this.volrWriterNo = volrWriterNo;
		this.volrCreateDate = volrCreateDate;
		this.volrModifyDate = volrModifyDate;
		this.volrStatus = volrStatus;
	}

	public int getVolrId() {
		return volrId;
	}

	public void setVolrId(int volrId) {
		this.volrId = volrId;
	}

	public String getVolrContent() {
		return volrContent;
	}

	public void setVolrContent(String volrContent) {
		this.volrContent = volrContent;
	}

	public int getVolrefBid() {
		return volrefBid;
	}

	public void setVolrefBid(int volrefBid) {
		this.volrefBid = volrefBid;
	}

	public String getVolrWriter() {
		return volrWriter;
	}

	public void setVolrWriter(String volrWriter) {
		this.volrWriter = volrWriter;
	}

	public Date getVolrCreateDate() {
		return volrCreateDate;
	}

	public void setVolrCreateDate(Date volrCreateDate) {
		this.volrCreateDate = volrCreateDate;
	}

	public Date getVolrModifyDate() {
		return volrModifyDate;
	}

	public void setVolrModifyDate(Date volrModifyDate) {
		this.volrModifyDate = volrModifyDate;
	}

	public String getVolrStatus() {
		return volrStatus;
	}

	public void setVolrStatus(String volrStatus) {
		this.volrStatus = volrStatus;
	}
	
	public int getVolrWriterNo() {
		return volrWriterNo;
	}

	public void setVolrWriterNo(int volrWriterNo) {
		this.volrWriterNo = volrWriterNo;
	}
	
	public String getVolrNickname() {
		return volrNickname;
	}

	public void setVolrNickname(String volrNickname) {
		this.volrNickname = volrNickname;
	}

	@Override
	public String toString() {
		return "VolReply [volrId=" + volrId + ", volrContent=" + volrContent + ", volrefBid=" + volrefBid
				+ ", volrWriter=" + volrWriter + ", volrCreateDate=" + volrCreateDate + ", volrModifyDate="
				+ volrModifyDate + ", volrStatus=" + volrStatus + "]";
	}

	
	
}
