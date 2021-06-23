package com.kh.YellowBridge.support.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.FileInfo;

public interface SupportService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b, FileInfo fi);

}
