package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ClassDetailVo;

public interface ClassDetailSQLMapper {
	
	// 기본키 생성
	public int createKey();
	
	// 원데이클래스 세부정보 삽입 
	public void insertDetail(ClassDetailVo vo);
	
	// 원데이클래스 세부정보 목록 보기
	public ArrayList<ClassDetailVo> selectAll();

}