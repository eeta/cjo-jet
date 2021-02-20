package com.cjo.jet.classboard.mapper;

import com.cjo.jet.vo.ClassboardVo;

public interface ClassboardSQLMapper {
	
	// 기본키 생성
	public int createKey();
	
	// 원데이클래스 개설
	public void insertClass(ClassboardVo vo);
	
	// 원데이클래스 한 개 보기. 이걸 기준으로 값을 갖고 오고 또 넣어서 세부사항과 연결할 것
	public ClassboardVo selectByNo(int class_no);
	
	// 글 읽기. 원데이클래스 상세 페이지 보기
	public ClassboardVo selectClassJoinDetail(int jet_class_no);
	
}