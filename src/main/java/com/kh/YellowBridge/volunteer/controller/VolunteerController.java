package com.kh.YellowBridge.volunteer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.volunteer.model.exception.VolunteerException;
import com.kh.YellowBridge.volunteer.model.service.VolBoardService;
import com.kh.YellowBridge.volunteer.model.vo.VolPagination;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
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
	public ModelAndView serviceApplyList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getListCount();
		
		PageInfo vpi = VolPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Volunteer> volad = volBoardService.serviceApplyList(vpi);
//		System.out.println(volad);
		System.out.println(volad.get(1).getFilePath()+volad.get(1).getFileName());
		
		
		if(volad != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("volad", volad).addObject("vpi", vpi).setViewName("apply_advertise_list");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("serviceApplyBoard.vol")
	public String serviceApplyBoard(){
		return "apply_search_list";
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
	
	@RequestMapping("voladdReply.vol")
	@ResponseBody
	public String insertReply(@ModelAttribute VolReply r, HttpSession session) {
		
		/*
		 * int rWriter = ((Member)session.getAttribute("loginUser")).getId(); //
		 * import해줘야 빨간 줄 사라짐 r.setVolrWriter(rWriter);
		 */
		
		int result = volBoardService.insertVolReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new VolunteerException("댓글 등록에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="volrList.vol")
	public void selectReplyList(@RequestParam("volId") int volId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<VolReply> list = volBoardService.selectReplyList(volId);
		
		response.setContentType("application/json; charset=UTF-8");
//		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());
	}
	
	
	@RequestMapping("search.vol")
	public ModelAndView searchVol(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("writer")) vsc.setWriter(searchValue);
		else if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = volBoardService.getSearchResultListCount(vsc);
		System.out.println("검색 결과 개수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> vsclist = volBoardService.selectSearchResultList(vsc, pi);
		System.out.println("검색결과 : " + vsclist);
			
		if(vsclist != null) {
			mv.addObject("vollist", vsclist).addObject("pi", pi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("serviceBoardList");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		System.out.println(" =================== ");
		return mv;
	}
	
	
}
