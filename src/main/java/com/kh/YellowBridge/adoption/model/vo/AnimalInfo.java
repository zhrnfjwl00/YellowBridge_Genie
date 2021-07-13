package com.kh.YellowBridge.adoption.model.vo;

import java.util.Date;

public class AnimalInfo {
	private int animalNo;
	private String animalType;
	private String animalGender;
	private int animalAge;
	private String animalColor;
	private String animalTnr;
	private String animalCharacter;
	private String animalWeight;
	private String animalCondition;
	private String animalFeature;
	private Date rescueDate;
	private String rescueLocation;
	private int animalBoardNo;
	private String animalStatus;
	private String animalFile;
	
	public AnimalInfo() {}

	public AnimalInfo(int animalNo, String animalType, String animalGender, int animalAge, String animalColor,
			String animalTnr, String animalCharacter, String animalWeight, String animalCondition, String animalFeature,
			Date rescueDate, String rescueLocation, int animalBoardNo, String animalStatus, String animalFile) {
		super();
		this.animalNo = animalNo;
		this.animalType = animalType;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalColor = animalColor;
		this.animalTnr = animalTnr;
		this.animalCharacter = animalCharacter;
		this.animalWeight = animalWeight;
		this.animalCondition = animalCondition;
		this.animalFeature = animalFeature;
		this.rescueDate = rescueDate;
		this.rescueLocation = rescueLocation;
		this.animalBoardNo = animalBoardNo;
		this.animalStatus = animalStatus;
		this.animalFile = animalFile;
	}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	public String getAnimalGender() {
		return animalGender;
	}

	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public String getAnimalColor() {
		return animalColor;
	}

	public void setAnimalColor(String animalColor) {
		this.animalColor = animalColor;
	}

	public String getAnimalTnr() {
		return animalTnr;
	}

	public void setAnimalTnr(String animalTnr) {
		this.animalTnr = animalTnr;
	}

	public String getAnimalCharacter() {
		return animalCharacter;
	}

	public void setAnimalCharacter(String animalCharacter) {
		this.animalCharacter = animalCharacter;
	}

	public String getAnimalWeight() {
		return animalWeight;
	}

	public void setAnimalWeight(String animalWeight) {
		this.animalWeight = animalWeight;
	}

	public String getAnimalCondition() {
		return animalCondition;
	}

	public void setAnimalCondition(String animalCondition) {
		this.animalCondition = animalCondition;
	}

	public String getAnimalFeature() {
		return animalFeature;
	}

	public void setAnimalFeature(String animalFeature) {
		this.animalFeature = animalFeature;
	}

	public Date getRescueDate() {
		return rescueDate;
	}

	public void setRescueDate(Date rescueDate) {
		this.rescueDate = rescueDate;
	}

	public String getRescueLocation() {
		return rescueLocation;
	}

	public void setRescueLocation(String rescueLocation) {
		this.rescueLocation = rescueLocation;
	}

	public int getAnimalBoardNo() {
		return animalBoardNo;
	}

	public void setAnimalBoardNo(int animalBoardNo) {
		this.animalBoardNo = animalBoardNo;
	}

	public String getAnimalStatus() {
		return animalStatus;
	}

	public void setAnimalStatus(String animalStatus) {
		this.animalStatus = animalStatus;
	}

	public String getAnimalFile() {
		return animalFile;
	}

	public void setAnimalFile(String animalFile) {
		this.animalFile = animalFile;
	}

	@Override
	public String toString() {
		return "AnimalInfo [animalNo=" + animalNo + ", animalType=" + animalType + ", animalGender=" + animalGender
				+ ", animalAge=" + animalAge + ", animalColor=" + animalColor + ", animalTnr=" + animalTnr
				+ ", animalCharacter=" + animalCharacter + ", animalWeight=" + animalWeight + ", animalCondition="
				+ animalCondition + ", animalFeature=" + animalFeature + ", rescueDate=" + rescueDate
				+ ", rescueLocation=" + rescueLocation + ", animalBoardNo=" + animalBoardNo + ", animalStatus="
				+ animalStatus + ", animalFile=" + animalFile + "]";
	}
	
	



}
