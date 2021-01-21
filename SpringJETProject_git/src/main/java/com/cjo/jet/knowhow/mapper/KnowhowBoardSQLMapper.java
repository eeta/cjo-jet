package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.KnowhowBoardVo;

public interface KnowhowBoardSQLMapper {
	
		// 기본키 생성
		public int createKey();
		
		// 글 쓰기
		public void insert(KnowhowBoardVo vo);
		
		// 글 목록 보기
		public ArrayList<KnowhowBoardVo> selectAll(int page_num);
		
		// 글 읽기
		public KnowhowBoardVo selectByNo(int no);
		
		// 글 삭제
		public void deleteByNo(int no);
		
		// 글 수정
		public void update(KnowhowBoardVo vo);
		
		// 글 조회수 증가
		public void increaseReadCount(int no);
		
		// 글 제목 검색
		public ArrayList<KnowhowBoardVo> selectByTitle(String search_word);
		
		// 글 내용 검색
		public ArrayList<KnowhowBoardVo> selectByContent(String search_word);
		
		// 글 작성자 검색
		public ArrayList<KnowhowBoardVo> selectByWriter(String search_word);
		
		// 페이지 수
		public int countPage();
}