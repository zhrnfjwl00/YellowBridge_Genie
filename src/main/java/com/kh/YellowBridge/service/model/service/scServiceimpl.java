package com.kh.YellowBridge.service.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.dao.scDAO;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.support.model.vo.FileInfo;

@Service("scService")
public class scServiceimpl implements scService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private scDAO scDAO;
	
	@Override
	public int getListCount() {
		return scDAO.getListCount(sqlSession);
	}


	@Override
	public ArrayList<ScBoard> selectList(PageInfo pi) {
		return scDAO.selectList(sqlSession, pi);
	}




	@Override
	public ScBoard selectBoard(int bId) {
		ScBoard b = null;
		
		int result = scDAO.addReadCount(sqlSession, bId);
		
		if(result>0) {
			b = scDAO.selectBoard(sqlSession, bId);
		}
		
		return b;
	}


	@Override
	public int insertscBoard(ScBoard b, FileInfo fi) {
		int result = scDAO.insertscBoard(sqlSession,b);
		
		if(result > 0) {
			return scDAO.insertFile(sqlSession, fi);
		}
		
		return result;
	}


	@Override
	public int deleteBoard(int scId) {
		return scDAO.deleteBoard(sqlSession, scId);
	}





	
}
