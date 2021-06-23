package com.kh.YellowBridge.volunteer.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.volunteer.model.vo.VolunteerBoard;

public interface VolBoardService {

	int getListCount();

	ArrayList<VolunteerBoard> selectList(PageInfo pi);

	VolunteerBoard selectVolBoard(int volId);

}
