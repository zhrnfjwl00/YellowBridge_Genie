package com.kh.YellowBridge.adoption.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.YellowBridge.adoption.model.exception.AdoptionException;
import com.kh.YellowBridge.adoption.model.service.AdoptionService;
import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.adoption.model.vo.AnimalPagination;
import com.kh.YellowBridge.adoption.model.vo.AnimalRequest;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.member.model.vo.Member;

@Controller
public class AdoptionController {

	// 의존성 주입
	@Autowired
	private AdoptionService aService;

	// 입양절차
	@RequestMapping("adopProcess.ado")
	public String adopProcess() {
		return "adopProcess";
	}

	// 입양공고리스트 , 페이징
	@RequestMapping("adopNotice.ado")
	public ModelAndView adopNotice(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date fromDate) {
		int currentPage = 1; // 연산에서 사용할 변수

		if (page != null) {
			currentPage = page;
		}
		int listCount = aService.getAnimalListCount();

		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = AnimalPagination.getPageInfo(currentPage, listCount);
//			AdoptionFile af = aService.selectAnimalile(animalNo);

		ArrayList<AnimalInfo> animallist = aService.selectAnimalList(pi);
		System.out.println(animallist);

		if (animallist != null) {

			mv.addObject("animallist", animallist).addObject("pi", pi).setViewName("adopNotice");

		} else {
			throw new AdoptionException("입양공고 조회에 실패하였습니다.");
		}

		return mv;
	}

	// 입양공고 등록 폼 이동
	@RequestMapping("animalNoticeWriterForm.ado")
	public String animalNoticeWriterForm() {
		return "animalNoticeWriterForm";
	}

	// 아래 animalInsert.ado에서 Date를 받아오지 못하는 믹스매치 오류때문에 설정해줌.
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("animalInsert.ado")
	public String animalInsert(@ModelAttribute AnimalInfo a, @RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request, @DateTimeFormat(pattern = "yyyy-MM-dd") Date fromDate) {
		AdoptionFile af = new AdoptionFile();

		System.out.println("AnimalInfo : " + a);

		System.out.println("uploadFile : " + uploadFile);
		System.out.println("uploadFile.getOriginalFilename() : " + uploadFile.getOriginalFilename());
		// [파일을 넣었을 떄]
		// uploadFileMultipartFile : [field="uploadFile", filename=스크린샷 2021-06-17
		// 오후 2.50.26.png, contentType=image/png, size=231792]
		// uploadFile.getOriginalFilename() : 스크린샷 2021-06-17 오후 2.50.26.png

		// [파일을 넣지 않았을 떄]
		// uploadFileMultipartFile : [field="uploadFile", filename=,
		// contentType=application/octet-stream, size=0]
		// uploadFile.getOriginalFilename() :

		// 파일을 넣은지 안넣은지의 여부는 getOriginalFilename() 이 있vs없다로 구분(확인 가능함)

//				if(!uploadFile.getOriginalFilename().equals("")) {
		if (uploadFile != null && !uploadFile.isEmpty()) {
			// getOriginalFilename이 "" <-- 아무것도 들어오지 않은 것과 같지 않다면!
			AdoptionFile affi = saveFile(uploadFile, request);

			if (affi.getFileChangeName() != null) {
				af.setFileName(uploadFile.getOriginalFilename());
				af.setFileChangeName(affi.getFileChangeName());
				af.setFilePath(affi.getFilePath());

				System.out.println("AdoptionFile : " + af);

			}
		}

		int result = aService.insertAnimal(a, af);

		if (result > 0) {
			return "redirect:adopNotice.ado";
		} else {
			throw new AdoptionException("입양 공고 등록에 실패하였습니다.");
		}

	}

	// 입양 신청서 폼 이동
	@RequestMapping("animalApplyWriterForm.ado")
	public String animalApplyWriterForm(@RequestParam("animalNo") int animalNo, Model model) {
		// session에 저장된 userId를 writer에 저장
//			String nickname = ((Member)session.getAttribute("loginUser")).getNickname();
		// vo에 writer를 세팅
		AnimalInfo animal = aService.selectApplyAnimal(animalNo);

		if (animal != null) {
			model.addAttribute("animal", animal);
			return "animalApplyWriterForm";
		} else {
			throw new AdoptionException("입양신청에 실패하였습니다.");
		}
	}

	// 사용자_입양신청서 작성
	@RequestMapping("animalApplyInsert.ado")
	public String animalApplyInsert(@ModelAttribute AnimalRequest ar, HttpSession session) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getNo();
		ar.setRequestMemberNo(memberNo);

		int animalNo = ar.getRequestAnimalNo();
		System.out.println("동물 번호확인 : " + animalNo);
		System.out.println("폼 정보확인 : " + ar);
		System.out.println("로그인 정보확인 : " + memberNo);

		// 신청과 동시에 animalStatus의 값이 N으로 변경되어야 하기 때문에 impl에서 ANIMAL_INFO의 STATUS 값을 변경해줌.
		// insert와 update를 한번에 할 수 있는 쿼리문은 없음.(?)
		int result = aService.insertAppForm(ar, animalNo);

		System.out.println("폼 작성 성공 : " + result);

		if (result > 0) {
			return "redirect:animalApplyComplete.ado";
		} else {
			throw new AdoptionException("입양 신청서 작성에 실패하였습니다.");
		}
	}

	// 사용자_입양신청서 작성 완료페이지 (필요시 내용 노출 예정)
	@RequestMapping("animalApplyComplete.ado")
	public ModelAndView animalApplyComplete(ModelAndView mv, HttpSession session) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getNo();
		AnimalRequest ar = aService.selectAppForm(memberNo);

		System.out.println("ar : " + ar);

		if (ar != null) {
			mv.addObject("ar", ar).setViewName("animalApplyComplete");
		} else {
			throw new AdoptionException("신청완료 페이지 보기에 실패하였습니다.");
		}
		return mv;
	}

	// 사용자_입양신청조회 리스트
	@RequestMapping("adopInfo.ado")
	public ModelAndView adopInfo(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpSession session, HttpServletRequest request) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if ((Member) session.getAttribute("loginUser") == null) {
			request.setAttribute("msg", "로그인 후 이용하세요");
		}

		int memberNo = ((Member) session.getAttribute("loginUser")).getNo();
		int listCount = aService.getRequestListCount(memberNo);

		Member member = aService.selectMember(memberNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<AnimalRequest> requestlist = aService.selectRequestList(memberNo, pi);
		System.out.println(requestlist);

		if (requestlist != null) {
			mv.addObject("requestlist", requestlist).addObject("pi", pi).addObject("member", member)
					.setViewName("adopInfo");
		} else {
			throw new AdoptionException("입양신청조회 리스트 조회에 실패하였습니다.");
		}
		return mv;
	}

	// 관리자_입양공고 조회 리스트
	@RequestMapping("admin_adoption.ado")
	public ModelAndView adminRecodeList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date fromDate) {
		int currentPage = 1; // 연산에서 사용할 변수

		if (page != null) {
			currentPage = page;
		}
		int listCount = aService.getAnimalListCount();

		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//				AdoptionFile af = aService.selectAnimalile(animalNo);

		ArrayList<AnimalInfo> animallist = aService.admin_selectAnimalList(pi);
		System.out.println(animallist);

		if (animallist != null) {

			mv.addObject("animallist", animallist).addObject("pi", pi).setViewName("admin_adopRecodeList");

		} else {
			throw new AdoptionException("관리자 입양공고 조회에 실패하였습니다.");
		}
		return mv;
	}

	// 관리자_입양공고 삭제 (선택된 공고만 삭제)
	@ResponseBody
	@RequestMapping("admin_deleteNotice.ado")
	public String deleteNotice(@RequestParam(required = false, value = "checkbox[]") List<Integer> animalNo) {
		// view에서 체크된 값 Integer List로 가져오기
		// vo에 animalNo라고 설정했으므로 animalNo로 해주어야 한다.

		for (int i = 0; i < animalNo.size(); i++) {
			int result = aService.deleteAnimalNotice(animalNo.get(i));
			System.out.println(animalNo.get(i));
		}
		// vo에 animal_no는 int로 선언되어 있고, script에서 Ajax를 통해 키 값이 checkArr인 배열로 보냈으니까
		// @RequestParam(value="checkArr[]")로 받고
		// 타입은 배열이니까 꼭 List<Integer> 로 받아온다 !

		return "redirect:admin_adoption.ado";
	}

	// 사용자_입양일지 리스트, 페이징처리
	@RequestMapping("adopRecode.ado")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1; // 연산에서 사용할 변수

		if (page != null) {
			currentPage = page;
		}
		int listCount = aService.getListCount();

		// 페이징 처리를 위한 연산 : Pagination
		PageInfo pi = AnimalPagination.getPageInfo(currentPage, listCount);

		ArrayList<AdoptionBoard> adoplist = aService.selectList(pi);

		if (adoplist != null) {

			mv.addObject("adoplist", adoplist).addObject("pi", pi).setViewName("adoptionRecodeList");

		} else {
			throw new AdoptionException("입양일지리스트 조회에 실패하였습니다.");
		}

		return mv;
	}

	// 입양 일지 상세보기
	@RequestMapping("adoptionRecodeDetail.ado")
	public String adoptionRecodeDetail(@RequestParam("page") int page, @RequestParam("adopId") int adopId,
			Model model) {

		AdoptionBoard adopboard = aService.selectAdopBoard(adopId);
		AdoptionFile af = aService.selectAdopFile(adopId);

		if (adopboard != null) {
			model.addAttribute("page", page).addAttribute("adopboard", adopboard).addAttribute("af", af);
			return "adoptionRecodeDetail";
		} else {
			throw new AdoptionException("입양일지 상세보기에 실패하였습니다.");
		}
	}

	// 입양 일지 등록폼 이동
	@RequestMapping("adoptionRecodeWrite.ado")
	public String adoptionRecodeWrite() {
		return "adoptionRecodeWrite";
	}

	// 작성버튼 클릭시 adopinsert.ado 로 이동
	@RequestMapping("adopinsert.ado")
	public String adopInsertBoard(@ModelAttribute AdoptionBoard a, @RequestParam("uploadFile") MultipartFile uploadFile,
			HttpServletRequest request, HttpSession session) {

		AdoptionFile af = new AdoptionFile();

		System.out.println("AdoptionBoard : " + a);

		System.out.println("uploadFile : " + uploadFile);
		System.out.println("uploadFile.getOriginalFilename() : " + uploadFile.getOriginalFilename());
		// [파일을 넣었을 떄]
		// uploadFileMultipartFile : [field="uploadFile", filename=스크린샷 2021-06-17
		// 오후 2.50.26.png, contentType=image/png, size=231792]
		// uploadFile.getOriginalFilename() : 스크린샷 2021-06-17 오후 2.50.26.png

		// [파일을 넣지 않았을 떄]
		// uploadFileMultipartFile : [field="uploadFile", filename=,
		// contentType=application/octet-stream, size=0]
		// uploadFile.getOriginalFilename() :

		// 파일을 넣은지 안넣은지의 여부는 getOriginalFilename() 이 있vs없다로 구분(확인 가능함)

//		if(!uploadFile.getOriginalFilename().equals("")) {
		if (uploadFile != null && !uploadFile.isEmpty()) {
			// getOriginalFilename이 "" <-- 아무것도 들어오지 않은 것과 같지 않다면!
			AdoptionFile affi = saveFile(uploadFile, request);

			if (affi.getFileChangeName() != null) {
				af.setFileName(uploadFile.getOriginalFilename());
				af.setFileChangeName(affi.getFileChangeName());
				af.setFilePath(affi.getFilePath());

				System.out.println("AdoptionFile : " + af);

			}
		}

		// session에 저장된 userId를 writer에 저장
		String nickname = ((Member) session.getAttribute("loginUser")).getNickname();
		// vo에 writer를 세팅
		// 현재 로그인 서비스가 없어 임의로 작성자 삽입
		a.setAdopWriterNickname(nickname);

		int result = aService.insertAdopBoard(a, af);

		if (result > 0) {
			return "redirect:adopRecode.ado";
		} else {
			throw new AdoptionException("입양 일지 등록에 실패하였습니다.");
		}
	}

	// 내가 지정한 폴더에 파일을 저장하는 메소드
	public AdoptionFile saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		AdoptionFile af = new AdoptionFile();

		String root = request.getSession().getServletContext().getRealPath("resources");

		// request.getSession().getServletContext().getRealPath("resources"); --->
		// resources폴더의 위치
		String savePath = root + "/auploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String renamePath = folder + "/" + renameFileName;
		try {
			uploadFile.transferTo(new File(renamePath));
			// transferTo() --> 내가 원하는 위치에 파일을 전송해주는 메소드
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일전송에러 : " + e.getMessage());
		}

		af.setFileChangeName(renameFileName);
		af.setFilePath(savePath);

		return af;

	}

	// 게시물 수정폼으로 이동
	@RequestMapping("adopUpdateForm.ado")
	public String adopUpdateForm(@RequestParam("adopId") int adopId, @RequestParam("page") int page, Model model) {
		// 기존 데이터를 가지고서 넘어가야함.
		// selectBoard를 이용

		AdoptionBoard adopboard = aService.selectAdopBoard(adopId);

		model.addAttribute("adopboard", adopboard);
		model.addAttribute("page", page);

		return "adoptionRecodeUpdateForm";

	}

	// 게시물 수정 보류 @@@@@@@@@@@@@@@@@@@@@@@@@@

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 게시물 삭제
	@RequestMapping("adopDelete.ado")
	public String adopDeleteBoard(@RequestParam("adopId") int adopId) {
		int result = aService.deleteAdopBoard(adopId);

		if (result > 0) {
			return "redirect:adopRecode.ado";
		} else {
			throw new AdoptionException("입양 일지 삭제를 실패하였습니다.");
		}

	}

	// 댓글 추가
	@RequestMapping("adopaddReply.ado")
	@ResponseBody
	public String addReply(@ModelAttribute AdoptionReply r, HttpSession session) {
		// String을 반환하니까 @ResponseBody도 필요

		// session에 저장된 userId를 writer에 저장
		String rWriter = ((Member) session.getAttribute("loginUser")).getNickname();
		// vo에 writer를 세팅
		r.setrWriter(rWriter);

		int result = aService.insertReply(r);

		if (result > 0) {
			return "success";
		} else {
			throw new AdoptionException("댓글 등록을 실패하였습니다.");
		}
	}

	// 댓글 리스트 노출
	@RequestMapping("adoprList.ado")
	public void getReplyList(@RequestParam("adopId") int adopId, HttpServletResponse response)
			throws JsonIOException, IOException {

		ArrayList<AdoptionReply> list = aService.selectReplyList(adopId);

		// 인코딩
		response.setContentType("application/json; charset=UTF-8");

		// 객체를 여러개 보내고 싶으면 JSON,GSON 사용
//		Gson gson = new Gson();

		// 날짜 포멧을 바꾸고 싶으면 GsonBuilder사용
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());

	}

	// 메인페이지 입양공고 게시
	@RequestMapping("animalList.ado")
	@ResponseBody
	public void adopList(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<AnimalInfo> aList = aService.selectAList();

		response.setContentType("application/json; charset=UTF-8");

		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(aList, response.getWriter());

	}

}
