package com.kh.YellowBridge.volunteer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerApply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerFile;

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

	public ArrayList<Volunteer> serviceApplyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.serviceApplyList", null, rowBounds);
	}

	public Volunteer selectAppBoard(SqlSessionTemplate sqlSession, int adId) {
		return sqlSession.selectOne("volunteerMapper.selectAppBoard", adId);
	}

	public int insertVolBoard(SqlSessionTemplate sqlSession, VolunteerBoard volb) {
		return sqlSession.insert("volunteerMapper.insertVolBoard", volb);
	}

	public int insertVolFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		return sqlSession.insert("volunteerMapper.insertVolFile", vF);
	}

	public VolunteerFile selectVolFile(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.selectOne("volunteerMapper.selectVolFile", volId);
	}

	public int updateVolBoard(SqlSessionTemplate sqlSession, VolunteerBoard volb) {
		return sqlSession.update("volunteerMapper.updateVolBoard", volb);
	}

	public int deleteVolFile(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("volunteerMapper.deleteVolFile", boardNo);
	}

	public int updateVolFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		System.out.println(" DAO 넘어옴");
		return sqlSession.insert("volunteerMapper.updateVolFile", vF);
	}

	public int serviceBoardDelete(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.update("volunteerMapper.deleteVolBoard", volId);
	}

	public int insertAppForm(SqlSessionTemplate sqlSession, VolunteerApply volApp) {
		return sqlSession.insert("volunteerMapper.insertAppForm", volApp);
	}

	public VolunteerApply selectAppForm(SqlSessionTemplate sqlSession, int vAppNo) {
		return sqlSession.selectOne("volunteerMapper.selectAppForm", vAppNo);
	}



}
