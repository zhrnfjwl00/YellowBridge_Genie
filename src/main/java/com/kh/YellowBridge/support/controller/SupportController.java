package com.kh.YellowBridge.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SupportController {
	
	@RequestMapping("supportPage.sup")
	public String insertView(){
		
		return "supportPage";
		
	}

}
