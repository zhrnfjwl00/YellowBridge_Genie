package com.kh.YellowBridge.volunteer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

@Repository("VolBoardDAO")
public class VolBoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("volunteerMapper.getListCount");
	}

	public ArrayList<VolunteerBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectList", null, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.update("volunteerMapper.addReadCount", volId);
	}
	
	public VolunteerBoard selectVolBoard(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.selectOne("volunteerMapper.selectVolBoard", volId);
	}


}
