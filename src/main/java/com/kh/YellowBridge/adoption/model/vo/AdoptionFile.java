package com.kh.YellowBridge.adoption.model.vo;

import java.sql.Date;

public class AdoptionFile {
	private int fileNo;
	private String fileName;
	private String fileChangeName;
	private Date fileCreateDate;
	private int fileLevel;
	private String filePath;
	private String fileStatus;
	private int boardNo;
	private int serviceNo;
	
	public AdoptionFile() {}

	public AdoptionFile(int fileNo, String fileName, String fileChangeName, Date fileCreateDate, int fileLevel,
			String filePath, String fileStatus, int boardNo, int serviceNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileChangeName = fileChangeName;
		this.fileCreateDate = fileCreateDate;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
		this.boardNo = boardNo;
		this.serviceNo = serviceNo;
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

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public Date getFileCreateDate() {
		return fileCreateDate;
	}

	public void setFileCreateDate(Date fileCreateDate) {
		this.fileCreateDate = fileCreateDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	@Override
	public String toString() {
		return "AdoptionFile [fileNo=" + fileNo + ", fileName=" + fileName + ", fileChangeName=" + fileChangeName
				+ ", fileCreateDate=" + fileCreateDate + ", fileLevel=" + fileLevel + ", filePath=" + filePath
				+ ", fileStatus=" + fileStatus + ", boardNo=" + boardNo + ", serviceNo=" + serviceNo + "]";
	}
	
	

}
