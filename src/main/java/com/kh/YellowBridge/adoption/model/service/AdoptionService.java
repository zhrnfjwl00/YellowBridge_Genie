package com.kh.YellowBridge.adoption.model.service;

import java.util.ArrayList;

import com.kh.YellowBridge.adoption.model.vo.AdoptionBoard;
import com.kh.YellowBridge.adoption.model.vo.AdoptionFile;
import com.kh.YellowBridge.adoption.model.vo.AdoptionReply;
import com.kh.YellowBridge.adoption.model.vo.AnimalInfo;
import com.kh.YellowBridge.adoption.model.vo.AnimalRequest;
import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.member.model.vo.Member;

public interface AdoptionService {

	int getListCount();

	ArrayList<AdoptionBoard> selectList(PageInfo pi);

	AdoptionBoard selectAdopBoard(int adopId);

	// 입양공고 게시물 카운트
	int getAnimalListCount();

	// 입양공고 게시물 리스트
	ArrayList<AnimalInfo> selectAnimalList(PageInfo pi);
	
	// 입양일지 등록 
	int insertAdopBoard(AdoptionBoard a);

	int insertAdopFile(AdoptionFile affi);

	int deleteAdopBoard(int adopId);

	int insertReply(AdoptionReply r);

	ArrayList<AdoptionReply> selectReplyList(int adopId);

	AdoptionFile selectAdopFile(int adopId);

	int insertAnimal(AnimalInfo a, AdoptionFile af);

	AdoptionFile selectAnimalFile(int animalNo);

	AnimalInfo selectAnimal(int animalNo);

	AnimalInfo selectApplyAnimal(int animalNo);

	// 입양 신청서 작성
	int insertAppForm(AnimalRequest ar, int animalNo);

	AnimalRequest selectAppForm(int memberNo);

	// 입양신청 조회 리스트
	int getRequestListCount(int memberNo);

	ArrayList<AnimalRequest> selectRequestList(int memberNo, PageInfo pi);

	Member selectMember(int memberNo);

	ArrayList<AnimalInfo> selectAList();
//
//	void deleteAnimalNotice(String no);

	int deleteAnimalNotice(Integer animalNo);

	ArrayList<AnimalInfo> admin_selectAnimalList(PageInfo pi);

	// 댓글 수정
	AdoptionReply selectAdopReply(int rId);

	int updateAdopReply(AdoptionReply adopr);

	int adoptionrDelete(int rId);






}
