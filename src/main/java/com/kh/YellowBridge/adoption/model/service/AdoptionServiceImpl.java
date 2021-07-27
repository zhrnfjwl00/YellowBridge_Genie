package com.kh.YellowBridge.adoption.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.adoption.model.dao.AdoptionDAO;
import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.adoption.model.vo.AnimalRequest;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;

@Service("aService")
public class AdoptionServiceImpl implements AdoptionService {

	// 의존성주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private AdoptionDAO aDAO;

	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	// 입양공고 리스트 카운트
	@Override
	public int getAnimalListCount() {
		return aDAO.getAnimalListCount(sqlSession);
	}

	// 사용자_입양공고 리스트 조회
	@Override
	public ArrayList<AnimalInfo> selectAnimalList(PageInfo pi) {
		return aDAO.selectAnimalList(sqlSession, pi);
	}
	
	// 관리자_입양공고 리스트 조회
	@Override
	public ArrayList<AnimalInfo> admin_selectAnimalList(PageInfo pi) {
		return aDAO.admin_selectAnimalList(sqlSession, pi);
	}

	// 관리자_입양공고 등록
	@Override
	public int insertAnimal(AnimalInfo a, AdoptionFile af) {
		int result = aDAO.insertAnimal(sqlSession, a);

		if (result > 0) {
			return aDAO.insertAnimalFile(sqlSession, af);
		}
		return result;
	}

	// 입양일지-Board
	@Override
	public ArrayList<AdoptionBoard> selectList(PageInfo pi) {
		return aDAO.selectList(sqlSession, pi);
	}

	@Override
	public AdoptionBoard selectAdopBoard(int adopId) {
		AdoptionBoard ab = null;
		int result = aDAO.addReadCount(sqlSession, adopId);

		if (result > 0) {
			ab = aDAO.selectAdopBoard(sqlSession, adopId);
		}
		return ab;

	}

	@Override
	public AdoptionFile selectAdopFile(int adopId) {
		return aDAO.selectAdopFile(sqlSession, adopId);
	}

	// 입양일지 게시물 추가
	@Override
	public int insertAdopBoard(AdoptionBoard a) {
		return aDAO.insertAdopBoard(sqlSession, a);

//		if (result > 0) {
//			return aDAO.insertAnimalFile(sqlSession, af);
//		}
//		return result;
	}
	
	@Override
	public int insertAdopFile(AdoptionFile affi) {
		return aDAO.insertAdopFile(sqlSession, affi);
	}

	// 입양일지 게시물 삭제
	@Override
	public int deleteAdopBoard(int adopId) {
		return aDAO.deleteAdopBoard(sqlSession, adopId);
	}

	// 댓글등록
	@Override
	public int insertReply(AdoptionReply r) {
		return aDAO.insertReply(sqlSession, r);
	}

	// 댓글 리스트 조회
	@Override
	public ArrayList<AdoptionReply> selectReplyList(int adopId) {
		return aDAO.selectReplyList(sqlSession, adopId);
	}

	@Override
	public AdoptionFile selectAnimalFile(int animalNo) {
		return aDAO.selectAnimalFile(sqlSession, animalNo);
	}

	@Override
	public AnimalInfo selectAnimal(int animalNo) {
		return aDAO.selectAnimal(sqlSession, animalNo);
	}

	// 입양신청서 폼 정보
	@Override
	public AnimalInfo selectApplyAnimal(int animalNo) {
		return aDAO.selectApplyAnimal(sqlSession, animalNo);
	}

	

	@Override
	public AnimalRequest selectAppForm(int memberNo) {
		return aDAO.selectAppForm(sqlSession, memberNo);
	}

	@Override
	public int getRequestListCount(int memberNo) {
		return aDAO.getAnimalListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<AnimalRequest> selectRequestList(int memberNo) {
		return aDAO.selectRequestList(sqlSession, memberNo);
	}

	@Override
	public Member selectMember(int memberNo) {
		return aDAO.selectMember(sqlSession, memberNo);
	}

	@Override
	public ArrayList<AnimalInfo> selectAList() {
		return aDAO.selectAlist(sqlSession);
	}

	@Override
	public int deleteAnimalNotice(Integer animalNo) {
		return aDAO.deleteAnimalNotice(sqlSession, animalNo);
	}

	@Override
	public int insertAppForm(AnimalRequest ar, int animalNo) {
		int result = aDAO.insertAppForm(sqlSession, ar);
		
		if(result > 0) {
			 aDAO.updateAnimalStatus(sqlSession, animalNo);
		}
		return result;
	}

	@Override
	public AdoptionReply selectAdopReply(int rId) {
		return aDAO.selectAdopReply(sqlSession, rId);
	}

	@Override
	public int updateAdopReply(AdoptionReply adopr) {
		return aDAO.updateAdopReply(sqlSession, adopr);
	}

	@Override
	public int adoptionrDelete(int rId) {
		return aDAO.adoptionrDelete(sqlSession, rId);
	}

	// 입양일지 수정
	@Override
	public int updateRecodeBoard(AdoptionBoard adopboard) {
		return aDAO.updateRecodeBoard(sqlSession, adopboard);
	}


	@Override
	public int deleteAdopFile(int fileNo) {
		return aDAO.deleteAdopFile(sqlSession, fileNo);
	}

	@Override
	public int updateAdopFile(AdoptionFile aF) {
		return aDAO.updateAdopFile(sqlSession, aF);
	}

	// 입양일지 수정 중 첨부파일 삭제
	@Override
	public int aDeleteAdopFile(int fileNo) {
		return aDAO.deleteAdopFile(sqlSession, fileNo);
	}

	@Override
	public int changeRequestState(AnimalRequest a) {
		return aDAO.changeRequestState(sqlSession, a);
	}

	@Override
	public int getAdminRequestListCount() {
		return aDAO.getAdminRequestListCount(sqlSession);
	}

	@Override
	public ArrayList<AnimalRequest> admin_selectRequestList(PageInfo pi) {
		return aDAO.admin_selectRequestList(sqlSession, pi);
	}

	@Override
	public ArrayList<AdoptionBoard> selectDiaryList() {
		return aDAO.selectDiaryList(sqlSession);
	}

	
}
