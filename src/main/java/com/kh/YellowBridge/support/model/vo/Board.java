package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bView;
	private Date bCreateDate;
	private Date bModifyDate;
	private String bStatus;
	private int cateNo;
	private String nickname;
	
	public Board() {}

	public Board(int bNo, String bTitle, String bContent, String bWriter, int bView, Date bCreateDate, Date bModifyDate,
			String bStatus, int cateNo, String nickname) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bView = bView;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bStatus = bStatus;
		this.cateNo = cateNo;
		this.nickname = nickname;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbView() {
		return bView;
	}

	public void setbView(int bView) {
		this.bView = bView;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bView=" + bView + ", bCreateDate=" + bCreateDate + ", bModifyDate=" + bModifyDate + ", bStatus="
				+ bStatus + ", cateNo=" + cateNo + ", nickname=" + nickname + "]";
	}

	

	

}
