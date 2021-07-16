package com.kh.YellowBridge.volunteer.model.vo;

public class VolUpdateApply {
	private int check;
	private String select;
	
	public VolUpdateApply() {}
	
	public VolUpdateApply(int check, String select) {
		super();
		this.check = check;
		this.select = select;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}
	
	
	
}
