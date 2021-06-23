package com.kh.YellowBridge.support.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.dao.SupportDAO;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.FileInfo;

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
	
}
