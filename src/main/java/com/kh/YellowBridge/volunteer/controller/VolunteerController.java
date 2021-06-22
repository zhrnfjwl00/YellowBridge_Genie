package com.kh.YellowBridge.volunteer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.YellowBridge.volunteer.model.service.VolunteerService;

@Controller
public class VolunteerController {
	
//	@Autowired
//	private VolunteerService volService;
	
	@RequestMapping("serviceInfo.vol")
	public String serviceInfo(){
		return "serviceInfo";
	}
	
	@RequestMapping("serviceapply.vol")
	public String serviceApply(){
		return "serviceapply";
	}
}
