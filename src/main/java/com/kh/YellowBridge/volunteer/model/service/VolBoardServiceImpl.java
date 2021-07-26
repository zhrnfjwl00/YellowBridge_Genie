package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.volunteer.model.dao.VolBoardDAO;
import com.kh.YellowBridge.volunteer.model.vo.VolCategory;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.VolUpdateApply;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerApply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerFile;

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

	@Override
	public ArrayList<Volunteer> serviceApplyList(PageInfo pi) {
		return VolBoardDAO.serviceApplyList(sqlSession, pi);
	}

	@Override
	public Volunteer selectAppBoard(int adId) {
		return VolBoardDAO.selectAppBoard(sqlSession, adId);
	}

	@Override
	public int insertVolBoard(VolunteerBoard volb) {
		return VolBoardDAO.insertVolBoard(sqlSession, volb);
	}

	@Override
	public int insertVolFile(VolunteerFile vFile) {
		return VolBoardDAO.insertVolFile(sqlSession, vFile);
	}

	@Override
	public VolunteerFile selectVolFile(int volId) {
		return VolBoardDAO.selectVolFile(sqlSession, volId);
	}

	@Override
	public int updateVolBoard(VolunteerBoard volb) {
		return VolBoardDAO.updateVolBoard(sqlSession, volb);
	}

	@Override
	public int deleteVolFile(int boardNo) {
		return VolBoardDAO.deleteVolFile(sqlSession, boardNo);
	}

	@Override
	public int updateVolFile(VolunteerFile vF) {
		return VolBoardDAO.updateVolFile(sqlSession, vF);
	}

	@Override
	public int serviceBoardDelete(int volId) {
		return VolBoardDAO.serviceBoardDelete(sqlSession, volId);
	}

	@Override
	public int insertAppForm(VolunteerApply volApp) {
		return VolBoardDAO.insertAppForm(sqlSession, volApp);
	}

	@Override
	public VolunteerApply selectAppForm(int vAppNo) {
		return VolBoardDAO.selectAppForm(sqlSession, vAppNo);
	}

	@Override
	public int servicerDelete(int rNo) {
		return VolBoardDAO.servicerDelete(sqlSession, rNo);
	}

	@Override
	public int insertadminAd(Volunteer vol) {
		return VolBoardDAO.insertadminAd(sqlSession, vol);
	}

	@Override
	public int insertADVolFile(VolunteerFile vF) {
		return VolBoardDAO.insertADVolFile(sqlSession, vF);
	}

	@Override
	public VolunteerFile selectVolAdFile(int volId) {
		return VolBoardDAO.selectVolAdFile(sqlSession, volId);
	}

	@Override
	public int updateVolAd(Volunteer vol) {
		return VolBoardDAO.updateVolAd(sqlSession, vol);
	}

	@Override
	public int deleteVolAdFile(int fileNo) {
		return VolBoardDAO.deleteVolAdFile(sqlSession, fileNo);
	}

	@Override
	public int updateVolAdFile(VolunteerFile vF) {
		return VolBoardDAO.updateVolAdFile(sqlSession, vF);
	}

	@Override
	public int deleteAd(int serviceNo) {
		return VolBoardDAO.deleteAd(sqlSession, serviceNo);
	}

	@Override
	public ArrayList<VolunteerApply> selectApplyList(int memberNo, PageInfo pi) {
		return VolBoardDAO.selectApplyList(sqlSession, memberNo, pi);
	}
	
	@Override
	public VolunteerApply selectvApplyDetail(int vId) {
		return VolBoardDAO.selectvApplyDetail(sqlSession, vId);
	}

	@Override
	public int getApListCount(int memberNo) {
		return VolBoardDAO.getApListCount(sqlSession, memberNo);
	}

	@Override
	public VolReply selectVolReply(int volrId) {
		return VolBoardDAO.selectVolReply(sqlSession, volrId);
	}

	@Override
	public int updateVolReply(VolReply volr) {
		return VolBoardDAO.updateVolReply(sqlSession, volr);
	}

	@Override
	public int getadminSearchListCount() {
		return VolBoardDAO.getadminSearchListCount(sqlSession);
	}

	@Override
	public ArrayList<VolunteerApply> selectAdminApplyList(PageInfo pi) {
		return VolBoardDAO.selectAdminApplyList(sqlSession, pi);
	}

	@Override
	public int updateApply(VolUpdateApply va) {
		return VolBoardDAO.updateApply(sqlSession, va);
	}

	@Override
	public int insertReview(VolunteerBoard volb) {
		return VolBoardDAO.insertReview(sqlSession, volb);
	}

	@Override
	public ArrayList<VolunteerBoard> selectReviewList(PageInfo pi) {
		return VolBoardDAO.selectReviewList(sqlSession, pi);
	}

	@Override
	public VolunteerBoard reviewDetail(int volCateNo) {
		return VolBoardDAO.reviewDetail(sqlSession, volCateNo);
	}

	@Override
	public int getReviewListCount() {
		return VolBoardDAO.getReviewListCount(sqlSession);
	}

	@Override
	public int getSearchReviewResultListCount(VolSearchCondition vsc) {
		return VolBoardDAO.getSearchReviewResultListCount(sqlSession, vsc);
	}

	@Override
	public ArrayList<VolunteerBoard> selectSearchReviewResultList(VolSearchCondition vsc, PageInfo pi) {
		return VolBoardDAO.selectSearchReviewResultList(sqlSession, vsc, pi);
	}

	@Override
	public int writeReview(VolunteerBoard volb) {
		return VolBoardDAO.writeReview(sqlSession, volb);
	}

	@Override
	public int insertReviewFile(VolunteerFile vF) {
		return VolBoardDAO.insertReviewFile(sqlSession, vF);
		
	}

	@Override
	public VolCategory selectCateNo(VolCategory vc) {
		return VolBoardDAO.selectCateNo(sqlSession, vc);
	}

	@Override
	public VolunteerBoard selectReviewBoard(int volId) {
		VolunteerBoard vb = null;
		
		int result = VolBoardDAO.addReadCount(sqlSession, volId);
		
		if(result > 0) {
			vb = VolBoardDAO.selectReviewBoard(sqlSession, volId);
		}
		
		return vb;
	}

	@Override
	public VolunteerFile selectReviewFile(int volId) {
		return VolBoardDAO.selectReviewFile(sqlSession, volId);
	}

	@Override
	public int insertreviewReply(VolReply r) {
		return VolBoardDAO.insertreviewReply(sqlSession, r);
	}

	@Override
	public ArrayList<VolReply> selectReviewReplyList(int volId) {
		return VolBoardDAO.selectReviewReplyList(sqlSession, volId);
	}

	@Override
	public VolReply selectReviewReply(int rId) {
		return VolBoardDAO.selectReviewReply(sqlSession, rId);
	}

	@Override
	public int reviewrDelete(int rId) {
		return VolBoardDAO.reviewrDelete(sqlSession, rId);
	}

	@Override
	public int updateReviewReply(VolReply volr) {
		return VolBoardDAO.updateReviewReply(sqlSession, volr);
	}

	@Override
	public int updateReviewBoard(VolunteerBoard volb) {
		return VolBoardDAO.updateReviewBoard(sqlSession, volb);
	}

	@Override
	public int deleteReviewFile(int fileNo) {
		return VolBoardDAO.deleteReviewFile(sqlSession, fileNo);
	}

	@Override
	public int updateReviewFile(VolunteerFile vF) {
		return VolBoardDAO.updateReviewFile(sqlSession, vF);
	}

	@Override
	public int ReviewDelete(int volId) {
		return VolBoardDAO.ReviewDelete(sqlSession, volId);
	}

	@Override
	public int getSearchResultAdvertiseListCount(VolSearchCondition vsc) {
		return VolBoardDAO.getSearchResultAdvertiseListCount(sqlSession, vsc);
	}

	@Override
	public ArrayList<Volunteer> selectSearchResultAdvertiseList(VolSearchCondition vsc, PageInfo vpi) {
		return VolBoardDAO.selectSearchResultAdvertiseList(sqlSession, vsc, vpi);
	}

	@Override
	public int getListAdvertiseCount() {
		return VolBoardDAO.getListAdvertiseCount(sqlSession);
	}

	@Override
	public int getAdminSearchApplyResultListCount(VolSearchCondition vsc) {
		return VolBoardDAO.getAdminSearchApplyResultListCount(sqlSession, vsc);
	}

	@Override
	public ArrayList<VolunteerApply> selectAdminSearchApplyResultList(VolSearchCondition vsc, PageInfo pi) {
		return VolBoardDAO.selectAdminSearchApplyResultList(sqlSession, vsc, pi);
	}

	@Override
	public ArrayList<Volunteer> selectvList() {
		return VolBoardDAO.selectvList(sqlSession);
	}

	@Override
	public int stopAd(int serviceNo) {
		return VolBoardDAO.stopAd(sqlSession, serviceNo);
	}

	@Override
	public int continueAd(int serviceNo) {
		return VolBoardDAO.continueAd(sqlSession, serviceNo);
	}

	@Override
	public int vdeleteFile(int fileNo) {
		return VolBoardDAO.vdeleteFile(sqlSession, fileNo);
	}


	
}
