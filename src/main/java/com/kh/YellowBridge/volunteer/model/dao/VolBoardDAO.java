package com.kh.YellowBridge.volunteer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
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

	public int insertVolReply(SqlSessionTemplate sqlSession, VolReply r) {
		return sqlSession.insert("volunteerMapper.insertVolReply", r);
	}

	public ArrayList<VolReply> selectReplyList(SqlSessionTemplate sqlSession, int volId) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectReplyList", volId);
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, VolSearchCondition vsc) {
		return sqlSession.selectOne("volunteerMapper.getSearchResultListCount", vsc);
	}

	public ArrayList<VolunteerBoard> selectSearchResultList(SqlSessionTemplate sqlSession, VolSearchCondition vsc,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectSearchResultList", vsc, rowBounds);
	}


}
