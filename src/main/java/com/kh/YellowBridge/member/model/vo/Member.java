package com.kh.YellowBridge.member.model.vo;

import java.sql.Date;

public class Member {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private String address;
	private String birth;
	private Date date;
	private String email;
	private String grade;
	private String mStatus;
	
	public Member() {}

	public Member(int no, String id, String pwd, String name, String nickname, String phone, String address,
			String birth, Date date, String email, String grade, String mStatus) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.address = address;
		this.birth = birth;
		this.date = date;
		this.email = email;
		this.grade = grade;
		this.mStatus = mStatus;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname
				+ ", phone=" + phone + ", address=" + address + ", birth=" + birth + ", date=" + date + ", email="
				+ email + ", grade=" + grade + ", mStatus=" + mStatus + "]";
	}

	
	
}