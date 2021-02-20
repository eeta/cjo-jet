package com.cjo.jet.classboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.classboard.mapper.ClassCategorySQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassImageSQLMapper;
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
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("classboardVo", classboardVo);
			map.put("classDetailVo", classDetailVo);
			map.put("memberVo", memberVo);
			map.put("classCategoryVo", classCategoryVo);
			
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
}