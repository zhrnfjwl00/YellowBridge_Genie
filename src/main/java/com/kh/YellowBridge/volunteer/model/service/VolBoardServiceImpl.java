package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.dao.VolBoardDAO;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
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

	@Override
	public int insertVolReply(VolReply r) {
		return VolBoardDAO.insertVolReply(sqlSession, r);
	}

	@Override
	public ArrayList<VolReply> selectReplyList(int volId) {
		return VolBoardDAO.selectReplyList(sqlSession, volId);
	}

	@Override
	public int getSearchResultListCount(VolSearchCondition vsc) {
		return VolBoardDAO.getSearchResultListCount(sqlSession, vsc);
	}

	@Override
	public ArrayList<VolunteerBoard> selectSearchResultList(VolSearchCondition vsc, PageInfo pi) {
		return VolBoardDAO.selectSearchResultList(sqlSession, vsc, pi);
	}

}
