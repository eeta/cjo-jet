package com.cjo.jet.classboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.classboard.mapper.ClassCategorySQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassImageSQLMapper;
import com.cjo.jet.classboard.mapper.ClassReserveSQLMapper;
import com.cjo.jet.classboard.mapper.ClassboardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.*;

@Service
public class ClassboardServiceImpl {
	
	@Autowired
	private ClassboardSQLMapper classboardSQLMapper;
	
	@Autowired
	private ClassImageSQLMapper classimageSQLMapper;
	
	@Autowired
	private ClassDetailSQLMapper classDetailSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private ClassCategorySQLMapper classCategorySQLMapper;
	
	@Autowired
	private ClassReserveSQLMapper classReserveSQLMapper;

	// 원데이클래스 개설
	public void openClass(ClassboardVo vo, ArrayList<ClassImageVo> classImageVo) {
		
		int classPK = classboardSQLMapper.createKey();
		vo.setJet_class_no(classPK);
		classboardSQLMapper.insertClass(vo);
		
		// 이미지 업로드
		for(ClassImageVo imageVo : classImageVo) {
			imageVo.setJet_class_no(classPK);
			classimageSQLMapper.insertImage(imageVo);
		}
	}
	
	// 원데이클래스 세부정보
	public void detailClass(ClassDetailVo detailVo) {
		
		int detailPK = classDetailSQLMapper.createKey();
		detailVo.setJet_class_detail_no(detailPK);
		classDetailSQLMapper.insertDetail(detailVo);
		
	}
	
	// 원데이클래스 목록 보기
	public ArrayList<HashMap<String, Object>> getClassList() {
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ClassDetailVo> detailList = classDetailSQLMapper.selectAll();
		
		for(ClassDetailVo classDetailVo : detailList) {
			int class_no = classDetailVo.getJet_class_no();
			ClassboardVo classboardVo = classboardSQLMapper.selectByNo(class_no);    // detailVo에 있던 class_no를 ClassVo에 세팅
			
			int jet_member_no = classboardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);    // 멤버 넘버 추출
			
			// 카테고리 정보
			int jet_class_category_no = classboardVo.getJet_class_category_no();
			ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(jet_class_category_no);
			
			// 예약 현황
			int countReserve = classReserveSQLMapper.countReserve(classDetailVo.getJet_class_detail_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("classboardVo", classboardVo);
			map.put("classDetailVo", classDetailVo);
			map.put("memberVo", memberVo);
			map.put("classCategoryVo", classCategoryVo);
			map.put("countReserve", countReserve);
			
			System.out.println("map" + map);
			resultList.add(map);			
		}
		return resultList;
	}
	
	// 글 읽기. 클래스 상세 페이지 보기
	public HashMap<String, Object> getClassDetail(int jet_class_detail_no) {
		
		// 게시글 하나 읽기
		ClassboardVo classboardVo = classboardSQLMapper.selectClassJoinDetail(jet_class_detail_no);
		
		// 멤버 이름
		int jet_member_no = classboardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);

		// 이미지
		ArrayList<ClassImageVo> imageVoList = classimageSQLMapper.selectByNo(classboardVo.getJet_class_no());
		
		// 카테고리 이름
		ClassCategoryVo categoryVo = classCategorySQLMapper.selectByNo(classboardVo.getJet_class_category_no());
		
		// 디테일 넘버 구하기
		ClassDetailVo detailVo = classDetailSQLMapper.selectByNo(jet_class_detail_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("classboardVo", classboardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		map.put("categoryVo", categoryVo);
		map.put("detailVo", detailVo);

		return map;
	}
	
	// 예약
	public void insertReserve(ClassReservationVo vo) {
		classReserveSQLMapper.insertReserve(vo);
	}
	
	// 예약 취소
	public void deleteReserve(ClassReservationVo vo) {
		classReserveSQLMapper.deleteReserve(vo);
	}
	
	// 클래스 당 예약 개수
	public int countReserve(int classDetailNo) {
		return classReserveSQLMapper.countReserve(classDetailNo);
	}
	
	// 예약 여부 확인
	public int isReservedByUser(ClassReservationVo vo) {
		return classReserveSQLMapper.isReservedByUser(vo);
	}
	
	// 나의 예약 리스트
	public ArrayList<HashMap<String, Object>> getMyReservation(int jet_member_no) {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<ClassReservationVo> reserveVoList = classReserveSQLMapper.selectMyReservations(jet_member_no);
		
		for (ClassReservationVo reserveVo : reserveVoList) {

			// reserveVo 에서 class_detail_no 가져오기
			int jet_class_detail_no = reserveVo.getJet_class_detail_no();
			
			// class_detail_no -> detailVo 에 넣고 jet_class_no 가져오기 
			ClassDetailVo detailVo = classDetailSQLMapper.selectByNo(jet_class_detail_no);

			int jet_class_no = detailVo.getJet_class_no();

			// jet_class_no -> classVo 에 넣고 category_no 가져오기
			ClassboardVo classVo = classboardSQLMapper.selectByNo(jet_class_no);
			int category_no = classVo.getJet_class_category_no();
			
			// category_no -> categoryVo 에 넣고 cagory_name 가져오기
			ClassCategoryVo categoryVo = classCategorySQLMapper.selectByNo(category_no);
			// String category_name = categoryVo.getJet_class_category_name();
			
			// 이미지
			ArrayList<ClassImageVo> imageVo = classimageSQLMapper.selectByNo(jet_class_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("reserveVo", reserveVo);
			map.put("detailVo", detailVo);
			map.put("classVo", classVo);
			map.put("categoryVo", categoryVo);
			map.put("imageVo", imageVo);
			
			resultList.add(map);
			
		}
		return resultList;
	}
}