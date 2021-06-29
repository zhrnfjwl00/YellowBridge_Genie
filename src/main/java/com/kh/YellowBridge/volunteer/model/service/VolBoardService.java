package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolReply;
import com.kh.YellowBridge.volunteer.model.vo.VolSearchCondition;
import com.kh.YellowBridge.volunteer.model.vo.Volunteer;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

public interface VolBoardService {

	int getListCount();

	ArrayList<VolunteerBoard> selectList(PageInfo pi);

	VolunteerBoard selectVolBoard(int volId);

	int insertVolReply(VolReply r);

	ArrayList<VolReply> selectReplyList(int volId);

	int getSearchResultListCount(VolSearchCondition vsc);

	ArrayList<VolunteerBoard> selectSearchResultList(VolSearchCondition vsc, PageInfo pi);

	ArrayList<Volunteer> serviceApplyList(PageInfo pi);

}
