package com.kh.YellowBridge.service.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.common.Pagination;
import com.kh.YellowBridge.service.model.exception.NoticeException;
import com.kh.YellowBridge.service.model.exception.QnAException;
import com.kh.YellowBridge.service.model.service.qnaService;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.ScBoard;

public class QnAController {
	
	@Autowired
	private qnaService qnaService;
	
	@RequestMapping("qna.sc")
	public ModelAndView QnA(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,HttpSession session)  {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = qnaService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<QnaBoard> qnalist=  qnaService.selectList(pi);
		
		if(qnalist != null) {
			mv.addObject("qnalist", qnalist).addObject("pi", pi).setViewName("qna");
			
		} else {
			throw new QnAException("qna ��ü��ȸ�� �����Ͽ����ϴ�.");
		}
		return mv;
	}
	
	
	@RequestMapping("qnainsertform.sc")
	public String QnAInsertForm(HttpSession session) {
		return "qnainsertform";
	}
	
	@RequestMapping(value="qnainsert.sc",method=RequestMethod.POST)
	public String QnaInsert(@ModelAttribute QnaBoard b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		
		FileInfo fi = new FileInfo();
		  
		  if(uploadFile != null && !uploadFile.isEmpty()) { 
			  ScFileInfo finfo = saveFile(uploadFile, request);
		  
		  if(finfo.getChangeName() != null) {
			  fi.setFileName(uploadFile.getOriginalFilename()); 
			  fi.setChangeName(finfo.getChangeName()); fi.setFilePath(finfo.getFilePath());
		  } }b.setqWriter("qnaWriter");
		  
		  int result = qnaService.insertqnaBoard(b, fi);
		  
		  if(result > 0) { 
			  return "redirect:qna.sc";
		  } else { 
			  throw new NoticeException("."); 
		  }
		
	}
	
	
	@RequestMapping("qnadetail.sc")
	public ModelAndView qnaDetail(@RequestParam("page") int page,@RequestParam("bId")int bId,  ModelAndView mv, HttpServletRequest request){
		
		QnaBoard qnaboard = qnaService.selectBoard(bId);
		
		if(qnaboard != null) {
			mv.addObject("page",page).addObject("board",qnaboard).setViewName("qnaDetail");;
		}else {
			throw new NoticeException(".");
		}
		return mv;
		
	}

	public ScFileInfo saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		ScFileInfo fi = new ScFileInfo();
		
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
			System.out.println("��������: " + e.getMessage());
			
		}
		
		fi.setChangeName(renameFileName);
		fi.setFilePath(savePath);
		
		return fi;
	}
	
	
	
}
