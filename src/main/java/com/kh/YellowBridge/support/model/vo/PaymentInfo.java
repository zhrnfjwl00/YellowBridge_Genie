package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class PaymentInfo {
	private int payNo;
	private String imp_uid;
	private int memNo;
	private String confirmPwd;
	private String userName;
	private int tel;
	private String email;
	private String addr;
	private int price;
	private Date orderDate;
	private String orderStatus;
	private String status;
	
	public PaymentInfo() {}

	public PaymentInfo(int payNo, String imp_uid, int memNo, String confirmPwd, String userName, int tel, String email,
			String addr, int price, Date orderDate, String orderStatus, String status) {
		super();
		this.payNo = payNo;
		this.imp_uid = imp_uid;
		this.memNo = memNo;
		this.confirmPwd = confirmPwd;
		this.userName = userName;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.price = price;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.status = status;
	}

	public PaymentInfo(String imp_uid, String userName, int price, String email, int tel, String addr, int memNo,
			String confirmPwd, String orderStatus) {
		super();
		this.imp_uid = imp_uid;
		this.userName = userName;
		this.price = price;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.memNo = memNo;
		this.confirmPwd = confirmPwd;
		this.orderStatus = orderStatus;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PaymentInfo [payNo=" + payNo + ", imp_uid=" + imp_uid + ", memNo=" + memNo + ", confirmPwd="
				+ confirmPwd + ", userName=" + userName + ", tel=" + tel + ", email=" + email + ", addr=" + addr
				+ ", price=" + price + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", status="
				+ status + "]";
	}

	
	

}
