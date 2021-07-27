package com.kh.YellowBridge.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;


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


	public int checkId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}


	public int checkNickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickname", nickname);
	}


	public int memberCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.memberCheck", userId);
	}


	public int getAListCount(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("memberMapper.getAListCount", memberNickName);
	}


	public ArrayList<AdoptionBoard> selectAList(SqlSessionTemplate sqlSession, String memberNickName, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("memberMapper.selectAList", memberNickName, rowBounds);
	}


	public int getSListCount(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("memberMapper.getSListCount", memberNickName);
	}


	public ArrayList<VolunteerBoard> selectSList(SqlSessionTemplate sqlSession, String memberNickName, PageInfo spi) {
		int offset = (spi.getCurrentPage() - 1) * spi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, spi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSList", memberNickName, rowBounds);
	}


	public Member memberIdSearch(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.memberIdSelect", m);
	}


	public int getMListCount(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("memberMapper.getMListCount", memberNickName);
	}


	public ArrayList<QnaBoard> selectMList(SqlSessionTemplate sqlSession, String memberNickName, PageInfo npi) {
		int offset = (npi.getCurrentPage() - 1) * npi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, npi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMList", memberNickName, rowBounds);
	}


	public int getFListCount(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("memberMapper.getFListCount", memberNickName);
	}


	public ArrayList<QnaBoard> selectFList(SqlSessionTemplate sqlSession, String memberNickName, PageInfo fpi) {
		int offset = (fpi.getCurrentPage() - 1) * fpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, fpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFList", memberNickName, rowBounds);
	}



	




	

	



	


}