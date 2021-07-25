package com.kh.YellowBridge.volunteer.model.exception;

public class VolunteerException extends RuntimeException{
	private static final long serialVersionUID = 1L;
	public VolunteerException() {}
	public VolunteerException(String msg) {
		super(msg);
	}
}
