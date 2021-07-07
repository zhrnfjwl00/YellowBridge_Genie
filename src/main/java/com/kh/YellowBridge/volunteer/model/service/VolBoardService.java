package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
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

	
}
