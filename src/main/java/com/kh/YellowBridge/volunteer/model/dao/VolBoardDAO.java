package com.kh.YellowBridge.volunteer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.volunteer.model.vo.VolCategory;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.VolUpdateApply;
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

	public int servicerDelete(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("volunteerMapper.servicerDelete", rNo);
	}

	public int insertadminAd(SqlSessionTemplate sqlSession, Volunteer vol) {
		return sqlSession.insert("volunteerMapper.insertadminAd", vol);
	}

	public int insertADVolFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		return sqlSession.insert("volunteerMapper.insertADVolFile", vF);
	}

	public VolunteerFile selectVolAdFile(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.selectOne("volunteerMapper.selectVolAdFile", volId);
	}

	public int updateVolAd(SqlSessionTemplate sqlSession, Volunteer vol) {
		return sqlSession.update("volunteerMapper.updateVolAd", vol);
	}

	public int deleteVolAdFile(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.update("volunteerMapper.deleteVolAdFile", fileNo);
	}

	public int updateVolAdFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		return sqlSession.insert("volunteerMapper.updateVolAdFile", vF);
	}

	public int deleteAd(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("volunteerMapper.deleteAd", serviceNo);
	}

	public ArrayList<VolunteerApply> selectApplyList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println("DAO writer : " + memberNo);
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectApplyList", memberNo, rowBounds);
	}

	public VolunteerApply selectvApplyDetail(SqlSessionTemplate sqlSession, int vId) {
		return sqlSession.selectOne("volunteerMapper.selectvApplyDetail", vId);
	}

	public int getApListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("volunteerMapper.getApListCount", memberNo);
	}

	public VolReply selectVolReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.selectOne("volunteerMapper.selectVolReply", rId);
	}

	public int updateVolReply(SqlSessionTemplate sqlSession, VolReply volr) {
		return sqlSession.update("volunteerMapper.updateVolReply", volr);
	}

	public int getadminSearchListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("volunteerMapper.getadminSearchListCount");
	}

	public ArrayList<VolunteerApply> selectAdminApplyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectAdminApplyList", null, rowBounds);
	}

	public int updateApply(SqlSessionTemplate sqlSession, VolUpdateApply va) {
		return sqlSession.update("volunteerMapper.updateApply", va);
	}

	public int insertReview(SqlSessionTemplate sqlSession, VolunteerBoard volb) {
		return sqlSession.insert("volunteerMapper.insertReview", volb);
	}

	public VolunteerBoard reviewDetail(SqlSessionTemplate sqlSession, int volCateNo) {
		return sqlSession.selectOne("volunteerMapper.reviewDetail", volCateNo);
	}

	public ArrayList<VolunteerBoard> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectReviewList", null, rowBounds);
	}

	public int getReviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("volunteerMapper.getReviewListCount");
	}

	public int getSearchReviewResultListCount(SqlSessionTemplate sqlSession, VolSearchCondition vsc) {
		return sqlSession.selectOne("volunteerMapper.getSearchReviewResultListCount", vsc);
	}

	public ArrayList<VolunteerBoard> selectSearchReviewResultList(SqlSessionTemplate sqlSession, VolSearchCondition vsc,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectSearchReviewResultList", vsc, rowBounds);
	}

	public int writeReview(SqlSessionTemplate sqlSession, VolunteerBoard volb) {
		return sqlSession.insert("volunteerMapper.writeReview", volb);
	}

	public int insertReviewFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		return sqlSession.insert("volunteerMapper.insertReviewFile", vF);
	}

	public VolCategory selectCateNo(SqlSessionTemplate sqlSession, VolCategory vc) {
		return sqlSession.selectOne("volunteerMapper.selectCateNo", vc);
	}

	public VolunteerBoard selectReviewBoard(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.selectOne("volunteerMapper.selectReviewBoard", volId);
	}

	public VolunteerFile selectReviewFile(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.selectOne("volunteerMapper.selectReviewFile", volId);
	}

	public int insertreviewReply(SqlSessionTemplate sqlSession, VolReply r) {
		return sqlSession.insert("volunteerMapper.insertreviewReply", r);
	}

	public ArrayList<VolReply> selectReviewReplyList(SqlSessionTemplate sqlSession, int volId) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectReviewReplyList", volId);
	}

	public VolReply selectReviewReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.selectOne("volunteerMapper.selectReviewReply", rId);
	}

	public int reviewrDelete(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("volunteerMapper.reviewrDelete", rId);
	}

	public int updateReviewReply(SqlSessionTemplate sqlSession, VolReply volr) {
		return sqlSession.update("volunteerMapper.updateReviewReply", volr);
	}

	public int updateReviewBoard(SqlSessionTemplate sqlSession, VolunteerBoard volb) {
		return sqlSession.update("volunteerMapper.updateReviewBoard", volb);
	}

	public int deleteReviewFile(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.update("volunteerMapper.deleteReviewFile", fileNo);
	}

	public int updateReviewFile(SqlSessionTemplate sqlSession, VolunteerFile vF) {
		return sqlSession.insert("volunteerMapper.updateReviewFile", vF);
	}

	public int ReviewDelete(SqlSessionTemplate sqlSession, int volId) {
		return sqlSession.update("volunteerMapper.ReviewDelete", volId);
	}

	public int getSearchResultAdvertiseListCount(SqlSessionTemplate sqlSession, VolSearchCondition vsc) {
		return sqlSession.selectOne("volunteerMapper.getSearchResultAdvertiseListCount", vsc);
	}

	public ArrayList<Volunteer> selectSearchResultAdvertiseList(SqlSessionTemplate sqlSession,
			VolSearchCondition vsc, PageInfo vpi) {
		int offset = (vpi.getCurrentPage() - 1) * vpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, vpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectSearchResultAdvertiseList", vsc, rowBounds);
	}

	public int getListAdvertiseCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("volunteerMapper.getListAdvertiseCount");
	}

	public int getAdminSearchApplyResultListCount(SqlSessionTemplate sqlSession, VolSearchCondition vsc) {
		return sqlSession.selectOne("volunteerMapper.getAdminSearchApplyResultListCount", vsc);
	}

	public ArrayList<VolunteerApply> selectAdminSearchApplyResultList(SqlSessionTemplate sqlSession,
			VolSearchCondition vsc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectAdminSearchApplyResultList", vsc, rowBounds);
	}
	
	public ArrayList<Volunteer> selectvList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("volunteerMapper.selectvList");
	}

	public int stopAd(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("volunteerMapper.stopAd", serviceNo);
	}

	public int continueAd(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("volunteerMapper.continueAd", serviceNo);
	}
	
	public int vdeleteFile(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.update("volunteerMapper.vdeleteFile", fileNo);
	}
	
}
