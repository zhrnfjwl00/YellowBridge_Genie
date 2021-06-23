package com.kh.YellowBridge.volunteer.model.vo;

import java.sql.Date;

public class VolunteerBoard {
	private int volId;
	private String volTitle;
	private String volWriter;
	private String volContent;
	private String volCategory;
	private int volCateNo;
	private String originalFileName;
	private String renameFileName;
	private int volCount;
	private Date volCreateDate;
	private Date volModifyDate;
	private String volStatus;
	
	public VolunteerBoard() {}

	public VolunteerBoard(int volId, String volTitle, String volWriter, String volContent, String volCategory,
			int volCateNo, String originalFileName, String renameFileName, int volCount, Date volCreateDate,
			Date volModifyDate, String volStatus) {
		super();
		this.volId = volId;
		this.volTitle = volTitle;
		this.volWriter = volWriter;
		this.volContent = volContent;
		this.volCategory = volCategory;
		this.volCateNo = volCateNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.volCount = volCount;
		this.volCreateDate = volCreateDate;
		this.volModifyDate = volModifyDate;
		this.volStatus = volStatus;
	}

	public int getVolId() {
		return volId;
	}

	public void setVolId(int volId) {
		this.volId = volId;
	}

	public String getVolTitle() {
		return volTitle;
	}

	public void setVolTitle(String volTitle) {
		this.volTitle = volTitle;
	}

	public String getVolWriter() {
		return volWriter;
	}

	public void setVolWriter(String volWriter) {
		this.volWriter = volWriter;
	}

	public String getVolContent() {
		return volContent;
	}

	public void setVolContent(String volContent) {
		this.volContent = volContent;
	}

	public String getVolCategory() {
		return volCategory;
	}

	public void setVolCategory(String volCategory) {
		this.volCategory = volCategory;
	}

	public int getVolCateNo() {
		return volCateNo;
	}

	public void setVolCateNo(int volCateNo) {
		this.volCateNo = volCateNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getVolCount() {
		return volCount;
	}

	public void setVolCount(int volCount) {
		this.volCount = volCount;
	}

	public Date getVolCreateDate() {
		return volCreateDate;
	}

	public void setVolCreateDate(Date volCreateDate) {
		this.volCreateDate = volCreateDate;
	}

	public Date getVolModifyDate() {
		return volModifyDate;
	}

	public void setVolModifyDate(Date volModifyDate) {
		this.volModifyDate = volModifyDate;
	}

	public String getVolStatus() {
		return volStatus;
	}

	public void setVolStatus(String volStatus) {
		this.volStatus = volStatus;
	}

	@Override
	public String toString() {
		return "VolunteerBoard [volId=" + volId + ", volTitle=" + volTitle + ", volWriter=" + volWriter
				+ ", volContent=" + volContent + ", volCategory=" + volCategory + ", volCateNo=" + volCateNo
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", volCount="
				+ volCount + ", volCreateDate=" + volCreateDate + ", volModifyDate=" + volModifyDate + ", volStatus="
				+ volStatus + "]";
	}
	
	
}
