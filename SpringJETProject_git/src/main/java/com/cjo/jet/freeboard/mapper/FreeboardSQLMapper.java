package com.cjo.jet.freeboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.FreeboardVo;

public interface FreeboardSQLMapper {
	public void insert(FreeboardVo vo);
	//전체 출력..
	public ArrayList<FreeboardVo> selectAll();
	//글보기...
	public FreeboardVo selectByNo(int no);
	//글 삭제
	public void deleteByNo(int no);	
	//글 수정
	public void update(FreeboardVo vo);	
	//조회수 증가
	public void increaseReadCount(int no);	
	//댓글 쓰기..
	//public void insertReple(FreeboardRepleVo vo);
}
