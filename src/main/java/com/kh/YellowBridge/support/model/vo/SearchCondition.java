package com.kh.YellowBridge.support.model.vo;

public class SearchCondition {
	private String title;
	private String content;
	
	public SearchCondition() {}

	public SearchCondition(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [title=" + title + ", content=" + content + "]";
	}

	
	
	

}
