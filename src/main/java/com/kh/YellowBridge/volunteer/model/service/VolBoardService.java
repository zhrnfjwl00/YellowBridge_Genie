package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.VolUpdateApply;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerApply;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerFile;

public interface VolBoardService {

	int getListCount();

	ArrayList<VolunteerBoard> selectList(PageInfo pi);

	VolunteerBoard selectVolBoard(int volId);

	int insertVolReply(VolReply r);

	ArrayList<VolReply> selectReplyList(int volId);

	int getSearchResultListCount(VolSearchCondition vsc);

	ArrayList<VolunteerBoard> selectSearchResultList(VolSearchCondition vsc, PageInfo pi);

	ArrayList<Volunteer> serviceApplyList(PageInfo pi);

	Volunteer selectAppBoard(int adId);

	int insertVolBoard(VolunteerBoard volb);

	int insertVolFile(VolunteerFile vFile);

	VolunteerFile selectVolFile(int volId);

	int updateVolBoard(VolunteerBoard volb);

	int deleteVolFile(int boardNo);

	int updateVolFile(VolunteerFile vF);

	int serviceBoardDelete(int volId);

	int insertAppForm(VolunteerApply volApp);

	VolunteerApply selectAppForm(int vAppNo);

	int servicerDelete(int rNo);

	int insertadminAd(Volunteer vol);

	int insertADVolFile(VolunteerFile vF);

	VolunteerFile selectVolAdFile(int volId);

	int updateVolAd(Volunteer vol);

	int deleteVolAdFile(int fileNo);

	int updateVolAdFile(VolunteerFile vF);

	int deleteAd(int serviceNo);

	ArrayList<VolunteerApply> selectApplyList(int memberNo, PageInfo pi);

	VolunteerApply selectvApplyDetail(int vId);

	int getApListCount(int memberNo);

	VolReply selectVolReply(int rId);

	int updateVolReply(VolReply volr);

	int getadminSearchListCount();

	ArrayList<VolunteerApply> selectAdminApplyList(PageInfo pi);

	int updateApply(VolUpdateApply va);


	
}
