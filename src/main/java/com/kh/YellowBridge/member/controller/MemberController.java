package com.kh.YellowBridge.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.YellowBridge.member.model.exception.MemberException;
import com.kh.YellowBridge.member.model.service.MemberService;
import com.kh.YellowBridge.member.model.vo.Member;
import com.sun.tracing.dtrace.Attributes;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "memberLogin";
	}
	
	@RequestMapping("login.me")
	public ModelAndView memberLogin(@ModelAttribute Member m, HttpSession session, ModelAndView mv) {
	
		Member loginUser = mService.memberLogin(m);
		
//		bCryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd());
	
		
		if(bCryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("../../../index");
		
		}else {
			throw new MemberException("로그인 실패");
		}
		return mv;
	}
	
	
	
//	@RequestMapping("logout.me")
//	public ModelAndView memberLogout(SessionStatus status, ModelAndView mv) {
//		status.setComplete();
//		mv.setViewName("../../../index");
//		return mv;
//		
//	}
	
	@RequestMapping("logout.me")
	public String memberLogout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}

	
//---------------------------------------------------------------------------------//
	
	@RequestMapping("memberJoinTermsView.me")
	public String memberJoinTermsView() {
		return "memberJoinTerms";
	}


	
	@RequestMapping("joinView.me")
	public String joinView() {
		return "memberJoin";
	}

	@RequestMapping("minsert.me")
	public ModelAndView insertMember(@ModelAttribute Member m,@RequestParam("post") String post,
            												@RequestParam("address1") String address1,
            												@RequestParam("address2") String address2, 
            												ModelAndView mv) {
		
		String address = post + "/" + address1 + "/" + address2;
		String encPwd = bCryptPasswordEncoder.encode(m.getPwd());
		m.setAddress(address);
		m.setPwd(encPwd);
		
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			mv.setViewName("../../../index");
		}else {
			throw new MemberException("회원가입 실패");
		}
		return mv;
	}

	
//---------------------------------------------------------------------------------//
	
	
	@RequestMapping("myinfo.me")
	public String myInfoView() {
		return "mypage";
	}
	
	@RequestMapping("mupdateView.me")
	public String UpdateForm() {
		return "memderUpdateForm";
	}

	
	
	@RequestMapping("mupdate.me")
	public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
			                                             @RequestParam("address2") String address2,
			                                             @RequestParam("pwd") String pwd,
			                                             @RequestParam("newPwd1") String newPwd,
			                                             HttpSession session,Model model) {
		
		String address = post + "/" + address1 + "/" + address2;
		m.setAddress(address);
		
		
		Member mm =(Member)session.getAttribute("loginUser");

		System.out.println(bCryptPasswordEncoder.matches(m.getPwd(), mm.getPwd()));
		System.out.println(mm.getPwd());
		System.out.println(m.getPwd());
		System.out.println(m);
		System.out.println(mm);
		System.out.println(pwd);
		
		
		if(bCryptPasswordEncoder.matches(pwd, mm.getPwd())) {
			mm.setPwd(bCryptPasswordEncoder.encode(newPwd));
			int result =  mService.updateMember(mm);

			
			if(result > 0) {
				Member loginUser = mService.memberLogin(mm);
				model.addAttribute("loginUser", loginUser);
				return "redirect:myinfo.me";
			}
			
		}
		throw new MemberException("정보수정 실패");
	}
	
	 
	/*  비밀번호 변경 
	 * @RequestMapping("mPwdUpdate.me") public String update(@RequestParam("pwd")
	 * String pwd,
	 * 
	 * @RequestParam("newPwd1") String newPwd, HttpSession session, Model model) {
	 * Member m =(Member)session.getAttribute("loginUser");
	 * 
	 * if(bCryptPasswordEncoder.matches(pwd, m.getPwd())) { m.setPwd(
	 * bCryptPasswordEncoder.encode(newPwd)); int result = mService.updatePwd(m);
	 * 
	 * if(result > 0) { model.addAttribute("loginUser", m); return
	 * "redirect:myinfo.me"; }else { model.addAttribute("msg","로그인에 실패하였습니다.");
	 * return "../common/errorPage"; } }
	 * 
	 * }
	 */
	
	@RequestMapping("mdeleteView.me")
	public String mdeleteForm() {
		return "memberDeleteForm";
	}
	

	
	@RequestMapping("mdelete.me")
	public ModelAndView deleteMember(@RequestParam("id") String id, ModelAndView mv, SessionStatus status) {
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			status.setComplete();
			mv.setViewName("/memberSecessionForm");
		}else {
			throw new MemberException("회원탈퇴 실패");
		}
		return mv;
	}
	
	


	@RequestMapping("dupId.me")	
	@ResponseBody
 	public String duplicateId(@RequestParam("id") String userId) {
		int result = mService.checkId(userId);
		return result + "";
	}
	
	
	@RequestMapping("dupNickname.me")
	@ResponseBody
	public String duplicateNickname(@RequestParam("nickname") String nickname) {
		//System.out.println(nickname);
		int result = mService.checkNickname(nickname);
		return result + "";
	}

	
	
	@RequestMapping("memberCheck.me")
	@ResponseBody
	public String memberCheck(@RequestParam("id") String userId) {
		System.out.println(userId);
		int result = mService.memberCheck(userId);
		return result + "";
	}
	
	
	@RequestMapping("idFindView.me")
	public String findIdForm() {
		return "/memberFindId";
	}
 
	@RequestMapping("pwdFindView.me")
	public String findPwForm() {
		return "/memberFindPw";
	}
	 	
	
}
 	
 	
 	
 	
 	
 	
 	