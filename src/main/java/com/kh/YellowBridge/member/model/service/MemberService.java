package com.kh.YellowBridge.member.model.service;

import com.kh.YellowBridge.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int deleteMember(String id);

	
	

}