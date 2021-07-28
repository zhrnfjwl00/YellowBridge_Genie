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
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.service.model.exception.NoticeException;
import com.kh.YellowBridge.service.model.exception.QnAException;
import com.kh.YellowBridge.service.model.service.qnaService;
import com.kh.YellowBridge.service.model.service.scService;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.exception.SupportException;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.volunteer.model.exception.VolunteerException;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;


@Controller
public class ScController {

	@Autowired
	private scService scService;

	@Autowired
	private qnaService qnaService;

	@RequestMapping("qna.sc")
	public ModelAndView qna(@RequestParam(value="page", required=false) Integer page, ModelAndView mv,HttpSession session)  {
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
			throw new QnAException("qna �쟾泥댁“�쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
		return mv;
	}
	@RequestMapping("qnainsertform.sc")
	public String QnAInsertForm(HttpSession session) {

		return "qnainsertform";
	}
	
	@RequestMapping(value="qnainsert.sc",method=RequestMethod.POST)
	public String QnaInsert(@ModelAttribute QnaBoard b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) throws UnsupportedEncodingException {

		FileInfo scfi = new FileInfo();

		if(uploadFile != null && !uploadFile.isEmpty()) { 
			FileInfo scfinfo = saveFile(uploadFile, request);

			if(scfinfo.getChangeName() != null) {
				scfi.setFileName(uploadFile.getOriginalFilename()); 
				scfi.setChangeName(scfinfo.getChangeName()); scfi.setFilePath(scfinfo.getFilePath());
			} }b.setqWriter("qnaWriter");

			int result = qnaService.insertqnaBoard(b, scfi);

			if(result > 0) { 
				return "redirect:qna.sc";
			} else { 
				throw new NoticeException("."); 
			}

	}


	@RequestMapping("qnadetail.sc")
	public ModelAndView qnaDetail(@RequestParam("page") int page,@RequestParam("qId")int qId,  ModelAndView mv, HttpServletRequest request){

		QnaBoard qnaboard = qnaService.selectBoard(qId);

		if(qnaboard != null) {
			ScFileInfo scfi = qnaService.scdetailFile(qId);

			mv.addObject("page",page).addObject("board",qnaboard).addObject("scfi", scfi).setViewName("qnaDetail");

		}else {
			throw new NoticeException(".");
		}
		return mv;

	}
	
	

	
	
	


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
			System.out.println("�뙆�씪�쟾�넚 �뿉�윭 : " + e.getMessage());

		}

		scfi.setChangeName(renameFileName);
		scfi.setFilePath(savePath);

		return scfi	;

	}



	@RequestMapping("faq.sc")
	public String FAQ() {

		return "faq";
	}

	@RequestMapping("noinsertform.sc")
	public String NoInsertForm(HttpSession session) {
		return "noinsertform";
	}

	@RequestMapping(value="noinsert.sc",method=RequestMethod.POST)
	public String NoInsert(@ModelAttribute ScBoard b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {

		FileInfo fi = new FileInfo();

		if(uploadFile != null && !uploadFile.isEmpty()) { 
			FileInfo finfo = saveFile(uploadFile, request);

			if(finfo.getChangeName() != null) {
				fi.setFileName(uploadFile.getOriginalFilename()); 
				fi.setChangeName(finfo.getChangeName()); fi.setFilePath(finfo.getFilePath());
			} }b.setScWriter("admin");

			int result = scService.insertscBoard(b, fi);

			if(result > 0) { 
				return "redirect:notice.sc";
			} else { 
				throw new NoticeException("."); 
			}

	}

	@RequestMapping("notice.sc")
	public ModelAndView Notice(@RequestParam(value="page",required=false) Integer page, ModelAndView mv,HttpSession session) {

		int currentPage = 1; // �뜝�럥�뿼�뜝�럡�뀰�뜝�럥�뱺 �뜝�럡�뀬�뜝�럩�뮔�뜝�럥留� �솻洹⑥삕�뜝�럥�빢

		if(page != null) {
			currentPage = page;
		}

		int listCount = scService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<ScBoard> sclist = scService.selectList(pi); 

		if(sclist!=null) {
			mv.addObject("sclist", sclist).addObject("pi", pi).setViewName("notice");

		}else {
			throw new NoticeException(".");
		}



		return mv;
	}

	@RequestMapping("nodetail.sc")
	public ModelAndView noticeDetail(@RequestParam("page") int page,@RequestParam("bId")int bId,  ModelAndView mv, HttpServletRequest request){

		ScBoard scboard = scService.selectBoard(bId);

		if(scboard != null) {
			mv.addObject("page",page).addObject("board",scboard).setViewName("noticeDetail");;
		}else {
			throw new NoticeException("�뇦猿딆뒩占쎈뻣�뜝�럥�냷 �뜝�럡留믣뜝�럡�돪�솻洹ｋ뼬�뵳怨ㅼ삕�굢占� �뜝�럥堉꾢뜝�럥�넮�뜝�럥由��뜝�룞�삕�뜝�럥裕멨뜝�럥鍮띶뜝�럥堉�.");
		}
		return mv;

	}



	public void deleteFile(String fileName, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/suploadFiles";

		File f = new File(savePath + "/" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("qnadelete.sc")
	public String deleteBoard(@RequestParam("bNo") int qId) {

		int result = qnaService.deleteBoard(qId);

		if(result > 0) {
			return "redirect:qna.sc";
		} else {
			throw new QnAException(".");
		}

	}
	@RequestMapping("nodelete.sc")
	public String scdeleteBoard(@RequestParam("bNo") int scId) {
		
		int result = scService.deleteBoard(scId);
		
		if(result > 0) {
			return "redirect:notice.sc";
		} else {
			throw new QnAException(".");
		}
		
	}
	
	
	
		
		
	
	
	
	

	@RequestMapping("qnaupdateForm.sc")
	public String qnaUpdateForm( @RequestParam("bNo") int qId, @RequestParam("page") int page, Model model){
		
		QnaBoard qnaboard	= qnaService.selectBoard(qId);
		ScFileInfo sFi  = qnaService.selectFile(qId);

		model.addAttribute("qnaboard", qnaboard).addAttribute("page", page).addAttribute("sFi", sFi);
		return "qnaupdateForm";
	}
	

	@RequestMapping("qnaupdate.sc")
	public String updateBoard(@ModelAttribute QnaBoard b, @RequestParam("page") int page,
															@RequestParam("reloadFile") MultipartFile reloadFile,
															HttpServletRequest request) {
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
				
			  fi.setBoardNo(b.getqId()); qnaService.updateFile(fi);
			}

			int result = qnaService.updateBoard(b);	
			
			if(result > 0) {
				
				return "redirect:qnaDetail.sc?qId=" + b.getqId() + "&page=" + page;
			} else {
				throw new QnAException("�삤瑜섏엯�땲�떎.");
			}

	}
	
	
	
	
	
	
	
	@RequestMapping("addReply.sc")
	@ResponseBody
	public String addReply(@ModelAttribute Reply r,  HttpSession session) {
		
		String rWriter = ((Member)session.getAttribute("loginUser")).getId();
		
		
		r.setrWriter(rWriter); // user01�쓣 媛�吏�怨좎엳�쓬
		
		int result = qnaService.insertReply(r);
		if(result > 0) {
			return "success";
		}else {
			throw new QnAException("�뙎湲��벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎");
		}
			
			
	}
	
	@RequestMapping("rList.sc")
	public void getReplyList(@RequestParam("qId")int qId, HttpServletResponse response) throws JsonIOException, IOException{
		
		ArrayList<Reply> list = qnaService.selectReplyList(qId);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());
		
		
	}
	
	@RequestMapping("rDelete.sc")
	public String servicerDelete(@RequestParam("rId") int rId, @RequestParam("qId") int qId, @RequestParam("page") int page){
		int result = qnaService.servicerDelete(rId);
		
		if(result > 0) {
			return "redirect:qnaDetail.sc?qId=" + qId + "&page=" + page;
		} else {
			throw new QnAException("野껊슣�뻻�눧占� 占쎄텣占쎌젫占쎈퓠 占쎈뼄占쎈솭占쎈릭占쏙옙占쎈뮸占쎈빍占쎈뼄.");
		}
		
	}
	
	
	@RequestMapping("noticeList.sc")
	@ResponseBody
	public void noticeList(HttpServletResponse response) throws JsonIOException, IOException {
		
		
		ArrayList<ScBoard> diaryList = scService.selectNoticeList();
		
		response.setContentType("application/json; charset=UTF-8");
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(diaryList, response.getWriter());
	
	}


}
