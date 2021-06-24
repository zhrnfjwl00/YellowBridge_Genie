package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.dao.VolBoardDAO;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

@Service("volBoardService")
public class VolBoardServiceImpl implements VolBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VolBoardDAO VolBoardDAO;
	
	
	@Override
	public int getListCount() {
		return VolBoardDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<VolunteerBoard> selectList(PageInfo pi) {
		return VolBoardDAO.selectList(sqlSession, pi);
	}

	@Override
	public VolunteerBoard selectVolBoard(int volId) {
		VolunteerBoard vb = null;
		
		int result = VolBoardDAO.addReadCount(sqlSession, volId);
		
		if(result > 0) {
			vb = VolBoardDAO.selectVolBoard(sqlSession, volId);
		}
		
		return vb;
	}

}
