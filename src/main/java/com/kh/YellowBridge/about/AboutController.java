package com.kh.YellowBridge.about;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	
	@RequestMapping("about.ab")
	public String aboutView() {
		return "aboutView";
	}
	
}