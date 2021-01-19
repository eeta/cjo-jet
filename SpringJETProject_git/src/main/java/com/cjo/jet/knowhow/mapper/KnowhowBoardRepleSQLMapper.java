package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.KnowhowBoardRepleVo;

public interface KnowhowBoardRepleSQLMapper {
	
	// 댓글 쓰기 
	public void insertReple(KnowhowBoardRepleVo vo);
	
	// 댓글 보기
	public ArrayList<KnowhowBoardRepleVo> selectRepleByNo(int knowhowBoard_no);
}