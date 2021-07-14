package com.kh.YellowBridge.adoption.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.common.PageInfo;

@Repository("aDAO")
public class AdoptionDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adoptionMapper.getListCount");
	}

	public ArrayList<AdoptionBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		//페이징처리
		//마이바티스를 사용하니 RowBounds 사용가능 
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adoptionMapper.selectList", null, rowBounds);
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
		return (ArrayList)sqlSession.selectList("adoptionMapper.selectReplyList", adopId);
	}

	// 입양공고 게시물 카운트
	public int getAnimalListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adoptionMapper.getAnimalListCount");
	}

	// 입양공고 게시물 리스트
	public ArrayList<AnimalInfo> selectAnimalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adoptionMapper.selectAnimalList", null, rowBounds);
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
			return (ArrayList)sqlSession.selectOne("adoptionMapper.selectAnimalApplyForm");
		}

		public AnimalInfo selectAnimal(SqlSessionTemplate sqlSession, int animalNo) {
			return sqlSession.selectOne("adoptionMapper.selectAnimalApplyForm", animalNo);
		}
	






}
