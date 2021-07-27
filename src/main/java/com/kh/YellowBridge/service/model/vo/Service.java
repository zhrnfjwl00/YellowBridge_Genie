package com.kh.YellowBridge.service.model.vo;

public class Service {
	private int scNo;
	private String scTitle;
	private String schelterName;
	private String schelterTel;
	private String schelterInfo;
	private String scContent;
	private String scStatus;
	private int fileNo;
	private String fileName;
	private String changeName;
	private String filePath;
	private int cateNo;
	private String cateName;

	
	public Service() {}

	

	public Service(int scNo, String scTitle, String schelterName, String schelterTel, String schelterInfo,
			String scContent, String scStatus, int fileNo, String fileName, String changeName, String filePath,
			int cateNo, String cateName) {
		super();
		this.scNo = scNo;
		this.scTitle = scTitle;
		this.schelterName = schelterName;
		this.schelterTel = schelterTel;
		this.schelterInfo = schelterInfo;
		this.scContent = scContent;
		this.scStatus = scStatus;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.cateNo = cateNo;
		this.cateName = cateName;
	}



	public int getScNo() {
		return scNo;
	}


	public void setScNo(int scNo) {
		this.scNo = scNo;
	}


	public String getScTitle() {
		return scTitle;
	}


	public void setScTitle(String scTitle) {
		this.scTitle = scTitle;
	}


	public String getSchelterName() {
		return schelterName;
	}


	public void setSchelterName(String schelterName) {
		this.schelterName = schelterName;
	}


	public String getSchelterTel() {
		return schelterTel;
	}


	public void setSchelterTel(String schelterTel) {
		this.schelterTel = schelterTel;
	}


	public String getSchelterInfo() {
		return schelterInfo;
	}


	public void setSchelterInfo(String schelterInfo) {
		this.schelterInfo = schelterInfo;
	}


	public String getScContent() {
		return scContent;
	}


	public void setScContent(String scContent) {
		this.scContent = scContent;
	}


	public String getScStatus() {
		return scStatus;
	}


	public void setScStatus(String scStatus) {
		this.scStatus = scStatus;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getCateNo() {
		return cateNo;
	}


	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}


	public String getCateName() {
		return cateName;
	}


	public void setCateName(String cateName) {
		this.cateName = cateName;
	}


	@Override
	public String toString() {
		return "Service [scNo=" + scNo + ", scTitle=" + scTitle + ", schelterName=" + schelterName + ", schelterTel="
				+ schelterTel + ", schelterInfo=" + schelterInfo + ", scContent=" + scContent + ", scStatus=" + scStatus
				+ ", fileNo=" + fileNo + ", fileName=" + fileName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", cateNo=" + cateNo + ", cateName=" + cateName + "]";
	}
	
	
}
