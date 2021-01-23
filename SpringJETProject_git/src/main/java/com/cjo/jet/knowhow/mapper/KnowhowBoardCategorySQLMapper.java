package com.cjo.jet.knowhow.mapper;

import com.cjo.jet.vo.KnowhowBoardCategoryVo;
import com.cjo.jet.vo.KnowhowBoardVo;

public interface KnowhowBoardCategorySQLMapper {
	
	// 글 카테고리 보기
	public KnowhowBoardCategoryVo selectByNo(int jet_board_knowhow_category_no);
	
	// 글 카테고리 수정
	public void update(KnowhowBoardVo vo);
}