package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class FileInfo {
	private int fileNo;
	private String fileName;
	private String ChangeName;
	private Date fileCreateDate;
	private int fileLevel;
	private String filePath;
	private int BoardNo;
	
	public FileInfo() {}

	public FileInfo(int fileNo, String fileName, String changeName, Date fileCreateDate, int fileLevel, String filePath,
			int boardNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		ChangeName = changeName;
		this.fileCreateDate = fileCreateDate;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
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
		return ChangeName;
	}

	public void setChangeName(String changeName) {
		ChangeName = changeName;
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

	public int getBoardNo() {
		return BoardNo;
	}

	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}

	@Override
	public String toString() {
		return "FileInfo [fileNo=" + fileNo + ", fileName=" + fileName + ", ChangeName=" + ChangeName
				+ ", fileCreateDate=" + fileCreateDate + ", fileLevel=" + fileLevel + ", filePath=" + filePath
				+ ", BoardNo=" + BoardNo + "]";
	}

	
	
	

}
