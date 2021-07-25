package com.kh.YellowBridge.member.model.service;

import javax.servlet.http.HttpServletResponse;

import com.kh.YellowBridge.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int deleteMember(String id);

	int checkId(String userId);

	int checkNickname(String nickname);

	int memberCheck(String userId);

	



	



	
	
	
	

}