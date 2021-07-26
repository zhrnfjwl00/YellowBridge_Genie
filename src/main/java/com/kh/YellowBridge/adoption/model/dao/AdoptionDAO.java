package com.kh.YellowBridge.adoption.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.adoption.model.vo.AnimalRequest;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;

@Repository("aDAO")
public class AdoptionDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adoptionMapper.getListCount");
	}

	public ArrayList<AdoptionBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 페이징처리
		// 마이바티스를 사용하니 RowBounds 사용가능

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adoptionMapper.selectList", null, rowBounds);
	}

	public static int addReadCount(SqlSessionTemplate sqlSession, int adopId) {
		return sqlSession.update("adoptionMapper.addReadCount", adopId);
	}

	public static AdoptionBoard selectAdopBoard(SqlSessionTemplate sqlSession, int adopId) {
		return sqlSession.selectOne("adoptionMapper.selectAdopBoard", adopId);
	}

	public AdoptionFile selectAdopFile(SqlSessionTemplate sqlSession, int adopId) {
		return sqlSession.selectOne("adoptionMapper.selectAdopFile", adopId);
	}

	// 입양일지 게시글 추가
	public int insertAdopBoard(SqlSessionTemplate sqlSession, AdoptionBoard a) {
		return sqlSession.insert("adoptionMapper.insertAdopBoard", a);
	}

	// 입양일지 파일 추가
	public int insertFile(SqlSessionTemplate sqlSession, AdoptionFile af) {
		return sqlSession.insert("adoptionMapper.insertAdopFile", af);
	}

	public int deleteAdopBoard(SqlSessionTemplate sqlSession, int adopId) {
		return sqlSession.update("adoptionMapper.deleteAdopBoard", adopId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, AdoptionReply r) {
		return sqlSession.insert("adoptionMapper.insertReply", r);
	}

	public ArrayList<AdoptionReply> selectReplyList(SqlSessionTemplate sqlSession, int adopId) {
		return (ArrayList) sqlSession.selectList("adoptionMapper.selectReplyList", adopId);
	}

	// 입양공고 게시물 카운트
	public int getAnimalListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adoptionMapper.getAnimalListCount");
	}

	// 사용자_입양공고 게시물 리스트
	public ArrayList<AnimalInfo> selectAnimalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adoptionMapper.selectAnimalList", null, rowBounds);
	}
	
	// 관리자_입양공고 게시물 리스트
	public ArrayList<AnimalInfo> admin_selectAnimalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adoptionMapper.selectAdopFile", null, rowBounds);
	}

	// 입양 공고 등록
	public int insertAnimal(SqlSessionTemplate sqlSession, AnimalInfo a) {
		return sqlSession.insert("adoptionMapper.insertAnimalNotice", a);
	}

	// 입양일지 파일 추가
	public int insertAnimalFile(SqlSessionTemplate sqlSession, AdoptionFile af) {
		return sqlSession.insert("adoptionMapper.insertAnimalFile", af);
	}

	public AdoptionFile selectAnimalFile(SqlSessionTemplate sqlSession, int animalNo) {
		return sqlSession.selectOne("adoptionMapper.selectAnimalFile", animalNo);
	}

	public ArrayList<AnimalInfo> selectAnimalList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectOne("adoptionMapper.selectAnimalApplyForm");
	}

	public AnimalInfo selectAnimal(SqlSessionTemplate sqlSession, int animalNo) {
		return sqlSession.selectOne("adoptionMapper.selectAnimalApplyForm", animalNo);
	}

	// 입양신청서 폼 정보
	public AnimalInfo selectApplyAnimal(SqlSessionTemplate sqlSession, int animalNo) {
		return sqlSession.selectOne("adoptionMapper.selectAnimalApplyForm", animalNo);
	}

	public AnimalRequest selectAppForm(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("adoptionMapper.selectAppForm", memberNo);

	}

	public int insertAppForm(SqlSessionTemplate sqlSession, AnimalRequest ar) {
		return sqlSession.insert("adoptionMapper.insertAppForm", ar);
	}

	public ArrayList<AnimalRequest> selectRequestList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("adoptionMapper.selectRequestList", memberNo, rowBounds);
	}

	public int getAnimalListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("adoptionMapper.getRequestListCount", memberNo);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("adoptionMapper.selectMember", memberNo);
	}

	public ArrayList<AnimalInfo> selectAlist(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("adoptionMapper.selectAlist");
	}
//
//	public Object deleteAnimalNotice(SqlSessionTemplate sqlSession, String no) {
//		return sqlSession.update("adoptionMapper.deleteAnimalNotice", no);
//	}

	public int deleteAnimalNotice(SqlSessionTemplate sqlSession, Integer animalNo) {
		return sqlSession.update("adoptionMapper.deleteAnimalNotice", animalNo);
	}

	public int updateAnimalStatus(SqlSessionTemplate sqlSession, int animalNo) {
		return sqlSession.update("adoptionMapper.deleteAnimalNotice", animalNo);
		
	}

	public AdoptionReply selectAdopReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.selectOne("adoptionMapper.selectAdopReply", rId);
	}

	public int updateAdopReply(SqlSessionTemplate sqlSession, AdoptionReply adopr) {
		return sqlSession.update("adoptionMapper.updateAdopReply", adopr);
	}

	public int adoptionrDelete(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("adoptionMapper.adoptionrDelete", rId);
	}

	public int insertAdopFile(SqlSessionTemplate sqlSession, AdoptionFile affi) {
		return sqlSession.insert("adoptionMapper.insertAdopFile", affi);
	}

	public int updateRecodeBoard(SqlSessionTemplate sqlSession, AdoptionBoard adopboard) {
		return sqlSession.update("adoptionMapper.updateRecodeBoard", adopboard);
	}

	public int deleteAdopFile(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.update("adoptionMapper.deleteAdopFile", fileNo);
	}

	public int updateAdopFile(SqlSessionTemplate sqlSession, AdoptionFile aF) {
		return sqlSession.insert("adoptionMapper.updateAdopFile", aF);
	}
}
