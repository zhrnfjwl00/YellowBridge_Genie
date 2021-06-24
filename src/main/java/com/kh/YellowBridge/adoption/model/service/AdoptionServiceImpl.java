package com.kh.YellowBridge.adoption.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.adoption.model.dao.AdoptionDAO;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;

@Service("aService")
public class AdoptionServiceImpl implements AdoptionService{
	
	//의존성주입 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdoptionDAO aDAO;
	

	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	//입양일지-Board 
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return aDAO.selectList(sqlSession, pi);
	}

}
