package com.kh.YellowBridge.adoption.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.YellowBridge.common.PageInfo;
import com.kh.YellowBridge.support.model.vo.Board;

@Repository("aDAO")
public class AdoptionDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adoptionMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		//페이징처리
		//마이바티스를 사용하니 RowBounds 사용가능 
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adoptionMapper.selectList", null, rowBounds);
	}

}
