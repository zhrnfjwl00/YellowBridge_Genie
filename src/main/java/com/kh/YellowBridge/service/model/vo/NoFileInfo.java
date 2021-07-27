package com.kh.YellowBridge.service.model.vo;

import java.sql.Date;

public class NoFileInfo {
	private int fileNo;
	private String fileName;
	private String changeName;
	private Date fileCreateDate;
	private int fileLevel;
	private String filePath;
	private String fileStatus;
	private int BoardNo;
	
	public NoFileInfo(){}
	
	public NoFileInfo(int fileNo, String fileName, String changeName, Date fileCreateDate, int fileLevel,
			String filePath, String fileStatus, int boardNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.fileCreateDate = fileCreateDate;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
		this.fileStatus = fileStatus;
		BoardNo = boardNo;
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
		return BoardNo;
	}

	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}

	@Override
	public String toString() {
		return "NoFileInfo [fileNo=" + fileNo + ", fileName=" + fileName + ", changeName=" + changeName
				+ ", fileCreateDate=" + fileCreateDate + ", fileLevel=" + fileLevel + ", filePath=" + filePath
				+ ", fileStatus=" + fileStatus + ", BoardNo=" + BoardNo + "]";
	}
	
	
}
