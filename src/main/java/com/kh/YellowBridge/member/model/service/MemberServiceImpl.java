package com.kh.YellowBridge.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.dao.MemberDAO;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired //의존성 주입  프레임워크가 만든(beans) 객체를 가져오기 위해 사용
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		System.out.println("잘 넘어옴");
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.deleteMember(sqlSession, id);
	}

	@Override
	public int checkId(String userId) {
		return mDAO.checkId(sqlSession, userId);
	}

	@Override
	public int checkNickname(String nickname) {
		return mDAO.checkNickname(sqlSession, nickname);
	}

	@Override
	public int memberCheck(String userId) {
		return mDAO.memberCheck(sqlSession, userId);
	}

	@Override
	public int getAListCount(String memberNickName) {
		return mDAO.getAListCount(sqlSession, memberNickName);
	}

	@Override
	public ArrayList<AdoptionBoard> selectAList(String memberNickName, PageInfo pi) {
		return mDAO.selectAList(sqlSession, memberNickName, pi);
	}

	@Override
	public int getSListCount(String memberId) {
		return mDAO.getSListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<VolunteerBoard> selectSList(String memberId, PageInfo spi) {
		return mDAO.selectSList(sqlSession, memberId, spi);
	}

	@Override
	public Member memberIdSearch(Member m) {
		return mDAO.memberIdSearch(sqlSession, m);
	}

	@Override
	public int getMListCount(String memberId) {
		return mDAO.getMListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<QnaBoard> selectMList(String memberId, PageInfo npi) {
		return mDAO.selectMList(sqlSession, memberId, npi );
	}

	@Override
	public int getFListCount(String memberId) {
		return mDAO.getFListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<QnaBoard> selectFList(String memberId, PageInfo fpi) {
		return mDAO.selectFList(sqlSession, memberId, fpi);
	}

	@Override
	public int getMemberListCount() {
		return mDAO.getMemberListCount(sqlSession);
	}
	

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return mDAO.selectMemberList(sqlSession, pi);
	}

	
	

	
	






	





}
