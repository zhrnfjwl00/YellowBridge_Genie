package com.kh.YellowBridge.volunteer.model.vo;

public class Volunteer {
	private int serviceNo;
	private String serviceTitle;
	private String shelterName;
	private String shelterTel;
	private String shelterInfo;
	private String serviceContent;
	private String serviceStatus;
	private int fileNo;
	private String fileName;
	private String changeName;
	private String filePath;

	
	public Volunteer() {}

	public Volunteer(int serviceNo, String serviceTitle, String shelterName, String shelterTel, String shelterInfo,
			String serviceContent, String serviceStatus, int fileNo, String fileName, String changeName) {
		super();
		this.serviceNo = serviceNo;
		this.serviceTitle = serviceTitle;
		this.shelterName = shelterName;
		this.shelterTel = shelterTel;
		this.shelterInfo = shelterInfo;
		this.serviceContent = serviceContent;
		this.serviceStatus = serviceStatus;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
	}

	public Volunteer(int serviceNo, String serviceTitle, String shelterName, String shelterTel, String shelterInfo,
			String serviceContent, String serviceStatus) {
		super();
		this.serviceNo = serviceNo;
		this.serviceTitle = serviceTitle;
		this.shelterName = shelterName;
		this.shelterTel = shelterTel;
		this.shelterInfo = shelterInfo;
		this.serviceContent = serviceContent;
		this.serviceStatus = serviceStatus;
	}
	
	public Volunteer(int serviceNo, String serviceTitle, String shelterName, String shelterTel, String shelterInfo,
			String serviceContent, String serviceStatus, int fileNo, String fileName, String changeName,
			String filePath) {
		super();
		this.serviceNo = serviceNo;
		this.serviceTitle = serviceTitle;
		this.shelterName = shelterName;
		this.shelterTel = shelterTel;
		this.shelterInfo = shelterInfo;
		this.serviceContent = serviceContent;
		this.serviceStatus = serviceStatus;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	public String getShelterTel() {
		return shelterTel;
	}

	public void setShelterTel(String shelterTel) {
		this.shelterTel = shelterTel;
	}

	public String getShelterInfo() {
		return shelterInfo;
	}

	public void setShelterInfo(String shelterInfo) {
		this.shelterInfo = shelterInfo;
	}

	public String getServiceContent() {
		return serviceContent;
	}

	public void setServiceContent(String serviceContent) {
		this.serviceContent = serviceContent;
	}

	public String getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
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

	@Override
	public String toString() {
		return "Volunteer [serviceNo=" + serviceNo + ", serviceTitle=" + serviceTitle + ", shelterName=" + shelterName
				+ ", shelterTel=" + shelterTel + ", shelterInfo=" + shelterInfo + ", serviceContent=" + serviceContent
				+ ", serviceStatus=" + serviceStatus + ", fileNo=" + fileNo + ", fileName=" + fileName + ", changeName="
				+ changeName + "]";
	}

	
}
