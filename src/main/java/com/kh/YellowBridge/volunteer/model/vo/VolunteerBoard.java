package com.kh.YellowBridge.volunteer.model.vo;

import java.sql.Date;

public class VolunteerBoard {
	private int volId;
	private String volTitle;
	private int volWriterNo;
	private String volWriter;
	private String volWriterName;
	private String volWriterNickname;
	private String volContent;
	private String volCategory;
	private int volCateNo;
	private String volParentCate;
	private String originalFileName;
	private String renameFileName;
	private int volCount;
	private Date volCreateDate;
	private Date volModifyDate;
	private String volStatus;
	private int rCount;
	private int serviceNo;
	
	public VolunteerBoard() {}
	
	public VolunteerBoard(int volId, String volTitle, int volWriterNo, String volWriter, String volContent,
			String volCategory, int volCateNo, String originalFileName, String renameFileName, int volCount,
			Date volCreateDate, Date volModifyDate, String volStatus) {
		super();
		this.volId = volId;
		this.volTitle = volTitle;
		this.volWriterNo = volWriterNo;
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

	
	public VolunteerBoard(int volId, String volTitle, int volWriterNo, String volWriter, String volWriterName,
			String volWriterNickname, String volContent, String volCategory, int volCateNo, String originalFileName,
			String renameFileName, int volCount, Date volCreateDate, Date volModifyDate, String volStatus) {
		super();
		this.volId = volId;
		this.volTitle = volTitle;
		this.volWriterNo = volWriterNo;
		this.volWriter = volWriter;
		this.volWriterName = volWriterName;
		this.volWriterNickname = volWriterNickname;
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
	
	public VolunteerBoard(int volId, String volTitle, int volWriterNo, String volWriter, String volWriterName,
			String volWriterNickname, String volContent, String volCategory, int volCateNo, String volParentCate,
			String originalFileName, String renameFileName, int volCount, Date volCreateDate, Date volModifyDate,
			String volStatus) {
		super();
		this.volId = volId;
		this.volTitle = volTitle;
		this.volWriterNo = volWriterNo;
		this.volWriter = volWriter;
		this.volWriterName = volWriterName;
		this.volWriterNickname = volWriterNickname;
		this.volContent = volContent;
		this.volCategory = volCategory;
		this.volCateNo = volCateNo;
		this.volParentCate = volParentCate;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.volCount = volCount;
		this.volCreateDate = volCreateDate;
		this.volModifyDate = volModifyDate;
		this.volStatus = volStatus;
	}
	
	public VolunteerBoard(int volId, String volTitle, int volWriterNo, String volWriter, String volWriterName,
			String volWriterNickname, String volContent, String volCategory, int volCateNo, String volParentCate,
			String originalFileName, String renameFileName, int volCount, Date volCreateDate, Date volModifyDate,
			String volStatus, int rCount) {
		super();
		this.volId = volId;
		this.volTitle = volTitle;
		this.volWriterNo = volWriterNo;
		this.volWriter = volWriter;
		this.volWriterName = volWriterName;
		this.volWriterNickname = volWriterNickname;
		this.volContent = volContent;
		this.volCategory = volCategory;
		this.volCateNo = volCateNo;
		this.volParentCate = volParentCate;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.volCount = volCount;
		this.volCreateDate = volCreateDate;
		this.volModifyDate = volModifyDate;
		this.volStatus = volStatus;
		this.rCount = rCount;
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
	
	public int getVolWriterNo() {
		return volWriterNo;
	}

	public void setVolWriterNo(int volWriterNo) {
		this.volWriterNo = volWriterNo;
	}

	public String getVolWriter() {
		return volWriter;
	}

	public void setVolWriter(String volWriter) {
		this.volWriter = volWriter;
	}
	
	public String getVolWriterName() {
		return volWriterName;
	}

	public void setVolWriterName(String volWriterName) {
		this.volWriterName = volWriterName;
	}

	public String getVolWriterNickname() {
		return volWriterNickname;
	}

	public void setVolWriterNickname(String volWriterNickname) {
		this.volWriterNickname = volWriterNickname;
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
	
	public String getVolParentCate() {
		return volParentCate;
	}

	public void setVolParentCate(String volParentCate) {
		this.volParentCate = volParentCate;
	}
	
	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	@Override
	public String toString() {
		return "VolunteerBoard [volId=" + volId + ", volTitle=" + volTitle + ", volWriterNo=" + volWriterNo
				+ ", volWriter=" + volWriter + ", volWriterName=" + volWriterName + ", volWriterNickname="
				+ volWriterNickname + ", volContent=" + volContent + ", volCategory=" + volCategory + ", volCateNo="
				+ volCateNo + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
				+ ", volCount=" + volCount + ", volCreateDate=" + volCreateDate + ", volModifyDate=" + volModifyDate
				+ ", volStatus=" + volStatus + "]";
	}

	
	
	
}
