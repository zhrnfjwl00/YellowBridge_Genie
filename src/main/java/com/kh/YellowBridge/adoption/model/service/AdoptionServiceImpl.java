package com.kh.YellowBridge.adoption.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.adoption.model.dao.AdoptionDAO;
import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AdoptionSearchCondition;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

@Service("aService")
public class AdoptionServiceImpl implements AdoptionService{
	
	//의존성주입 
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

	// 입양공고 리스트 조회
	@Override
	public ArrayList<AnimalInfo> selectAnimalList(PageInfo pi) {
		return aDAO.selectAnimalList(sqlSession, pi);
	}

	// 입양공고 등록 
	@Override
	public int insertAnimal(AnimalInfo a, AdoptionFile af) {
		int result = aDAO.insertAnimal(sqlSession, a);
		
		if(result > 0) {
			return aDAO.insertAnimalFile(sqlSession, af);
		}
		return result;
	}
	
	
	
	//입양일지-Board 
	@Override
	public ArrayList<AdoptionBoard> selectList(PageInfo pi) {
		return aDAO.selectList(sqlSession, pi);
	}

	@Override
	public AdoptionBoard selectAdopBoard(int adopId) {
		AdoptionBoard ab = null;
		int result = aDAO.addReadCount(sqlSession, adopId);
		
		if(result > 0) {
			ab = aDAO.selectAdopBoard(sqlSession, adopId);
		}
		return ab;
		
	}
	@Override
	public AdoptionFile selectAdopFile(int adopId) {
		return aDAO.selectAdopFile(sqlSession, adopId);
	}

	
	//입양일지 게시물 추가
	@Override
	public int insertAdopBoard(AdoptionBoard a, AdoptionFile af) {
		int result = aDAO.insertAdopBoard(sqlSession, a);
		
		if(result > 0) {
			return aDAO.insertAnimalFile(sqlSession, af);
		}
		return result;
	}
	
	//입양일지 게시물 삭제
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





    






	
}
