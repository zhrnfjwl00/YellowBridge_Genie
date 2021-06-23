package com.kh.YellowBridge.support.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.support.model.exception.SupportException;
import com.kh.YellowBridge.support.model.service.SupportService;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService sService;
	
	
	@RequestMapping("supportPage.sup")
	public String insertView(){
		
		return "supportPage";
	}
	
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
	
//	@RequestMapping("sdetail.sup")
//	public String boardDatail() {
//		
//		
//		return null;
//	}
	

}
