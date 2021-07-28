package com.kh.YellowBridge.support.model.vo;

import java.sql.Date;

public class DateSearch {
	private Date searchStartDate;
	private Date searchEndDate;
	
	public DateSearch() {}

	public DateSearch(Date searchStartDate, Date searchEndDate) {
		super();
		this.searchStartDate = searchStartDate;
		this.searchEndDate = searchEndDate;
	}

	public Date getSearchStartDate() {
		return searchStartDate;
	}

	public void setSearchStartDate(Date searchStartDate) {
		this.searchStartDate = searchStartDate;
	}

	public Date getSearchEndDate() {
		return searchEndDate;
	}

	public void setSearchEndDate(Date searchEndDate) {
		this.searchEndDate = searchEndDate;
	}

	@Override
	public String toString() {
		return "DateSearch [searchStartDate=" + searchStartDate + ", searchEndDate=" + searchEndDate + "]";
	}
	
	
	

}
