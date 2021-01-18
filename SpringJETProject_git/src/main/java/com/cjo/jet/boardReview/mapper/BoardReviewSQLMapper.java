package com.cjo.jet.boardReview.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.BoardReviewVo;

public interface BoardReviewSQLMapper {
	public void insertBoardReview(BoardReviewVo vo);
	
	public ArrayList<BoardReviewVo>selectAll();
	
	public BoardReviewVo selectByNo(int no);
}
