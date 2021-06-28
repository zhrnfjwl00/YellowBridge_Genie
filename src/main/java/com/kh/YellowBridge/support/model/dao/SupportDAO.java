package com.kh.YellowBridge.support.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Repository("sDAO")
public class SupportDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return  sqlSession.selectOne("supportMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("supportMapper.selectList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("supportMapper.insertBoard", b);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, FileInfo fi) {
		return sqlSession.insert("supportMapper.insertFile", fi);
	}
	
	public int updateView(SqlSessionTemplate sqlSession, int bNo) {
		
		return sqlSession.update("supportMapper.updateView", bNo);
	}

	public Board detailBoard(SqlSessionTemplate sqlSession, int bNo) {
		
		return sqlSession.selectOne("supportMapper.detailBoard", bNo);
	}

	public FileInfo detailFile(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("supportMapper.detailFile", bNo);
	}


}
