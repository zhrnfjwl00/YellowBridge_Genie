package com.kh.YellowBridge.volunteer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.YellowBridge.adoption.model.exception.AdoptionException;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.volunteer.model.exception.VolunteerException;
import com.kh.YellowBridge.volunteer.model.service.VolBoardService;
import com.kh.YellowBridge.volunteer.model.vo.VolCategory;
import com.kh.YellowBridge.volunteer.model.vo.VolPagination;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.VolUpdateApply;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerApply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerFile;

@SessionAttributes("loginUser") 
@Controller
public class VolunteerController {
	
	@Autowired
	private VolBoardService volBoardService;
	
	
	@RequestMapping("volAdminAdList.vol")
	public ModelAndView serviceAdminAdList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getListAdvertiseCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> vollist = volBoardService.selectList(pi);
		
		if(vollist != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("vollist", vollist).addObject("pi", pi).setViewName("serviceBoardList");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 관리자: 공고 상세보기
	@RequestMapping("volAdminAdDetail.vol")
	public ModelAndView serviceAdminAdDetail(@RequestParam("page") int page, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request) {
		Volunteer vol = volBoardService.selectAppBoard(volId);
		VolunteerFile vFile = volBoardService.selectVolFile(volId);
		
		if(vol != null) {
			mv.addObject("page", page).addObject("volboard", vol).addObject("vFile", vFile).setViewName("admin_apply_advertise_detail");
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
				
	// 봉사시작 페이지 바로가기
	@RequestMapping("serviceInfo.vol")
	public String serviceInfo(){
		return "serviceInfo";
	}
	
	// 관리자 봉사상세조회 리스트
	@RequestMapping("adminsearchlist.vol")
	public ModelAndView adminsearchlist(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {

		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getadminSearchListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<VolunteerApply> adminaplist = volBoardService.selectAdminApplyList(pi);
		System.out.println("검색 결과 : " + adminaplist);
		
		if(adminaplist != null) {
			mv.addObject("adminaplist", adminaplist).addObject("pi", pi).setViewName("admin_apply_search_list");
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
			
		return mv;
	}
	
	// 관리자 봉사신청조회 상세보기
	@RequestMapping("adminsearchDetail.vol")
	public ModelAndView adminsearchDetail(@RequestParam("page") int page, @RequestParam("appId") int appId, ModelAndView mv, HttpServletRequest request) {
		VolunteerApply vApply = volBoardService.selectvApplyDetail(appId);
		
		if(vApply != null) {
			mv.addObject("page", page).addObject("vApply", vApply).setViewName("admin_apply_search_detail");
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 봉사신청조회 리스트
	@RequestMapping("serviceApplyBoard.vol")
	public ModelAndView vApplyList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session, HttpServletRequest request) {

		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		if((Member)session.getAttribute("loginUser") == null) {
			request.setAttribute("msg", "로그인 후 이용하세요");
		}
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getNo();
		int listCount = volBoardService.getApListCount(memberNo);
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		
		ArrayList<VolunteerApply> aplist = volBoardService.selectApplyList(memberNo, pi);
		System.out.println("검색 결과 : " + aplist);
		
		if(aplist != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("aplist", aplist).addObject("pi", pi).addObject("no", memberNo).setViewName("apply_search_list");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
			
		return mv;
	}
	
	// 봉사신청조회 상세보기
	@RequestMapping("vApplyDetail.vol")
	public ModelAndView vApplyDetail(@RequestParam("page") int page, @RequestParam("vId") int vId, ModelAndView mv, HttpServletRequest request) {
		VolunteerApply vApply = volBoardService.selectvApplyDetail(vId);
		System.out.println("vApply : " + vApply);
		if(vApply != null) {
			mv.addObject("page", page).addObject("vApply", vApply).setViewName("apply_search_detail");
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 봉사공고 상세조회
	@RequestMapping("serviceAdDetail.vol")
	public String serviceApplyDatail(@RequestParam("page") int page, @RequestParam("volId") int adId, Model model){
//		System.out.println(adId);
		Volunteer vol = volBoardService.selectAppBoard(adId);
		
		if( vol != null) {
			model.addAttribute("page", page).addAttribute("volad", vol);
			return "apply_advertise_detail";
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
	}
	
	// 봉사 공고 목록
	@RequestMapping("serviceapply.vol")
	public ModelAndView serviceApplyList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getListAdvertiseCount();
		
		PageInfo vpi = VolPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Volunteer> volad = volBoardService.serviceApplyList(vpi);
//		System.out.println(volad);
//		System.out.println(volad.get(1).getFilePath()+volad.get(1).getFileName());
		
		
		if(volad != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("page", page).addObject("volad", volad).addObject("vpi", vpi).setViewName("apply_advertise_list");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	// 관리자 봉사 공고 목록
	@RequestMapping("adminserviceapply.vol")
	public ModelAndView adminServiceApplyList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getListAdvertiseCount();
		
		PageInfo vpi = VolPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Volunteer> volad = volBoardService.serviceApplyList(vpi);
//		System.out.println(volad);
//		System.out.println(volad.get(1).getFilePath()+volad.get(1).getFileName());
		
		
		if(volad != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("page", page).addObject("volad", volad).addObject("vpi", vpi).setViewName("admin_apply_advertise_list");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	// 관리자: 봉사공고 검색
	@RequestMapping("adminsearchAdvertise.vol")
	public ModelAndView adminsearchAdvertise(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getSearchResultAdvertiseListCount(vsc);
		System.out.println("listCount : " + listCount);
		
		PageInfo vpi = VolPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Volunteer> volad = volBoardService.selectSearchResultAdvertiseList(vsc, vpi);
		
		
		if(volad != null) {
			mv.addObject("volad", volad).addObject("vpi", vpi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("admin_apply_advertise_list");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 봉사공고 검색
	@RequestMapping("searchAdvertise.vol")
	public ModelAndView searchAdvertise(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getSearchResultAdvertiseListCount(vsc);
		System.out.println("listCount : " + listCount);
		
		PageInfo vpi = VolPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Volunteer> volad = volBoardService.selectSearchResultAdvertiseList(vsc, vpi);
		
		
		if(volad != null) {
			mv.addObject("volad", volad).addObject("vpi", vpi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("apply_advertise_list");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 봉사 신청서 페이지
	@RequestMapping("serviceapplyform.vol")
	public String selectApplyForm(@RequestParam("serviceNo") int serviceNo, Model model){
		Volunteer vol = volBoardService.selectAppBoard(serviceNo);
		
		if( vol != null) {
			model.addAttribute("vol", vol);
			return "apply_advertise_form";
		} else {
			throw new VolunteerException("봉사 신청서 조회에 실패하였습니다.");
		}
	}
	
	// 봉사 신청서 작성
	@RequestMapping("sApplyForm.vol")
	public String insertApplyForm(@ModelAttribute VolunteerApply volApp, HttpSession session){
		int writerNo = ((Member)session.getAttribute("loginUser")).getNo();
		volApp.setMemberNo(writerNo);
		
		System.out.println("입력할 폼 정보 : " + volApp);
		
		int result = volBoardService.insertAppForm(volApp);
		System.out.println("폼 작성 성공 : " + result);
		
		if(result > 0) {
			return "redirect:sApplyComplete.vol";
		} else {
			throw new VolunteerException("봉사 신청서 작성에 실패하였습니다.");
		}
	}
	
	// 봉사 신청 완료 페이지
	@RequestMapping("sApplyComplete.vol")
	public ModelAndView serviceApplyComplete(ModelAndView mv, HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginUser")).getNo();
		VolunteerApply volApp = volBoardService.selectAppForm(memberNo);
		
		if(volApp != null) {
			mv.addObject("volApp", volApp).setViewName("apply_advertise_complete");
		} else {
			throw new VolunteerException("신청완료 페이지 보기에 실패하였습니다.");
		}
		
		return mv;
	}

	// 관리자 봉사신청 검색
	@RequestMapping("adminApplysearch.vol")
	public ModelAndView adminApplysearch(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("writer")) vsc.setWriter(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getAdminSearchApplyResultListCount(vsc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerApply> adminaplist = volBoardService.selectAdminSearchApplyResultList(vsc, pi);
			
		if(adminaplist != null) {
			mv.addObject("adminaplist", adminaplist).addObject("pi", pi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("admin_apply_search_list");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 게시판 리스트
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
		
		if(vollist != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("vollist", vollist).addObject("pi", pi).setViewName("serviceBoardList");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 게시판 글 상세보기
	@RequestMapping("volBoardDetail.vol")
	public ModelAndView serviceBoardDetail(@RequestParam("page") int page, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		VolunteerBoard volboard = volBoardService.selectVolBoard(volId);

		VolunteerFile vFile = volBoardService.selectVolFile(volId);
		
			
			if(volboard != null) {
				mv.addObject("page", page).addObject("volboard", volboard).addObject("vFile", vFile).setViewName("serviceBoardDetail");
			} else {
				throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
			}
		return mv;
	}
	
	// 게시판 글 작성 폼
	@RequestMapping("serviceBoardWriteForm.vol")
	public String serviceBoardWriteForm(){
		return "serviceBoardWrite";
	}
	
	// 게시판 글 작성
	@RequestMapping("serviceBoardWrite.vol")
	public String serviceBoardWrite(@ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
		String rWriter = ((Member)session.getAttribute("loginUser")).getId(); 
		volb.setVolWriter(rWriter);
		int result = volBoardService.insertVolBoard(volb);
		
		VolunteerFile vF = new VolunteerFile();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			VolunteerFile vFile = saveFile(uploadFile, request);
			if(vFile != null) {
				vF.setFileName(uploadFile.getOriginalFilename());
				vF.setChangeName(vFile.getChangeName());
				vF.setFilePath(vFile.getFilePath());
				volBoardService.insertVolFile(vF);
			}
		}
		
		if(result > 0) {
			return "redirect:serviceBoardList.vol";
		} else {
			throw new VolunteerException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
	// 게시판 글 수정 폼
	@RequestMapping("serviceBoardUpdateForm.vol")
	public String serviceBoardUpdateForm(@RequestParam("page") int page, @RequestParam("volId") int volId, Model model, HttpServletRequest request){
		VolunteerBoard volu = volBoardService.selectVolBoard(volId);
		VolunteerFile vFu = volBoardService.selectVolFile(volId);
		
		if(volu != null) {
			model.addAttribute("page", page).addAttribute("volu", volu).addAttribute("vFu", vFu);
		}
		
		return "serviceBoardUpdate";
	}
	
	// 게시판 글 수정
	@RequestMapping(value="serviceBoardUpdate.vol", method=RequestMethod.POST)
	public String serviceBoardUpdate(@RequestParam("page") int page, @ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, Model model) {
		int boardNo = volb.getVolId();
		
		int result = volBoardService.updateVolBoard(volb);
		
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectVolFile(boardNo);
		
		if(vFu != null) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				vFu = volBoardService.selectVolFile(boardNo);
				int fileNo = vFu.getFileNo();
				
				int result2 = volBoardService.deleteVolFile(fileNo);
				
				if(result2 > 0) {
					VolunteerFile vFile = saveFile(uploadFile, request);
					System.out.println(vFile);
					
					if(vFile != null) {
						vF.setFileName(uploadFile.getOriginalFilename());
						vF.setChangeName(vFile.getChangeName());
						vF.setFilePath(vFile.getFilePath());
						vF.setBoardNo(boardNo);
						int result3 = volBoardService.updateVolFile(vF);
					}
				}
			}
		} else {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				VolunteerFile vFile = saveFile(uploadFile, request);
				
				if(vFile != null) {
					vF.setFileName(uploadFile.getOriginalFilename());
					vF.setChangeName(vFile.getChangeName());
					vF.setFilePath(vFile.getFilePath());
					vF.setBoardNo(boardNo);
					int result4 = volBoardService.updateVolFile(vF);
				}
			}
		}
			
		if(result > 0) {
			return "redirect:volBoardDetail.vol?volId=" + boardNo + "&page=" + page;
		} else {
			throw new VolunteerException("게시글 수정에 실패하였습니다.");
		}
	}
	
	

	// 게시판 파일 삽입
	private VolunteerFile saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		VolunteerFile vF = new VolunteerFile();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savaPath = root + "/voluploadFiles/";

		
		File folder = new File(savaPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSssSSS");
		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "/" + renameFileName;
		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		vF.setChangeName(renameFileName);
		vF.setFilePath(savaPath);
		
		return vF;
	}

	// 게시판 글 삭제
	@RequestMapping("serviceBoardDelete.vol")
	public String serviceBoardDelete(@RequestParam("volId") int volId){
		int result = volBoardService.serviceBoardDelete(volId);
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectVolFile(volId);
		
		if(vFu != null) {
			vFu = volBoardService.selectVolFile(volId);
			int fileNo = vFu.getFileNo();
			
			int result2 = volBoardService.deleteVolFile(fileNo);
		}
		
		
		if(result > 0) {
			return "redirect:serviceBoardList.vol";
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}

	}
	
	// 게시판 수정 중 파일 삭제
	@RequestMapping("vdeleteFile.vol")
	@ResponseBody
	public String vdeleteFile(@RequestParam("fileNo") int fileNo, @RequestParam("volId") int volId, @RequestParam("page") int page, HttpServletRequest request){
		System.out.println("fileNo : " + fileNo);
		System.out.println("volId : " + volId);
		
		int result = volBoardService.vdeleteFile(fileNo);
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new AdoptionException("봉사 게시판 수정중 파일삭제에 실패하였습니다.");
		}
		
		/*if(result > 0) {
			return "redirect:serviceBoardUpdateForm.vol?volId=" + volId + "&page=" + page;
		} else {
			throw new VolunteerException("파일 삭제에 실패하였습니다.");
		}*/
		
	}
	
	
	// 게시판 댓글 삭제
	@RequestMapping("volrDelete.vol")
	public String servicerDelete(@RequestParam("rId") int rId, @RequestParam("volId") int volId, @RequestParam("page") int page){
		int result = volBoardService.servicerDelete(rId);
		
		if(result > 0) {
			return "redirect:volBoardDetail.vol?volId=" + volId + "&page=" + page;
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}
		
	}
	
	// 게시판 댓글 작성
	@RequestMapping("voladdReply.vol")
	@ResponseBody
	public String insertReply(@ModelAttribute VolReply r, HttpSession session) {
		System.out.println("들어온 r : " + r);
		
		String rWriter = ((Member)session.getAttribute("loginUser")).getId(); 
		System.out.println(rWriter);
		
		
		r.setVolrWriter(rWriter);
		
		int result = volBoardService.insertVolReply(r);
		System.out.println("댓글 작성 결과 : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new VolunteerException("댓글 등록에 실패했습니다.");
		}
	}
	
	// 게시판 댓글 수정 폼
	@RequestMapping("volrUpdateForm.vol")
	public ModelAndView volrUpdateForm(@RequestParam("page") int page, @RequestParam("rId") int rId, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request){
		VolunteerBoard volboard = volBoardService.selectVolBoard(volId);
		VolReply vr = volBoardService.selectVolReply(rId);
		
		if(volboard != null) {
			mv.addObject("page", page).addObject("volboard", volboard).addObject("vr", vr).setViewName("serviceBoardDetail_update_reply");
		} else {
			throw new VolunteerException("댓글 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	// 게시판 댓글 수정
	@RequestMapping(value="volrUpdate.vol")
	@ResponseBody
	public String volrUpdate(@ModelAttribute VolReply volr, HttpServletRequest request, Model model) {
		System.out.println("수정할 reply : " + volr);
		int result = volBoardService.updateVolReply(volr);
		System.out.println("댓글 수정 결과 : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new VolunteerException("댓글 수정에 실패했습니다.");
		}
	}
	
	// 게시판 댓글 목록
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
	
	// 봉사게시판 검색
	@RequestMapping("search.vol")
	public ModelAndView searchVol(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("writer")) vsc.setWriter(searchValue);
		else if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getSearchResultListCount(vsc);
		System.out.println("공고 검색 결과 개수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> vsclist = volBoardService.selectSearchResultList(vsc, pi);
			
		if(vsclist != null) {
			mv.addObject("vollist", vsclist).addObject("pi", pi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("serviceBoardList");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 관리자: 공고 작성 폼 바로가기
	@RequestMapping("volAdminAdForm.vol")
	public String serviceAdminAdForm(){
		return "admin_apply_advertise_form";
	}
	
	// 관리자: 공고 작성
	@RequestMapping("adminAdInsert.vol")
	public String adminInsertForm(@ModelAttribute Volunteer vol, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		int result = volBoardService.insertadminAd(vol);
		
		VolunteerFile vF = new VolunteerFile();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			VolunteerFile vFile = saveFile(uploadFile, request);
			
			if(vFile != null) {
				vF.setFileName(uploadFile.getOriginalFilename());
				vF.setChangeName(vFile.getChangeName());
				vF.setFilePath(vFile.getFilePath());
				int result5 = volBoardService.insertADVolFile(vF);
			}
			System.out.println(vFile);
		}
		
		if(result > 0) {
			return "redirect:adminserviceapply.vol";
		} else {
			throw new VolunteerException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
	// 관리자: 공고 수정 폼
	@RequestMapping("adminVolUpdateForm.vol")
	public String adminVolUpdateForm(@RequestParam("page") int page, @RequestParam("serviceNo") int volId, Model model, HttpServletRequest request){
		Volunteer adadmin = volBoardService.selectAppBoard(volId);
		VolunteerFile vFuadmin = volBoardService.selectVolAdFile(volId);
		
		if(adadmin != null) {
			model.addAttribute("page", page).addAttribute("volId", volId).addAttribute("adadmin", adadmin).addAttribute("vFuadmin", vFuadmin);
		}
		
		return "admin_apply_advertise_update";
	}
	
	// 관리자: 공고 수정
	@RequestMapping(value="adminVolUpdate.vol", method=RequestMethod.POST)
	public String adminVolUpdate(@RequestParam("page") int page, @RequestParam("serviceNo") int serviceNo, @ModelAttribute Volunteer vol, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, Model model) {
		System.out.println("page : " + page);
		System.out.println("serviceNo : " + serviceNo);
		int result = volBoardService.updateVolAd(vol);
		
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectVolAdFile(serviceNo);
		
		if(vFu != null) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				int fileNo = vFu.getFileNo();
				
				int result2 = volBoardService.deleteVolAdFile(fileNo);
				
				if(result2 > 0) {
					VolunteerFile vFile = saveFile(uploadFile, request);
					System.out.println(vFile);
					
					if(vFile != null) {
						vF.setFileName(uploadFile.getOriginalFilename());
						vF.setChangeName(vFile.getChangeName());
						vF.setFilePath(vFile.getFilePath());
						vF.setServiceNo(serviceNo);
						int result3 = volBoardService.updateVolAdFile(vF);
					}
				}
			}
		} else {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				VolunteerFile vFile = saveFile(uploadFile, request);
				
				if(vFile != null) {
					vF.setFileName(uploadFile.getOriginalFilename());
					vF.setChangeName(vFile.getChangeName());
					vF.setFilePath(vFile.getFilePath());
					vF.setServiceNo(serviceNo);
					int result4 = volBoardService.updateVolFile(vF);
				}
			}
		}
			
		if(result > 0) {
			return "redirect:volAdminAdDetail.vol?volId=" + serviceNo + "&page="+page;
		} else {
			throw new VolunteerException("공고 수정에 실패하였습니다.");
		}
	}
	
	// 관리자: 공고 삭제
	@RequestMapping("vAdDelete.vol")
	public String serviceAdDelete(@RequestParam("serviceNo") int serviceNo){
		int result = volBoardService.deleteAd(serviceNo);
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectVolAdFile(serviceNo);
		
		if(vFu != null) {
			vFu = volBoardService.selectVolAdFile(serviceNo);
			int fileNo = vFu.getFileNo();
			
			int result2 = volBoardService.deleteVolAdFile(fileNo);
		}
		
		
		if(result > 0) {
			return "redirect:adminserviceapply.vol";
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}

	}
	
	// 관리자: 공고 신청 중단
	@RequestMapping("vAdStop.vol")
	public String vAdStop(@RequestParam("page") int page, @RequestParam("serviceNo") int serviceNo){
		int result = volBoardService.stopAd(serviceNo);
		
		if(result > 0) {
			return "redirect:volAdminAdDetail.vol?volId=" + serviceNo + "&page="+page;
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	// 관리자: 공고 신청 재개
	@RequestMapping("vAdContinue.vol")
	public String vAdContinue(@RequestParam("page") int page, @RequestParam("serviceNo") int serviceNo){
		int result = volBoardService.continueAd(serviceNo);
		
		if(result > 0) {
			return "redirect:volAdminAdDetail.vol?volId=" + serviceNo + "&page="+page;
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	// 관리자: 봉사상세조회 상태 수정
	@RequestMapping("updateApply.vol")
	@ResponseBody
	public void updateApply(@RequestParam("check[]") List<String> check, @RequestParam("select") String select, HttpServletResponse response) throws JsonIOException, IOException{
		System.out.println("check : " + check);
		System.out.println("select : " + select);
		
		ArrayList<VolUpdateApply> app = new ArrayList<VolUpdateApply>();
		int result = 0;
		for(int i = 0; i < check.size(); i++) {
			System.out.println("check.get(i) : " + check.get(i));
			app.add(new VolUpdateApply(Integer.parseInt(check.get(i)), select));
			System.out.println("app : " + app);
			VolUpdateApply va = app.get(i);
			result = volBoardService.updateApply(va);
		}
		
		
		String msg = "";
		if (result > 0) {
			msg = "신청서 상태를 수정했습니다.";
		} else {
			msg = "신청서 상태 수정 중 오류가 발생했습니다.";
		}

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(msg, response.getWriter());
		
	}
	
	// 후기 게시판 리스트
	@RequestMapping("volreview.vol")
	public ModelAndView volreview(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {

		int currentPage = 1; // 연산에 사용될 변수
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getReviewListCount();
		
		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> reviewlist = volBoardService.selectReviewList(pi);
		
		if(reviewlist != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("reviewlist", reviewlist).addObject("pi", pi).setViewName("serviceBoard_ReviewList");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("searchReview.vol")
	public ModelAndView searchReview(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchCondition") String searchCondition, @RequestParam("searchValue") String searchValue, ModelAndView mv, HttpServletRequest request) {
		
		VolSearchCondition vsc = new VolSearchCondition();	
		if(searchCondition.equals("writer")) vsc.setWriter(searchValue);
		else if(searchCondition.equals("title")) vsc.setTitle(searchValue);
		else if(searchCondition.equals("category")) vsc.setCategory(searchValue);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = volBoardService.getSearchReviewResultListCount(vsc);
		System.out.println("검색 결과 개수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<VolunteerBoard> reviewlist = volBoardService.selectSearchReviewResultList(vsc, pi);
			
		if(reviewlist != null) {
			mv.addObject("reviewlist", reviewlist).addObject("pi", pi).addObject("searchCondition", searchCondition).addObject("searchValue", searchValue).setViewName("serviceBoard_ReviewList");
		} else {
			throw new VolunteerException("게시글 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("writeReviewForm.vol")
	public ModelAndView writeReviewForm(@RequestParam("shelterName") String shelterName, ModelAndView mv){
		System.out.println("shelterName : " + shelterName);
		VolunteerApply va = new VolunteerApply();
		va.setShelterName(shelterName);
		
		mv.addObject("va", va).setViewName("serviceBoard_ReviewWrite");
		return mv;
	}
	
	// 후기 게시판 글 작성
	@RequestMapping("writeReview.vol")
	public String writeReview(@ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) {
		String list = volb.getVolCategory();
		
		VolCategory vc = new VolCategory();
		vc.setList(list);
		
		VolCategory vca =  volBoardService.selectCateNo(vc);
		
		int cateNo = vca.getCate_no();
		volb.setVolCateNo(cateNo);
		
		String rWriter = ((Member)session.getAttribute("loginUser")).getId(); 
		volb.setVolWriter(rWriter);
		
		
		int result = volBoardService.writeReview(volb);
		
		VolunteerFile vF = new VolunteerFile();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			VolunteerFile vFile = saveFile(uploadFile, request);
			
			if(vFile != null) {
				vF.setFileName(uploadFile.getOriginalFilename());
				vF.setChangeName(vFile.getChangeName());
				vF.setFilePath(vFile.getFilePath());
				int result2 = volBoardService.insertReviewFile(vF);
			}
		}
		
		if(result > 0) {
			return "redirect:volreview.vol";
		} else {
			throw new VolunteerException("후기 등록에 실패하였습니다.");
		}
		
	}
	
	// 후기 게시판 글 상세보기
	@RequestMapping("ReviewDetail.vol")
	public ModelAndView ReviewDetail(@RequestParam("page") int page, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request) {
		VolunteerBoard review = volBoardService.selectReviewBoard(volId);
		VolunteerFile vFile = volBoardService.selectReviewFile(volId);
		System.out.println("review : " + review);
		
		if(review != null) {
			mv.addObject("page", page).addObject("review", review).addObject("vFile", vFile).setViewName("serviceBoard_ReviewDetail");
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 후기 게시판 댓글 작성
	@RequestMapping("reviewaddReply.vol")
	@ResponseBody
	public String insertreviewReply(@ModelAttribute VolReply r, HttpSession session) {
		System.out.println("들어온 r : " + r);
		
		String rWriter = ((Member)session.getAttribute("loginUser")).getId(); 
		System.out.println(rWriter);
		
		
		r.setVolrWriter(rWriter);
		
		int result = volBoardService.insertreviewReply(r);
		System.out.println("댓글 작성 결과 : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new VolunteerException("댓글 등록에 실패했습니다.");
		}
	}
	
	// 게시판 댓글 목록
	@RequestMapping(value="reviewrList.vol")
	public void selectReviewReplyList(@RequestParam("volId") int volId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<VolReply> list = volBoardService.selectReviewReplyList(volId);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());
	}
	
	// 후기 게시판 댓글 삭제
	@RequestMapping("reviewrDelete.vol")
	public String reviewrDelete(@RequestParam("rId") int rId, @RequestParam("volId") int volId, @RequestParam("page") int page){
		int result = volBoardService.reviewrDelete(rId);
		
		if(result > 0) {
			return "redirect:ReviewDetail.vol?volId=" + volId + "&page=" + page;
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	// 게시판 댓글 수정 폼
	@RequestMapping("reviewrUpdateForm.vol")
	public ModelAndView reviewrUpdateForm(@RequestParam("page") int page, @RequestParam("rId") int rId, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request){
		VolunteerBoard volboard = volBoardService.selectReviewBoard(volId);
		VolReply vr = volBoardService.selectReviewReply(rId);
		
		if(volboard != null) {
			mv.addObject("page", page).addObject("volboard", volboard).addObject("vr", vr).setViewName("serviceBoard_ReviewDetail_update_reply");
		} else {
			throw new VolunteerException("댓글 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	// 게시판 댓글 수정
	@RequestMapping(value="reviewrUpdate.vol")
	@ResponseBody
	public String reviewrUpdate(@ModelAttribute VolReply volr, HttpServletRequest request, Model model) {
		int result = volBoardService.updateReviewReply(volr);
		
		if(result > 0) {
			return "success";
		} else {
			throw new VolunteerException("댓글 수정에 실패했습니다.");
		}
	}
	
	// 게시판 글 수정 폼
	@RequestMapping("reviewUpdateForm.vol")
	public String reviewUpdateForm(@RequestParam("page") int page, @RequestParam("volId") int volId, Model model, HttpServletRequest request){
		VolunteerBoard volu = volBoardService.selectReviewBoard(volId);
		VolunteerFile vFu = volBoardService.selectReviewFile(volId);
		
		if(volu != null) {
			model.addAttribute("page", page).addAttribute("volu", volu).addAttribute("vFu", vFu);
		}
		
		return "serviceBoard_ReviewUpdate";
	}
	
	// 게시판 글 수정
	@RequestMapping(value="reviewUpdate.vol", method=RequestMethod.POST)
	public String reviewUpdate(@RequestParam("page") int page, @ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, Model model) {
		int boardNo = volb.getVolId();
		
		int result = volBoardService.updateReviewBoard(volb);
		
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectReviewFile(boardNo);
		
		if(vFu != null) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				vFu = volBoardService.selectReviewFile(boardNo);
				int fileNo = vFu.getFileNo();
				
				int result2 = volBoardService.deleteReviewFile(fileNo);
				
				if(result2 > 0) {
					VolunteerFile vFile = saveFile(uploadFile, request);
					System.out.println(vFile);
					
					if(vFile != null) {
						vF.setFileName(uploadFile.getOriginalFilename());
						vF.setChangeName(vFile.getChangeName());
						vF.setFilePath(vFile.getFilePath());
						vF.setBoardNo(boardNo);
						int result3 = volBoardService.updateReviewFile(vF);
					}
				}
			}
		} else {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				VolunteerFile vFile = saveFile(uploadFile, request);
				
				if(vFile != null) {
					vF.setFileName(uploadFile.getOriginalFilename());
					vF.setChangeName(vFile.getChangeName());
					vF.setFilePath(vFile.getFilePath());
					vF.setBoardNo(boardNo);
					int result4 = volBoardService.updateReviewFile(vF);
				}
			}
		}
			
		if(result > 0) {
			return "redirect:ReviewDetail.vol?volId=" + boardNo + "&page=" + page;
		} else {
			throw new VolunteerException("게시글 수정에 실패하였습니다.");
		}
	}
	
	// 게시판 수정 중 파일 삭제
	@RequestMapping("vReviewdeleteFile.vol")
	public String vReviewdeleteFile(@RequestParam("fileNo") int fileNo, @RequestParam("volId") int volId, @RequestParam("page") int page){
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectReviewFile(volId);
		System.out.println("삭제할 파일 검색결과 : " + vFu);
		
		int result = 0;
		
		if(vFu != null) {
			result = volBoardService.deleteReviewFile(fileNo);
		}
		
		
		if(result > 0) {
			return "redirect:reviewUpdateForm.vol?volId=" + volId + "&page=" + page;
		} else {
			throw new VolunteerException("파일 삭제에 실패하였습니다.");
		}
		
	}
	
	// 후기 게시판 글 삭제
	@RequestMapping("ReviewDelete.vol")
	public String ReviewDelete(@RequestParam("volId") int volId){
		int result = volBoardService.ReviewDelete(volId);
		VolunteerFile vF = new VolunteerFile();
		VolunteerFile vFu = volBoardService.selectReviewFile(volId);
		
		if(vFu != null) {
			vFu = volBoardService.selectReviewFile(volId);
			int fileNo = vFu.getFileNo();
			
			int result2 = volBoardService.deleteReviewFile(fileNo);
		}
		
		
		if(result > 0) {
			return "redirect:volreview.vol";
		} else {
			throw new VolunteerException("게시물 삭제에 실패하였습니다.");
		}

	}
	
	//메인 게시판 리스트 불러오기 
	@RequestMapping("serviceList.vol")
	@ResponseBody
	public void serviceListSelect(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Volunteer> vList = volBoardService.selectvList();
		
		response.setContentType("application/json; charset=UTF-8");
	
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(vList, response.getWriter());

	}
	
}
