package com.kh.YellowBridge.support.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.dao.SupportDAO;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.support.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.SearchCondition;

@Service("sService")
public class SupportImpl implements SupportService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private SupportDAO sDAO;
	
	@Override
	public int getListCount() {
		return sDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return sDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b, FileInfo fi) {
		int result = sDAO.insertBoard(sqlSession,b);
		
		if(result > 0) {
			return sDAO.insertFile(sqlSession, fi);
		}
		
		return result;
	}
	
	@Override
	public Board detailBoard(int bNo) {
		Board b = null;
		int result = sDAO.updateView(sqlSession, bNo);
		
		if(result > 0) {
			b = sDAO.detailBoard(sqlSession, bNo);
		}
		
		return b;
	}

	@Override
	public FileInfo detailFile(int bNo) {
		return sDAO.detailFile(sqlSession, bNo);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		
		return sDAO.getSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Board> selectSearchList(SearchCondition sc, PageInfo pi) {
		
		return sDAO.selectSearchList(sqlSession, sc, pi);
	}

	@Override
	public int addReply(Reply r) {
		return sDAO.addReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bNo) {
		return sDAO.selectReplyList(sqlSession, bNo);
	}

	@Override
	public int updateBoard(Board b) {
		return sDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int updateFile(FileInfo fi) {
		return sDAO.updateFile(sqlSession, fi);

	}

	@Override
	public int deleteBoard(int bNo) {
		return sDAO.deleteBoard(sqlSession, bNo);
	}

	@Override
	public int deleteReply(int rId) {
		return sDAO.deleteReply(sqlSession, rId);
	}
	
}
