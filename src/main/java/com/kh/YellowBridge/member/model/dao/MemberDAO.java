package com.kh.YellowBridge.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.member.model.vo.Member;


@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}


	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}


	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("잘 넘어옴.");
		return sqlSession.update("memberMapper.updateMember", m);
	}


	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}



	


}