package com.kh.YellowBridge.volunteer.model.vo;

public class VolCategory {
	private int cate_no;
	private String list;
	
	public VolCategory() {}

	public VolCategory(int cate_no, String list) {
		super();
		this.cate_no = cate_no;
		this.list = list;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	
	
}
