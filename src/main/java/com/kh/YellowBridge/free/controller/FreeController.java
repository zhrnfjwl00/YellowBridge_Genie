package com.kh.YellowBridge.free.controller;

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
import com.kh.YellowBridge.free.model.exception.FreeException;
import com.kh.YellowBridge.free.model.service.freeService;
import com.kh.YellowBridge.free.model.vo.FrFileInfo;
import com.kh.YellowBridge.free.model.vo.Free;
import com.kh.YellowBridge.free.model.vo.FreePagination;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.service.model.exception.NoticeException;
import com.kh.YellowBridge.service.model.exception.QnAException;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Controller
public class FreeController {
	
	@Autowired
	private freeService fService;
	
	
	//-------------------default page----------------------------------
	@RequestMapping("freeboard.fr")
	public ModelAndView Freeboard(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,HttpSession session)  {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = fService.getListCount();
		
		PageInfo pi = FreePagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Free> fList = fService.selectList(pi);
		
		if(fList != null) {
			mv.addObject("fList", fList).addObject("pi",pi).setViewName("freeboard");

		} else {
			throw new FreeException("free오류.");
		}
		
		return mv;
	}
	
	// -----------------------------insert part-----------------------
	@RequestMapping("freeinsertform.fr")
	public String FreeInsertForm(HttpSession session) {

		return "freeinsertform";
	}
	
	@RequestMapping(value="freeinsert.fr",method=RequestMethod.POST)
	public String InsertFree(@ModelAttribute Free b, @RequestParam("uploadFile") MultipartFile uploadFile,HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		String bWriter = ((Member)session.getAttribute("loginUser")).getId(); 
		FileInfo scfi = new FileInfo();

		if(uploadFile != null && !uploadFile.isEmpty()) { 
			FileInfo scfinfo = saveFile(uploadFile, request);
			if(scfinfo != null) {
				scfi.setFileName(uploadFile.getOriginalFilename()); 
				scfi.setChangeName(scfinfo.getChangeName()); scfi.setFilePath(scfinfo.getFilePath());
			} }b.setbWriter(bWriter);
			
			int result = fService.insertfreeBoard(b, scfi);
			
			if(result > 0) { 
				return "redirect:freeboard.fr";
			} else { 
				throw new FreeException("."); 
			}

	}
	
	
	
	//------------------- detail ----------------------------------
	@RequestMapping("freedetail.fr")
	public ModelAndView freeDetail(@RequestParam("page") int page,@RequestParam("bId")int bId,  ModelAndView mv, HttpServletRequest request){

		Free freeboard = fService.selectBoard(bId);

		if(freeboard != null) {
			FrFileInfo scfi = fService.frdetailFile(bId);

			mv.addObject("page",page).addObject("board",freeboard).addObject("scfi", scfi).setViewName("freeDetail");

		}else {
			throw new NoticeException(".");
		}
		return mv;

	}
	
	
	
	
	
	//------------------- delete ----------------------------------
	public void deleteFile(String fileName, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/suploadFiles";

		File f = new File(savePath + "/" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("freedelete.fr")
	public String deleteBoard(@RequestParam("bNo") int bId) {

		int result = fService.deleteBoard(bId);

		if(result > 0) {
			return "redirect:freeboard.fr";
		} else {
			throw new QnAException(".");
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------- Reply ----------------------------------
	
	
	
	@RequestMapping("addReply.fr")
	@ResponseBody
	public String addReply(@ModelAttribute Reply r,  HttpSession session) {
		
		String rWriter = ((Member)session.getAttribute("loginUser")).getId();
		
		
		r.setrWriter(rWriter); // user01�쓣 媛�吏�怨좎엳�쓬
		
		int result = fService.insertReply(r);
		if(result > 0) {
			return "success";
		}else {
			throw new QnAException("�뙎湲��벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎");
		}
			
			
	}
	
	@RequestMapping("rList.fr")
	public void getReplyList(@RequestParam("bId")int bId, HttpServletResponse response) throws JsonIOException, IOException{
		
		ArrayList<Reply> list = fService.selectReplyList(bId);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------- save file----------------------------------
		public FileInfo saveFile(MultipartFile uploadFile, HttpServletRequest request) {
			FileInfo scfi = new FileInfo();

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/scuploadFiles";

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
				System.out.println("오류입니다 : " + e.getMessage());

			}

			scfi.setChangeName(renameFileName);
			scfi.setFilePath(savePath);

			return scfi;

		}
}
