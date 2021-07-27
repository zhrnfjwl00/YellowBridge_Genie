package com.kh.YellowBridge.service.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Repository("scDAO")
public class scDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serviceMapper.getListCount");
	}

	public ArrayList<ScBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("serviceMapper.selectList",null, rowBounds);
	}


	public int insertFile(SqlSessionTemplate sqlSession, FileInfo fi) {
		return sqlSession.insert("serviceMapper.insertFile", fi);
	}

	public int insertscBoard(SqlSessionTemplate sqlSession, ScBoard b) {
		return sqlSession.insert("serviceMapper.insertscBoard",b);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("serviceMapper.addReadCount",bId);
	}

	public ScBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("serviceMapper.selectBoard",bId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int scId) {
		return sqlSession.update("serviceMapper.deleteBoard", scId);
	}

}
