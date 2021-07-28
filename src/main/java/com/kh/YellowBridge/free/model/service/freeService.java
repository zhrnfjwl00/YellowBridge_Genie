package com.kh.YellowBridge.free.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.free.model.vo.FrFileInfo;
import com.kh.YellowBridge.free.model.vo.Free;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.vo.FileInfo;

public interface freeService {

	int getListCount();

	ArrayList<Free> selectList(PageInfo pi);

	int insertfreeBoard(Free b, FileInfo scfi);

	Free selectBoard(int bId);

	FrFileInfo frdetailFile(int bId);

	int deleteBoard(int bId);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int bId);




}
