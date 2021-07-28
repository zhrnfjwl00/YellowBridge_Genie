package com.kh.YellowBridge.free.model.vo;

import java.sql.Date;

public class Free {
	private int bId;
	private String bTitle;
	private String bWriter;
	private String bWriterName;
	private String bWriterNickname;
	private String bContent;
	private String bStatus;
	private String bCategory;
	private String originalFileName;
	private String renameFileName;
	private Date bCreateDate;
	private Date bModifyDate;
	private int bCount;
	private int bCateNo;
	private int bWriterNo; 
	private int rCount;
	
	public Free() {}

	public Free(int bId, String bTitle, String bWriter, String bWriterName, String bWriterNickname, String bContent,
			String bStatus, String bCategory, String originalFileName, String renameFileName, Date bCreateDate,
			Date bModifyDate, int bCount, int bCateNo, int bWriterNo, int rCount) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bWriterName = bWriterName;
		this.bWriterNickname = bWriterNickname;
		this.bContent = bContent;
		this.bStatus = bStatus;
		this.bCategory = bCategory;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bCount = bCount;
		this.bCateNo = bCateNo;
		this.bWriterNo = bWriterNo;
		this.rCount = rCount;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbWriterName() {
		return bWriterName;
	}

	public void setbWriterName(String bWriterName) {
		this.bWriterName = bWriterName;
	}

	public String getbWriterNickname() {
		return bWriterNickname;
	}

	public void setbWriterNickname(String bWriterNickname) {
		this.bWriterNickname = bWriterNickname;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
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

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getbCateNo() {
		return bCateNo;
	}

	public void setbCateNo(int bCateNo) {
		this.bCateNo = bCateNo;
	}

	public int getbWriterNo() {
		return bWriterNo;
	}

	public void setbWriterNo(int bWriterNo) {
		this.bWriterNo = bWriterNo;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	@Override
	public String toString() {
		return "Free [bId=" + bId + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bWriterName=" + bWriterName
				+ ", bWriterNickname=" + bWriterNickname + ", bContent=" + bContent + ", bStatus=" + bStatus
				+ ", bCategory=" + bCategory + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", bCreateDate=" + bCreateDate + ", bModifyDate=" + bModifyDate + ", bCount="
				+ bCount + ", bCateNo=" + bCateNo + ", bWriterNo=" + bWriterNo + ", rCount=" + rCount + "]";
	}
	
	

	
	
}
