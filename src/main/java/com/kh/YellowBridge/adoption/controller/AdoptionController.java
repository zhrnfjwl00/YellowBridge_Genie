package com.kh.YellowBridge.adoption.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.YellowBridge.adoption.model.exception.AdoptionException;
import com.kh.YellowBridge.adoption.model.service.AdoptionService;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.support.model.vo.Board;

@Controller
public class AdoptionController {
	
	//의존성 주입 
	@Autowired
	private AdoptionService aService;
	
	// 입양절차
	@RequestMapping("process.ado")
	public String adopProcess() {
		return "adopProcess";
	}
	
	//입양일지 리스트, 페이징처리
	@RequestMapping("recode.ado")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1; // 연산에서 사용할 변수
		
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.getListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = aService.selectList(pi);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", pi).setViewName("adoptionRecodeList");

		} else {
			throw new AdoptionException("입양일지리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
}
