package com.kh.YellowBridge.adoption.model.vo;

import java.util.Date;

public class AnimalRequest {
	private int requestNo;
	private String requestReason;
	private String requestAgreement;
	private String requestExperience;
	private String requestPoss;
	private String requestQuestion1;
	private String requestQuestion2;
	private String requestTnrAgree;
	private int requestMemberNo;
	private int requestAnimalNo;
	private String requestState;
	private Date requestDate;

	public AnimalRequest() {
	}

	public AnimalRequest(int requestNo, String requestReason, String requestAgreement, String requestExperience,
			String requestPoss, String requestQuestion1, String requestQuestion2, String requestTnrAgree,
			int requestMemberNo, int requestAnimalNo, String requestState, Date requestDate) {
		super();
		this.requestNo = requestNo;
		this.requestReason = requestReason;
		this.requestAgreement = requestAgreement;
		this.requestExperience = requestExperience;
		this.requestPoss = requestPoss;
		this.requestQuestion1 = requestQuestion1;
		this.requestQuestion2 = requestQuestion2;
		this.requestTnrAgree = requestTnrAgree;
		this.requestMemberNo = requestMemberNo;
		this.requestAnimalNo = requestAnimalNo;
		this.requestState = requestState;
		this.requestDate = requestDate;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public String getRequestReason() {
		return requestReason;
	}

	public void setRequestReason(String requestReason) {
		this.requestReason = requestReason;
	}

	public String getRequestAgreement() {
		return requestAgreement;
	}

	public void setRequestAgreement(String requestAgreement) {
		this.requestAgreement = requestAgreement;
	}

	public String getRequestExperience() {
		return requestExperience;
	}

	public void setRequestExperience(String requestExperience) {
		this.requestExperience = requestExperience;
	}

	public String getRequestPoss() {
		return requestPoss;
	}

	public void setRequestPoss(String requestPoss) {
		this.requestPoss = requestPoss;
	}

	public String getRequestQuestion1() {
		return requestQuestion1;
	}

	public void setRequestQuestion1(String requestQuestion1) {
		this.requestQuestion1 = requestQuestion1;
	}

	public String getRequestQuestion2() {
		return requestQuestion2;
	}

	public void setRequestQuestion2(String requestQuestion2) {
		this.requestQuestion2 = requestQuestion2;
	}

	public String getRequestTnrAgree() {
		return requestTnrAgree;
	}

	public void setRequestTnrAgree(String requestTnrAgree) {
		this.requestTnrAgree = requestTnrAgree;
	}

	public int getRequestMemberNo() {
		return requestMemberNo;
	}

	public void setRequestMemberNo(int requestMemberNo) {
		this.requestMemberNo = requestMemberNo;
	}

	public int getRequestAnimalNo() {
		return requestAnimalNo;
	}

	public void setRequestAnimalNo(int requestAnimalNo) {
		this.requestAnimalNo = requestAnimalNo;
	}

	public String getRequestState() {
		return requestState;
	}

	public void setRequestState(String requestState) {
		this.requestState = requestState;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	@Override
	public String toString() {
		return "AnimalRequest [requestNo=" + requestNo + ", requestReason=" + requestReason + ", requestAgreement="
				+ requestAgreement + ", requestExperience=" + requestExperience + ", requestPoss=" + requestPoss
				+ ", requestQuestion1=" + requestQuestion1 + ", requestQuestion2=" + requestQuestion2
				+ ", requestTnrAgree=" + requestTnrAgree + ", requestMemberNo=" + requestMemberNo + ", requestAnimalNo="
				+ requestAnimalNo + ", requestState=" + requestState + ", requestDate=" + requestDate + "]";
	}


}
