package com.kh.YellowBridge.free.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.free.model.dao.FreeDAO;
import com.kh.YellowBridge.free.model.vo.FrFileInfo;
import com.kh.YellowBridge.free.model.vo.Free;
import com.kh.YellowBridge.service.model.dao.qnaDAO;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Service("fService")
public class freeServiceImpl implements freeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FreeDAO fDAO;
	
	@Override
	public int getListCount() {
		return fDAO.getListCount(sqlSession);	
	}

	@Override
	public ArrayList<Free> selectList(PageInfo pi) {
		return fDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertfreeBoard(Free b, FileInfo scfi) {
		int result = fDAO.insertfreeBoard(sqlSession,b);
		
		if(result > 0) {
			return fDAO.insertFile(sqlSession, scfi);
		}
		
		return result;
	}

	@Override
	public Free selectBoard(int bId) {
		Free b = null;
		
		int result = fDAO.addReadCount(sqlSession, bId);
		
		if(result>0) {
			b = fDAO.selectBoard(sqlSession, bId);
		}
		
		return b;
	}

	@Override
	public FrFileInfo frdetailFile(int bId) {
		return fDAO.detailFile(sqlSession, bId);
	}

	@Override
	public int deleteBoard(int bId) {
		return fDAO.deleteBoard(sqlSession, bId);
	}

	@Override
	public int insertReply(Reply r) {
		return fDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return fDAO.selectReplyList(sqlSession, bId);
	}



}
