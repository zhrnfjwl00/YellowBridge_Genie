package com.kh.YellowBridge.service.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Repository("qnaDAO")
public class qnaDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}

	public ArrayList<QnaBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",null, rowBounds);
	}

	
	public int insertqnaBoard(SqlSessionTemplate sqlSession, QnaBoard b) {
		return sqlSession.insert("qnaMapper.insertqnaBoard",b);
	}

	public int insertFile(SqlSessionTemplate sqlSession, FileInfo scfi) {
		return sqlSession.insert("qnaMapper.insertFile", scfi);
	}


	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("qnaMapper.addReadCount",bId);
	}

	public QnaBoard selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("qnaMapper.selectBoard",bId);
	}

	public ScFileInfo detailFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("qnaMapper.detailFile",bId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("qnaMapper.deleteBoard", bId);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, QnaBoard b) {
		return sqlSession.update("qnaMapper.updateBoard", b);
	}

	public int updateFile(SqlSessionTemplate sqlSession, FileInfo scfi) {
		return sqlSession.update("qnaMapper.updateFile", scfi);
	}

	public static ScFileInfo selectFile(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("qnaMapper.selectFile", bId);
	}

	public static int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("qnaMapper.insertReply", r);
	}

	public static ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int qId) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectReplyList",qId);
	}

	public int servicerDelete(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("qnaMapper.servicerDelete", rId);
	}



}
