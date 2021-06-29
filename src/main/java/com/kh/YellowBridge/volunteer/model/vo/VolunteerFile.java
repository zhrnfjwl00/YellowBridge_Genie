package com.kh.YellowBridge.volunteer.model.vo;

import java.sql.Date;

public class VolunteerFile {
	private int fileNo;
	private String fileName;
	private String changeName;
	private Date fCreateDate;
	private int fileLevel;
	private String filePath;
	private int boardNo;
	private int serviceNo;
	
	public VolunteerFile() {}

	public VolunteerFile(int fileNo, String fileName, String changeName, Date fCreateDate, int fileLevel,
			String filePath, int boardNo, int serviceNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.fCreateDate = fCreateDate;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getfCreateDate() {
		return fCreateDate;
	}

	public void setfCreateDate(Date fCreateDate) {
		this.fCreateDate = fCreateDate;
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
		return "VolunteerFile [fileNo=" + fileNo + ", fileName=" + fileName + ", changeName=" + changeName
				+ ", fCreateDate=" + fCreateDate + ", fileLevel=" + fileLevel + ", filePath=" + filePath + ", boardNo="
				+ boardNo + ", serviceNo=" + serviceNo + "]";
	}
	
}
