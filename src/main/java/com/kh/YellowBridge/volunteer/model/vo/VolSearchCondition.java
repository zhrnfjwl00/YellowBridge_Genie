package com.kh.YellowBridge.volunteer.model.vo;

public class VolSearchCondition {
	private String writer;
	private String title;
	private String category;
	
	public VolSearchCondition() {}

	public VolSearchCondition(String writer, String title, String category) {
		super();
		this.writer = writer;
		this.title = title;
		this.category = category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "VolSearchCondition [writer=" + writer + ", title=" + title + ", category=" + category + "]";
	}
	
	
	
}
