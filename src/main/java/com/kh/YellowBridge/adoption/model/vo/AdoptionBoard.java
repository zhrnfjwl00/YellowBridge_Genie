package com.kh.YellowBridge.adoption.model.vo;

import java.sql.Date;

public class AdoptionBoard {
	
	private int adopId;
	private String adopTitle;
	private int adopWriterNo;
	private String adopWriter;
	private String adopWriterName;
	private String adopWriterNickname;
	private String adopContent;
	private String adopCategory;
	private int adopCateNo;
	private String originalFileName;
	private String renameFileName;
	private int adopView;
	private Date adopCreateDate;
	private Date adopModifyDate;
	private String adopStatus;
	
	public AdoptionBoard() {}

	public AdoptionBoard(int adopId, String adopTitle, int adopWriterNo, String adopWriter, String adopWriterName,
			String adopWriterNickname, String adopContent, String adopCategory, int adopCateNo, String originalFileName,
			String renameFileName, int adopView, Date adopCreateDate, Date adopModifyDate) {
		super();
		this.adopId = adopId;
		this.adopTitle = adopTitle;
		this.adopWriterNo = adopWriterNo;
		this.adopWriter = adopWriter;
		this.adopWriterName = adopWriterName;
		this.adopWriterNickname = adopWriterNickname;
		this.adopContent = adopContent;
		this.adopCategory = adopCategory;
		this.adopCateNo = adopCateNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.adopView = adopView;
		this.adopCreateDate = adopCreateDate;
		this.adopModifyDate = adopModifyDate;
	}

	public AdoptionBoard(int adopId, String adopTitle, int adopWriterNo, String adopWriter, String adopWriterName,
			String adopWriterNickname, String adopContent, String adopCategory, int adopCateNo, String originalFileName,
			String renameFileName, int adopView, Date adopCreateDate, Date adopModifyDate, String adopStatus) {
		super();
		this.adopId = adopId;
		this.adopTitle = adopTitle;
		this.adopWriterNo = adopWriterNo;
		this.adopWriter = adopWriter;
		this.adopWriterName = adopWriterName;
		this.adopWriterNickname = adopWriterNickname;
		this.adopContent = adopContent;
		this.adopCategory = adopCategory;
		this.adopCateNo = adopCateNo;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.adopView = adopView;
		this.adopCreateDate = adopCreateDate;
		this.adopModifyDate = adopModifyDate;
		this.adopStatus = adopStatus;
	}

	public int getAdopId() {
		return adopId;
	}

	public void setAdopId(int adopId) {
		this.adopId = adopId;
	}

	public String getAdopTitle() {
		return adopTitle;
	}

	public void setAdopTitle(String adopTitle) {
		this.adopTitle = adopTitle;
	}

	public int getAdopWriterNo() {
		return adopWriterNo;
	}

	public void setAdopWriterNo(int adopWriterNo) {
		this.adopWriterNo = adopWriterNo;
	}

	public String getAdopWriter() {
		return adopWriter;
	}

	public void setAdopWriter(String adopWriter) {
		this.adopWriter = adopWriter;
	}

	public String getAdopWriterName() {
		return adopWriterName;
	}

	public void setAdopWriterName(String adopWriterName) {
		this.adopWriterName = adopWriterName;
	}

	public String getAdopWriterNickname() {
		return adopWriterNickname;
	}

	public void setAdopWriterNickname(String adopWriterNickname) {
		this.adopWriterNickname = adopWriterNickname;
	}

	public String getAdopContent() {
		return adopContent;
	}

	public void setAdopContent(String adopContent) {
		this.adopContent = adopContent;
	}

	public String getAdopCategory() {
		return adopCategory;
	}

	public void setAdopCategory(String adopCategory) {
		this.adopCategory = adopCategory;
	}

	public int getAdopCateNo() {
		return adopCateNo;
	}

	public void setAdopCateNo(int adopCateNo) {
		this.adopCateNo = adopCateNo;
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

	public int getAdopView() {
		return adopView;
	}

	public void setAdopView(int adopView) {
		this.adopView = adopView;
	}

	public Date getAdopCreateDate() {
		return adopCreateDate;
	}

	public void setAdopCreateDate(Date adopCreateDate) {
		this.adopCreateDate = adopCreateDate;
	}

	public Date getAdopModifyDate() {
		return adopModifyDate;
	}

	public void setAdopModifyDate(Date adopModifyDate) {
		this.adopModifyDate = adopModifyDate;
	}

	public String getAdopStatus() {
		return adopStatus;
	}

	public void setAdopStatus(String adopStatus) {
		this.adopStatus = adopStatus;
	}

	@Override
	public String toString() {
		return "AdoptionBoard [adopId=" + adopId + ", adopTitle=" + adopTitle + ", adopWriterNo=" + adopWriterNo
				+ ", adopWriter=" + adopWriter + ", adopWriterName=" + adopWriterName + ", adopWriterNickname="
				+ adopWriterNickname + ", adopContent=" + adopContent + ", adopCategory=" + adopCategory
				+ ", adopCateNo=" + adopCateNo + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", adopView=" + adopView + ", adopCreateDate=" + adopCreateDate + ", adopModifyDate="
				+ adopModifyDate + ", adopStatus=" + adopStatus + "]";
	}
	
	
	

}
