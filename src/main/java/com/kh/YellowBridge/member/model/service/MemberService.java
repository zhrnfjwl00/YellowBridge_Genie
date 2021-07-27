package com.kh.YellowBridge.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int deleteMember(String id);

	int checkId(String userId);

	int checkNickname(String nickname);

	int memberCheck(String userId);

	int getAListCount(String memberNickName);

	ArrayList<AdoptionBoard> selectAList(String memberNickName, PageInfo pi);

	int getSListCount(String memberNickName);

	ArrayList<VolunteerBoard> selectSList(String memberNickName, PageInfo spi);

	Member memberIdSearch(Member m);

	int getMListCount(String memberNickName);

	ArrayList<QnaBoard> selectMList(String memberNickName, PageInfo npi);

	int getFListCount(String memberNickName);

	ArrayList<QnaBoard> selectFList(String memberNickName, PageInfo fpi);



	
	



	



	
	
	
	

}