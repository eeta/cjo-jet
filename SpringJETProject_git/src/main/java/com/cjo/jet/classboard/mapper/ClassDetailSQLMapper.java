package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassPickVo;
import com.cjo.jet.vo.ClassSingoVo;

public interface ClassDetailSQLMapper {
	
	// 기본키 생성
	public int createKey();
	
	// 원데이클래스 세부정보 삽입 
	public void insertDetail(ClassDetailVo vo);
	
	// 원데이클래스 세부정보 목록 보기
	public ArrayList<ClassDetailVo> selectAll();
	
	// detail no로 detailVo 뽑아오기
	public ClassDetailVo selectByNo(int jet_class_detail_no);
	
	// 찜
	public void insertPick(ClassPickVo vo);
	
	// 찜 취소
	public void deletePick(@Param("jet_class_detail_no")int jet_class_detail_no, @Param("jet_member_no")int jet_member_no);

	public ClassPickVo checkPick(@Param("jet_class_detail_no")int jet_class_detail_no, @Param("jet_member_no")int jet_member_no);
	
	//신고
	public void insertSingo(ClassSingoVo vo);
	
	// 게시글 당 신고 클릭 여부 확인
	public int isSingoByUser(ClassSingoVo vo);
	
	// 노티스 글에 모든 신고 출력 
	public ArrayList<ClassSingoVo> selectAllSingoNoPage();
}