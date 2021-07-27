package com.kh.YellowBridge.service.model.vo;

import java.sql.Date;

public class QnaBoard {
	private int qId; 
	private String qTitle; 
	private int qWriterNo; 
	private String Writer;
	private String qWriter; 
	private String qWriterName;
	private String qWriterNickname;
	private String qContent;
	private String qCategory;
	private int qCateNo;
	private String originalFileName;
	private String renameFileName;
	private int qCount;
	private Date qCreateDate;
	private Date qModifyDate;
	private String qStatus;
	private int rCount;
	
	public QnaBoard() {}

	public QnaBoard(int qId, String qTitle, int qWriterNo, String writer, String qWriter, String qWriterName,
			String qWriterNickname, String qContent, String qCategory, int qCateNo, String originalFileName,
			String renameFileName, int qCount, Date qCreateDate, Date qModifyDate, String qStatus, int rCount) {
		super();
		this.qId = qId;
		this.qTitle = qTitle;
		this.qWriterNo = qWriterNo;
		Writer = writer;
		this.qWriter = qWriter;
		this.qWriterName = qWriterName;
		this.qWriterNickname = qWriterNickname;
		this.qContent = qContent;
		this.qCategory = qCategory;
		this.qCateNo = qCateNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.qCount = qCount;
		this.qCreateDate = qCreateDate;
		this.qModifyDate = qModifyDate;
		this.qStatus = qStatus;
		this.rCount = rCount;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public int getqWriterNo() {
		return qWriterNo;
	}

	public void setqWriterNo(int qWriterNo) {
		this.qWriterNo = qWriterNo;
	}

	public String getWriter() {
		return Writer;
	}

	public void setWriter(String writer) {
		Writer = writer;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public String getqWriterName() {
		return qWriterName;
	}

	public void setqWriterName(String qWriterName) {
		this.qWriterName = qWriterName;
	}

	public String getqWriterNickname() {
		return qWriterNickname;
	}

	public void setqWriterNickname(String qWriterNickname) {
		this.qWriterNickname = qWriterNickname;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public int getqCateNo() {
		return qCateNo;
	}

	public void setqCateNo(int qCateNo) {
		this.qCateNo = qCateNo;
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

	public int getqCount() {
		return qCount;
	}

	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

	public Date getqCreateDate() {
		return qCreateDate;
	}

	public void setqCreateDate(Date qCreateDate) {
		this.qCreateDate = qCreateDate;
	}

	public Date getqModifyDate() {
		return qModifyDate;
	}

	public void setqModifyDate(Date qModifyDate) {
		this.qModifyDate = qModifyDate;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	@Override
	public String toString() {
		return "QnaBoard [qId=" + qId + ", qTitle=" + qTitle + ", qWriterNo=" + qWriterNo + ", Writer=" + Writer
				+ ", qWriter=" + qWriter + ", qWriterName=" + qWriterName + ", qWriterNickname=" + qWriterNickname
				+ ", qContent=" + qContent + ", qCategory=" + qCategory + ", qCateNo=" + qCateNo + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", qCount=" + qCount + ", qCreateDate="
				+ qCreateDate + ", qModifyDate=" + qModifyDate + ", qStatus=" + qStatus + ", rCount=" + rCount + "]";
	}

	
	
	
	
	
	
	
	
	
}
