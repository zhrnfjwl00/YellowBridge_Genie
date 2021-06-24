package com.kh.YellowBridge.volunteer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.volunteer.model.exception.VolunteerException;
import com.kh.YellowBridge.volunteer.model.service.VolBoardService;
import com.kh.YellowBridge.volunteer.model.service.VolBoardServiceImpl;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

@Controller
public class VolunteerController {
	
	@Autowired
	private VolBoardService volBoardService;
	
	@RequestMapping("serviceInfo.vol")
	public String serviceInfo(){
		return "serviceInfo";
	}
	
	@RequestMapping("serviceapply.vol")
	public String serviceApply(){
		return "serviceapply";
	}
	
	@RequestMapping("serviceApplyBoard.vol")
	public String serviceApplyBoard(){
		return "serviceApplyBoardList";
	}
	
	@RequestMapping("serviceBoardList.vol")
	public ModelAndView serviceBoard(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> vollist = volBoardService.selectList(pi);
		System.out.println(vollist);
		
		if(vollist != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("vollist", vollist).addObject("pi", pi).setViewName("serviceBoardList");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("volBoardDetail.vol")
	public String serviceBoardDetail(@RequestParam("page") int page, @RequestParam("volId") int volId, Model model) {
		VolunteerBoard volboard = volBoardService.selectVolBoard(volId);
		
		if(volboard != null) {
			model.addAttribute("page", page).addAttribute("volboard", volboard);
			return "serviceBoardDetail";
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("serviceBoardWrite.vol")
	public String serviceBoardWrite(){
		return "serviceBoardWrite";
	}
}
