package com.kh.YellowBridge.service.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.service.model.vo.QnaBoard;
import com.kh.YellowBridge.service.model.vo.Reply;
import com.kh.YellowBridge.service.model.vo.ScFileInfo;
import com.kh.YellowBridge.support.model.vo.FileInfo;

public interface qnaService {

	int getListCount();

	ArrayList<QnaBoard> selectList(PageInfo pi);

	int insertqnaBoard(QnaBoard b, FileInfo scfi);

	QnaBoard selectBoard(int bId);

	ScFileInfo scdetailFile(int bId);

	int deleteBoard(int bId);
	
	ScFileInfo selectFile(int bId);




	int updateFile(FileInfo scfi);

	int updateBoard(QnaBoard b);

	int insertReply(Reply r);


	ArrayList<Reply> selectReplyList(int qId);

	int servicerDelete(int rId);


















}
