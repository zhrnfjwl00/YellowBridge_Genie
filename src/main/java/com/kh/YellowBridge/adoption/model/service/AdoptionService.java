package com.kh.YellowBridge.adoption.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;

public interface AdoptionService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

}
