package com.kh.YellowBridge.service.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.vo.ScBoard;
import com.kh.YellowBridge.support.model.vo.FileInfo;

public interface scService {

	int getListCount();

	ArrayList<ScBoard> selectList(PageInfo pi);


	ScBoard selectBoard(int bId);

	int insertscBoard(ScBoard b, FileInfo fi);

	int deleteBoard(int scId);









}
