package com.kh.YellowBridge.volunteer.model.vo;

public class VolCategory {
	private int cate_no;
	private String cate_list;
	private String parent_cate;
	
	public VolCategory() {}

	public VolCategory(int cate_no, String cate_list, String parent_cate) {
		super();
		this.cate_no = cate_no;
		this.cate_list = cate_list;
		this.parent_cate = parent_cate;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public String getCate_list() {
		return cate_list;
	}

	public void setCate_list(String cate_list) {
		this.cate_list = cate_list;
	}

	public String getParent_cate() {
		return parent_cate;
	}

	public void setParent_cate(String parent_cate) {
		this.parent_cate = parent_cate;
	}

	@Override
	public String toString() {
		return "VolCategory [cate_no=" + cate_no + ", cate_list=" + cate_list + ", parent_cate=" + parent_cate + "]";
	}
	
	
}
