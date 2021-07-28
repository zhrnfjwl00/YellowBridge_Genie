package com.kh.YellowBridge.support.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;
import com.kh.YellowBridge.support.model.vo.DateSearch;
import com.kh.YellowBridge.support.model.vo.FileInfo;
import com.kh.YellowBridge.support.model.vo.PaymentInfo;
import com.kh.YellowBridge.support.model.vo.Reply;
import com.kh.YellowBridge.support.model.vo.SearchCondition;

public interface SupportService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b, FileInfo fi);
	
	Board detailBoard(int bNo);

	FileInfo detailFile(int bNo);

	int getSearchListCount(SearchCondition sc);

	ArrayList<Board> selectSearchList(SearchCondition sc, PageInfo pi);

	int addReply(Reply r);

	ArrayList<Reply> selectReplyList(int bNo);

	int updateBoard(Board b);

	int updateFile(FileInfo fi);

	int deleteBoard(int bNo);

	int deleteReply(int rId);

	int insertPaymentInfo(PaymentInfo pi);

	PaymentInfo supportPayComplete(String imp_uid);

	ArrayList<PaymentInfo> noMemPayList(PaymentInfo pi);

	ArrayList<PaymentInfo> memPayList(int memNo);

	Reply selectOneReply(int rId);

	int updateReply(Reply reply);

	/* ArrayList<PaymentInfo> searchPiList(DateSearch ds); */

	ArrayList<PaymentInfo> selectAllPi();
	
	

}
