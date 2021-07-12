package com.kh.YellowBridge.member.model.service;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.member.model.dao.MemberDAO;
import com.kh.YellowBridge.member.model.vo.Member;

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



	





}
