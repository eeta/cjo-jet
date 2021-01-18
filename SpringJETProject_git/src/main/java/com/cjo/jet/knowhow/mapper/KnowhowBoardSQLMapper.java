package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.KnowhowBoardVo;

public interface KnowhowBoardSQLMapper {
	
		// 기본키 생성
		public int createKey();
		
		// 글 쓰기
		public void insert(KnowhowBoardVo vo);
		
		// 글 목록 보기
		public ArrayList<KnowhowBoardVo> selectAll();
}