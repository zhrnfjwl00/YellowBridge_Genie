package com.kh.YellowBridge.volunteer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;
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
import com.kh.YellowBridge.volunteer.model.vo.VolunteerApply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerFile;

@Controller
public class VolunteerController {
	
	@Autowired
	private VolBoardService volBoardService;
	
	@RequestMapping("serviceInfo.vol")
	public String serviceInfo(){
		return "serviceInfo";
	}
	
	@RequestMapping("serviceAppDetail.vol")
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
//		System.out.println(volad.get(1).getFilePath()+volad.get(1).getFileName());
		
		
		if(volad != null) {
			// Model or ModelAndView 사용하기
			mv.addObject("volad", volad).addObject("vpi", vpi).setViewName("apply_advertise_list");
			// setViewName은 반환값이 void이기 때문에 맨 뒤에 와야함
		} else {
			throw new VolunteerException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	
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
	
	@RequestMapping("sApplyForm.vol")
	public String insertApplyForm(@ModelAttribute VolunteerApply volApp){
		
		int result = volBoardService.insertAppForm(volApp);
		System.out.println("폼 작성 성공 : " + result);
		
		if(result > 0) {
			return "redirect:sApplyComplete.vol";
		} else {
			throw new VolunteerException("봉사 신청서 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("sApplyComplete.vol")
	public ModelAndView serviceApplyComplete(ModelAndView mv){
		int memberNo = 2;
		VolunteerApply volApp = volBoardService.selectAppForm(memberNo);
		
		if(volApp != null) {
			mv.addObject("volApp", volApp).setViewName("apply_advertise_complete");
		} else {
			throw new VolunteerException("신청완료 페이지 보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
//	봉사게시판
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
	
	@RequestMapping("volBoardDetail.vol")
	public ModelAndView serviceBoardDetail(@RequestParam("page") int page, @RequestParam("volId") int volId, ModelAndView mv, HttpServletRequest request) {
		VolunteerBoard volboard = volBoardService.selectVolBoard(volId);
		VolunteerFile vFile = volBoardService.selectVolFile(volId);
		
		if(volboard != null) {
			mv.addObject("page", page).addObject("volboard", volboard).addObject("vFile", vFile).setViewName("serviceBoardDetail");
		} else {
			throw new VolunteerException("게시판 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("serviceBoardWriteForm.vol")
	public String serviceBoardWriteForm(){
		return "serviceBoardWrite";
	}
	
	@RequestMapping("serviceBoardWrite.vol")
	public String serviceBoardWrite(@ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
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
	
	
	@RequestMapping("serviceBoardUpdateForm.vol")
	public String serviceBoardUpdateForm(@RequestParam("page") int page, @RequestParam("volId") int volId, Model model, HttpServletRequest request){
		VolunteerBoard volu = volBoardService.selectVolBoard(volId);
		VolunteerFile vFu = volBoardService.selectVolFile(volId);
		
		if(volu != null) {
			model.addAttribute("page", page).addAttribute("volu", volu).addAttribute("vFu", vFu);
		}
		
		return "serviceBoardUpdate";
	}
	
	@RequestMapping(value="serviceBoardUpdate.vol", method=RequestMethod.POST)
	public String serviceBoardUpdate(@ModelAttribute VolunteerBoard volb, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, Model model) {
		System.out.println("update_volb : " + volb);
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
			return "redirect:serviceBoardList.vol";
		} else {
			throw new VolunteerException("게시글 수정에 실패하였습니다.");
		}
	}

	private VolunteerFile saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		VolunteerFile vF = new VolunteerFile();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savaPath = root + "/voluploadFiles";

		
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
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	@RequestMapping("voladdReply.vol")
	@ResponseBody
	public String insertReply(@ModelAttribute VolReply r, HttpSession session) {
		System.out.println("들어온 r : " + r);
		/*
		 * int rWriter = ((Member)session.getAttribute("loginUser")).getId(); //
		 * import해줘야 빨간 줄 사라짐 r.setVolrWriter(rWriter);
		 */
		
		int result = volBoardService.insertVolReply(r);
		System.out.println("댓글 작성 결과 : " + result);
		
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
