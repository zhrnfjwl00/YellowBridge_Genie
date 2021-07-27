package com.kh.YellowBridge.service.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.dao.qnaDAO;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Service("qnaService")
public class qnaServiceimpl implements qnaService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private qnaDAO qDAO;
	
	@Override
	public int getListCount() {
		return qDAO.getListCount(sqlSession);
	}


	@Override
	public ArrayList<QnaBoard> selectList(PageInfo pi) {
		return qDAO.selectList(sqlSession, pi);
	}
	


	


	@Override
	public QnaBoard selectBoard(int bId) {
		QnaBoard b = null;
		
		int result = qDAO.addReadCount(sqlSession, bId);
		
		if(result>0) {
			b = qDAO.selectBoard(sqlSession, bId);
		}
		
		return b;
	}


	@Override
	public int insertqnaBoard(QnaBoard b, FileInfo scfi) {
		int result = qDAO.insertqnaBoard(sqlSession,b);
		
		if(result > 0) {
			return qDAO.insertFile(sqlSession, scfi);
		}
		
		return result;
	}


	@Override
	public ScFileInfo scdetailFile(int bId) {
		return qDAO.detailFile(sqlSession, bId);
	}


	@Override
	public int deleteBoard(int bId) {
		return qDAO.deleteBoard(sqlSession, bId);
	}


	@Override
	public int updateFile(FileInfo scfi) {
		return qDAO.updateFile(sqlSession, scfi);
	}


	@Override
	public int updateBoard(QnaBoard b) {
		return qDAO.updateBoard(sqlSession, b);
	}


	@Override
	public ScFileInfo selectFile(int bId) {
		return qnaDAO.selectFile(sqlSession, bId);
	}


	@Override
	public int insertReply(Reply r) {
		return qnaDAO.insertReply(sqlSession, r);
	}


	@Override
	public ArrayList<Reply> selectReplyList(int qId) {
		return qnaDAO.selectReplyList(sqlSession, qId);
	}


	@Override
	public int servicerDelete(int rId) {
		return qDAO.servicerDelete(sqlSession, rId);
	}










	
}
