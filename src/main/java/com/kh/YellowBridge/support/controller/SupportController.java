package com.kh.YellowBridge.support.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.support.model.exception.SupportException;
import com.kh.YellowBridge.support.model.service.SupportService;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.DateSearch;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.support.model.vo.PaymentInfo;
import com.kh.YellowBridge.support.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.SearchCondition;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	// 후원 페이지
	@RequestMapping("supportPage.sup")
	public String insertView(){
		
		return "supportPage";
	}
	
	// 게시판 목록 조회
	@RequestMapping("sList.sup")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1; // 연산에서 사용할 변수
		
		if(page != null) {
			currentPage = page;
		}
		int listCount = sService.getListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = sService.selectList(pi);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", pi).setViewName("supportBoardList");

		} else {
			throw new SupportException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("sinsertView.sup")
	public String supportInsertView(){
		
		return "supportBoardWrite";
	}
	
	// 글 작성
	@RequestMapping("sinsert.sup")
	public String insertBoard(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		
		FileInfo fi = new FileInfo();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			FileInfo finfo = saveFile(uploadFile, request);
			
			if(finfo.getChangeName() != null) {
				fi.setFileName(uploadFile.getOriginalFilename());
				fi.setChangeName(finfo.getChangeName());
				fi.setFilePath(finfo.getFilePath());
			}
		}
		// 현재 로그인 서비스가 없어 임의로 작성자 삽입
		b.setbWriter("user01");
		
		int result = sService.insertBoard(b, fi);
		
		if(result > 0) {
			return "redirect:sList.sup";
		} else {
			throw new SupportException("게시글 등록에 실패하였습니다.");
		}
	}
	
	// 파일 저장
	public FileInfo saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		FileInfo fi = new FileInfo();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/suploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +
								"." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "/" + renameFileName;
		
		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
			
		}
		
		fi.setChangeName(renameFileName);
		fi.setFilePath(savePath);
		
		return fi;
		
	}
	
	// 게시판 상세보기
	@RequestMapping("sdetail.sup")
	public String boardDatail(@RequestParam("bNo") int bNo, @RequestParam("page") int page, Model model) {
		
		Board board = sService.detailBoard(bNo);
		
		if(board != null) {
			FileInfo fi = sService.detailFile(bNo);
			model.addAttribute("board", board).addAttribute("page", page).addAttribute("fi", fi);
			return "supportBoardDetail";
		} else {
			
			throw new SupportException("게시글 상세 조회에 실패하였습니다.");
		}
		
	}
	
	// 게시판 검색
	@RequestMapping("search.sup")
	public ModelAndView searchBoard(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		SearchCondition sc = new SearchCondition();
		
		if(searchCondition.equals("title")) {
			sc.setTitle(searchValue);
		} else if(searchCondition.equals("content")){
			sc.setContent(searchValue);
		}
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = sService.getSearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Board> scList = sService.selectSearchList(sc, pi);
		
		if(scList != null) {
			mv.addObject("list", scList).addObject("pi", pi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("supportBoardList");
		} else {
			throw new SupportException("게시글 검색 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	
	// 게시판 수정 화면
	@RequestMapping("supdateView.sup")
	public String updateView(@RequestParam("bNo") int bNo, @RequestParam("page") int page, Model model){
		Board board = sService.detailBoard(bNo);
		FileInfo fi = sService.detailFile(bNo);
		
		model.addAttribute("board", board).addAttribute("fi", fi).addAttribute("page", page);
		return "supportBoardUpdate";
	}
	
	// 게시판 수정
	@RequestMapping("supdate.sup")
	public String updateBoard(@ModelAttribute Board b, @RequestParam("page") int page,
			@RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request) {
		FileInfo fi = new FileInfo();
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(fi.getChangeName() != null) {
				deleteFile(fi.getChangeName(), request);
			}
			
			FileInfo finfo = saveFile(reloadFile, request);
			if(finfo.getChangeName() != null) {
				fi.setFileName(reloadFile.getOriginalFilename());
				fi.setChangeName(finfo.getChangeName());
				fi.setFilePath(finfo.getFilePath());
				
			}
			fi.setBoardNo(b.getbNo());
			sService.updateFile(fi);
			
		}
		
		int result = sService.updateBoard(b);
		
		if(result > 0) {
			return "redirect:sdetail.sup?bNo=" + b.getbNo() + "&page=" + page;
		} else {
			throw new SupportException("게시글 수정에 실패하였습니다.");
		}
		
	}
	
	// 게시판 첨부파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/suploadFiles";
		
		File f = new File(savePath + "/" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 게시판 삭제
	@RequestMapping("sdelete.sup")
	public String deleteBoard(@RequestParam("bNo") int bNo) {
		
		int result = sService.deleteBoard(bNo);
		
		if(result > 0) {
			return "redirect:sList.sup";
		} else {
			throw new SupportException("게시글 삭제에 실패하였습니다.");
		}
		
	}
	
	// 댓글 삭제
	@RequestMapping("rdelete.sup")
	public String deleteReply(@RequestParam(value="rId", required=false) Integer rId, @RequestParam("bNo") int bNo, @RequestParam("page") int page) {
		int result = sService.deleteReply(rId);
		
		if(result > 0) {
			return "redirect:sdetail.sup?bNo=" + bNo + "&page=" + page;
		} else {
			throw new SupportException("댓글 삭제에 실패하였습니다.");
		}
		
		
	}
	

	// 후원하기 화면으로 이동
	@RequestMapping("support.sup")
	public String supportPay() {
		return "supportPage";
	}
	// 후원하기 정보 입력 화면 이동
	@RequestMapping("supportPayView.sup")
	public String supportPayView() {
		return "supportPayView";
	}
	
	// 결제 완료 후 정보 저장
	@RequestMapping("insertPaymentInfo.sup")
	public String supportInfo(@RequestParam("imp_uid") String imp_uid, @RequestParam("userName") String userName,
							  @RequestParam("price") int price,  @RequestParam("addr") String addr,
							  @RequestParam("email") String email, @RequestParam("tel") int tel,
							  @RequestParam("memNo") int memNo, @RequestParam("confirmPwd") String confirmPwd) {
		PaymentInfo pi = new PaymentInfo();
		// 인증번호로 비회원 결제 구분
		if(confirmPwd.equals("confirmPwd1111")) {
			pi.setOrderStatus("회원");
		} else {
			pi.setOrderStatus("비회원");
		}
		
		pi = new PaymentInfo(imp_uid, userName, price, email, tel, addr, memNo, confirmPwd, pi.getOrderStatus());
		
		int result = sService.insertPaymentInfo(pi);

		if(result > 0) {
			return "";
		} else {
			throw new SupportException("결제에 실패했습니다.");
		}
		
	}
	
	// 결제 완료 후 화면 이동
	@RequestMapping("supportPayComplete.sup")
	public String supportPayComplete(@RequestParam("imp_uid") String imp_uid,
									Model model) {
		PaymentInfo pi = sService.supportPayComplete(imp_uid);
		
		model.addAttribute("pi", pi);
		return "supportPay_completeView";
	}
	
	// 비회원 인증 화면 이동
	@RequestMapping("noMemPayDetail.sup")
	public String noMemPayDetailView() {
		
		return "noMemPayDetail";
	}
	
	// 비회원 결제 내역 조회 : 결제자명  + 인증번호
	@RequestMapping("noMemPayResult.sup")
	public String noMemPayResultList(@RequestParam("userName") String userName,
									@RequestParam("confirmPwd") String confirmPwd,
									Model model){
		PaymentInfo pi = new PaymentInfo();
		pi.setUserName(userName);
		pi.setConfirmPwd(confirmPwd);
		
		ArrayList<PaymentInfo> piList = sService.noMemPayList(pi);
		// 바로 결제내역 리스트 확인
		if(piList != null) {
			model.addAttribute("piList", piList);
			return "noMemResultList";
		}
		
		throw new SupportException("비회원 결제내역 조회에 실패했습니다.");
		
	}
	
	// 회원 결제 내역 조회 : memNo
	@RequestMapping("paymentList.sup")
	public String paymentList(@RequestParam("memNo") int memNo, Model model){
		
		ArrayList<PaymentInfo> piList = sService.memPayList(memNo);
		
		model.addAttribute("piList", piList);
		
		return "memResultList";
	}
	
	// 댓글 목록 조회
		@RequestMapping("rList.sup")
		public void selectReplyList(@RequestParam("bNo") int bNo, HttpServletResponse response) throws JsonIOException, IOException{
			ArrayList<Reply> list = sService.selectReplyList(bNo);
				
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder();
			GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
			Gson gson = dateGb.create();
			gson.toJson(list, response.getWriter());
				
		}
	
	// 댓글 작성
		@RequestMapping("addReply.sup")
		@ResponseBody
		public String addReply(@ModelAttribute Reply r, HttpSession session) {
			
			String rWriter = ((Member)session.getAttribute("loginUser")).getNickname(); 
			int memNo = ((Member)session.getAttribute("loginUser")).getNo();
			
			r.setrWriter(rWriter);
			r.setMemberNo(memNo);
			
			int result = sService.addReply(r);
			if(result > 0) {
				return "success";
			}
			
			throw new SupportException("게시글 댓글 등록에 실패하였습니다.");
			
		}
		
		
	// 댓글 수정 폼 이동
	@RequestMapping("rupdate.sup")
	public ModelAndView ReplyUpdateForm(@RequestParam("page") int page, @RequestParam("rId") int rId,
									@RequestParam("bNo") int bNo, ModelAndView mv) {
		
		Board b = sService.detailBoard(bNo);
		FileInfo fi = sService.detailFile(bNo);
		Reply r = sService.selectOneReply(rId);
		
		if(b != null) {
			mv.addObject("page", page).addObject("b", b).addObject("fi", fi).addObject("r", r).setViewName("supportBoard_replyUpdate");
		} else {
			throw new SupportException("댓글 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("updateReply.sup")
	@ResponseBody
	public String ReplyUpdate(@ModelAttribute Reply reply,HttpServletRequest request, Model model) {
		
		int result = sService.updateReply(reply);
		
		if(result > 0) {
			return "success";
		}else {
			throw new SupportException("댓글 수정에 실패하였습니다.");
		}
	}
	
	/*
	 * @RequestMapping("dateSearch.sup") public ModelAndView PiListDate(DateSearch
	 * ds, ModelAndView mv) { System.out.println(ds); // 전체 결제 정보 날짜 범위내 검색 -> 화면에서
	 * 출력시 결제정보 조회했던 내용에 맞춰 검열 해 화면에 출력
	 * 
	 * ArrayList<PaymentInfo> datePi = sService.searchPiList(ds); 
	 * System.out.println(datePi);
	 * 
	 * if(datePi != null) { mv.addObject("datePi",
	 * datePi).setViewName("dateSearch_complete"); } else { throw new
	 * SupportException("결제정보 기간 조회에 실패하였습니다."); } return mv; }
	 */
	
	
	// 관리자 : 회원/비회원 결제내역조회
	@RequestMapping("adminPaySelect.sup")
	public String adminPaymentSelect(Model model) {
		ArrayList<PaymentInfo> allPayList = sService.selectAllPi();
		
		if(allPayList != null) {
			model.addAttribute("allPayList", allPayList);
			return "adminPiResultList";
			
		} else {
			throw new SupportException("회원/비회원 결제내역 조회에 실패했습니다.");
		}
		
	}
	

}
