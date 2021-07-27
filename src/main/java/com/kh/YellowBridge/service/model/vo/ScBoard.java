package com.kh.YellowBridge.service.model.vo;

import java.sql.Date;

public class ScBoard {
	private int scId; 
	private String scTitle; 
	private int scWriterNo; 
	private String Writer;
	private String scWriter; 
	private String scWriterName;
	private String scWriterNickname;
	private String scContent;
	private String scCategory;
	private int scCateNo;
	private String originalFileName;
	private String renameFileName;
	private int scCount;
	private Date scCreateDate;
	private Date scModifyDate;
	private String scStatus;
	
	public ScBoard() {}

	public ScBoard(int scId, String scTitle, int scWriterNo, String writer, String scWriter, String scWriterName,
			String scWriterNickname, String scContent, String scCategory, int scCateNo, String originalFileName,
			String renameFileName, int scCount, Date scCreateDate, Date scModifyDate, String scStatus) {
		super();
		this.scId = scId;
		this.scTitle = scTitle;
		this.scWriterNo = scWriterNo;
		Writer = writer;
		this.scWriter = scWriter;
		this.scWriterName = scWriterName;
		this.scWriterNickname = scWriterNickname;
		this.scContent = scContent;
		this.scCategory = scCategory;
		this.scCateNo = scCateNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.scCount = scCount;
		this.scCreateDate = scCreateDate;
		this.scModifyDate = scModifyDate;
		this.scStatus = scStatus;
	}

	public int getScId() {
		return scId;
	}

	public void setScId(int scId) {
		this.scId = scId;
	}

	public String getScTitle() {
		return scTitle;
	}

	public void setScTitle(String scTitle) {
		this.scTitle = scTitle;
	}

	public int getScWriterNo() {
		return scWriterNo;
	}

	public void setScWriterNo(int scWriterNo) {
		this.scWriterNo = scWriterNo;
	}

	public String getWriter() {
		return Writer;
	}

	public void setWriter(String writer) {
		Writer = writer;
	}

	public String getScWriter() {
		return scWriter;
	}

	public void setScWriter(String scWriter) {
		this.scWriter = scWriter;
	}

	public String getScWriterName() {
		return scWriterName;
	}

	public void setScWriterName(String scWriterName) {
		this.scWriterName = scWriterName;
	}

	public String getScWriterNickname() {
		return scWriterNickname;
	}

	public void setScWriterNickname(String scWriterNickname) {
		this.scWriterNickname = scWriterNickname;
	}

	public String getScContent() {
		return scContent;
	}

	public void setScContent(String scContent) {
		this.scContent = scContent;
	}

	public String getScCategory() {
		return scCategory;
	}

	public void setScCategory(String scCategory) {
		this.scCategory = scCategory;
	}

	public int getScCateNo() {
		return scCateNo;
	}

	public void setScCateNo(int scCateNo) {
		this.scCateNo = scCateNo;
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

	public int getScCount() {
		return scCount;
	}

	public void setScCount(int scCount) {
		this.scCount = scCount;
	}

	public Date getScCreateDate() {
		return scCreateDate;
	}

	public void setScCreateDate(Date scCreateDate) {
		this.scCreateDate = scCreateDate;
	}

	public Date getScModifyDate() {
		return scModifyDate;
	}

	public void setScModifyDate(Date scModifyDate) {
		this.scModifyDate = scModifyDate;
	}

	public String getScStatus() {
		return scStatus;
	}

	public void setScStatus(String scStatus) {
		this.scStatus = scStatus;
	}

	@Override
	public String toString() {
		return "ScBoard [scId=" + scId + ", scTitle=" + scTitle + ", scWriterNo=" + scWriterNo + ", Writer=" + Writer
				+ ", scWriter=" + scWriter + ", scWriterName=" + scWriterName + ", scWriterNickname=" + scWriterNickname
				+ ", scContent=" + scContent + ", scCategory=" + scCategory + ", scCateNo=" + scCateNo
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", scCount="
				+ scCount + ", scCreateDate=" + scCreateDate + ", scModifyDate=" + scModifyDate + ", scStatus="
				+ scStatus + "]";
	}

	

	

	
	
	
	
}
