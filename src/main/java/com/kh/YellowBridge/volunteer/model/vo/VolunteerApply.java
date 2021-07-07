package com.kh.YellowBridge.volunteer.model.vo;

import java.sql.Date;

public class VolunteerApply {
	private int serviceappNo;
	private String volReq;
	private String servicepayName;
	private int volPrice;
	private Date volDate;
	private String volStatus;
	private String volYN;
	private int serviceNo;
	private String serviceName;
	private String shelterName;
	private String shelterTel;
	private int memberNo;
	private String mName;
	private String mNickname;
	private String mPhone;
	private String mAddress;
	private String mEmail;
	
	public VolunteerApply() {}

	public VolunteerApply(int serviceappNo, String volReq, String servicepayName, int volPrice, Date volDate,
			String volStatus, String volYN, int serviceNo, int memberNo) {
		super();
		this.serviceappNo = serviceappNo;
		this.volReq = volReq;
		this.servicepayName = servicepayName;
		this.volPrice = volPrice;
		this.volDate = volDate;
		this.volStatus = volStatus;
		this.volYN = volYN;
		this.serviceNo = serviceNo;
		this.memberNo = memberNo;
	}
	
	public VolunteerApply(int serviceappNo, String volReq, String servicepayName, int volPrice, Date volDate,
			String volStatus, String volYN, int serviceNo, int memberNo, String mName, String mNickname, String mPhone,
			String mAddress, String mEmail) {
		super();
		this.serviceappNo = serviceappNo;
		this.volReq = volReq;
		this.servicepayName = servicepayName;
		this.volPrice = volPrice;
		this.volDate = volDate;
		this.volStatus = volStatus;
		this.volYN = volYN;
		this.serviceNo = serviceNo;
		this.memberNo = memberNo;
		this.mName = mName;
		this.mNickname = mNickname;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mEmail = mEmail;
	}
	
	public VolunteerApply(int serviceappNo, String volReq, String servicepayName, int volPrice, Date volDate,
			String volStatus, String volYN, int serviceNo, String serviceName, int memberNo, String mName,
			String mNickname, String mPhone, String mAddress, String mEmail) {
		super();
		this.serviceappNo = serviceappNo;
		this.volReq = volReq;
		this.servicepayName = servicepayName;
		this.volPrice = volPrice;
		this.volDate = volDate;
		this.volStatus = volStatus;
		this.volYN = volYN;
		this.serviceNo = serviceNo;
		this.serviceName = serviceName;
		this.memberNo = memberNo;
		this.mName = mName;
		this.mNickname = mNickname;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mEmail = mEmail;
	}
	
	public VolunteerApply(int serviceappNo, String volReq, String servicepayName, int volPrice, Date volDate,
			String volStatus, String volYN, int serviceNo, String serviceName, String shelterName, String shelterTel,
			int memberNo, String mName, String mNickname, String mPhone, String mAddress, String mEmail) {
		super();
		this.serviceappNo = serviceappNo;
		this.volReq = volReq;
		this.servicepayName = servicepayName;
		this.volPrice = volPrice;
		this.volDate = volDate;
		this.volStatus = volStatus;
		this.volYN = volYN;
		this.serviceNo = serviceNo;
		this.serviceName = serviceName;
		this.shelterName = shelterName;
		this.shelterTel = shelterTel;
		this.memberNo = memberNo;
		this.mName = mName;
		this.mNickname = mNickname;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mEmail = mEmail;
	}

	public int getServiceappNo() {
		return serviceappNo;
	}

	public void setServiceappNo(int serviceappNo) {
		this.serviceappNo = serviceappNo;
	}

	public String getVolReq() {
		return volReq;
	}

	public void setVolReq(String volReq) {
		this.volReq = volReq;
	}

	public String getServicepayName() {
		return servicepayName;
	}

	public void setServicepayName(String servicepayName) {
		this.servicepayName = servicepayName;
	}

	public int getVolPrice() {
		return volPrice;
	}

	public void setVolPrice(int volPrice) {
		this.volPrice = volPrice;
	}

	public Date getVolDate() {
		return volDate;
	}

	public void setVolDate(Date volDate) {
		this.volDate = volDate;
	}

	public String getVolStatus() {
		return volStatus;
	}

	public void setVolStatus(String volStatus) {
		this.volStatus = volStatus;
	}

	public String getVolYN() {
		return volYN;
	}

	public void setVolYN(String volYN) {
		this.volYN = volYN;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
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

	@Override
	public String toString() {
		return "VolunteerApply [serviceappNo=" + serviceappNo + ", volReq=" + volReq + ", servicepayName="
				+ servicepayName + ", volPrice=" + volPrice + ", volDate=" + volDate + ", volStatus=" + volStatus
				+ ", volYN=" + volYN + ", serviceNo=" + serviceNo + ", memberNo=" + memberNo + "]";
	}
	
	
	
}
