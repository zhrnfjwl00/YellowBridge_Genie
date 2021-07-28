package com.kh.YellowBridge.free.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.free.model.vo.FrFileInfo;
import com.kh.YellowBridge.free.model.vo.Free;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Repository("fDAO")
public class FreeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("freeMapper.getListCount");
	}

	public ArrayList<Free> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		 int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 
		 return (ArrayList)sqlSession.selectList("freeMapper.selectList",null,rowBounds);
		
		
	}



	public int insertFile(SqlSessionTemplate sqlSession, FileInfo scfi) {
		return sqlSession.insert("freeMapper.insertFile", scfi);
	}

	public int insertfreeBoard(SqlSessionTemplate sqlSession, Free b) {
		return sqlSession.insert("freeMapper.insertfreeBoard",b);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("freeMapper.addReadCount",bId);
	}

	public Free selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("freeMapper.selectBoard",bId);
	}

	public FrFileInfo detailFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("freeMapper.detailFile",bId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("freeMapper.deleteBoard", bId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("freeMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("freeMapper.selectReplyList",bId);
	}
	
}
