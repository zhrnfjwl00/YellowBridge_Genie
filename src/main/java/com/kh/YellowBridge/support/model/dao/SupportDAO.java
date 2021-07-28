package com.kh.YellowBridge.support.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.DateSearch;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.support.model.vo.PaymentInfo;
import com.kh.YellowBridge.support.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.SearchCondition;

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

	public int getSearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("supportMapper.getSearchListCount", sc);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("supportMapper.selectSearchList", sc, rowBounds);
	}

	public int addReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("supportMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("supportMapper.selectReplyList", bNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("supportMapper.updateBoard", b);
	}

	public int updateFile(SqlSessionTemplate sqlSession, FileInfo fi) {
		return sqlSession.update("supportMapper.updateFile", fi);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("supportMapper.deleteBoard", bNo);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("supportMapper.deleteReply", rId);
	}

	public int insertPaymentInfo(SqlSessionTemplate sqlSession, PaymentInfo pi) {
		
		return sqlSession.insert("supportMapper.insertPaymentInfo", pi);
	}

	public PaymentInfo supportPayComplete(SqlSessionTemplate sqlSession, String imp_uid) {
		return sqlSession.selectOne("supportMapper.resultPaymentComplete", imp_uid);
	}

	public ArrayList<PaymentInfo> noMemPayList(SqlSessionTemplate sqlSession, PaymentInfo pi) {
		return (ArrayList)sqlSession.selectList("supportMapper.noMemResultList", pi);
	}

	public ArrayList<PaymentInfo> memPayList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("supportMapper.memResultList", memNo);
	}

	public Reply selectOneReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.selectOne("supportMapper.selectOneReply", rId);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.update("supportMapper.updateReply", reply);
	}

	/*
	 * public ArrayList<PaymentInfo> searchPiList(SqlSessionTemplate sqlSession,
	 * DateSearch ds) { return
	 * (ArrayList)sqlSession.selectList("supportMapper.searchPiList", ds); }
	 */

	public ArrayList<PaymentInfo> selectAllPi(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("supportMapper.selectAllPi");
	}


}
