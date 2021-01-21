package com.cjo.jet.knowhow.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.knowhow.mapper.KnowhowBoardImageSQLMapper;
import com.cjo.jet.knowhow.mapper.KnowhowBoardRepleSQLMapper;
import com.cjo.jet.knowhow.mapper.KnowhowBoardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.KnowhowBoardImageVo;
import com.cjo.jet.vo.KnowhowBoardRepleVo;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class KnowhowBoardServiceImpl {
	
	@Autowired
	private KnowhowBoardSQLMapper knowhowBoardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private KnowhowBoardRepleSQLMapper knowhowBoardRepleSQLMapper;
	
	@Autowired
	private KnowhowBoardImageSQLMapper knowhowBoardImageSQLMapper;
	
	// 글 쓰기
	public void writeKnowhowBoard(KnowhowBoardVo vo, ArrayList<KnowhowBoardImageVo> imageVoList) {    // 이미지 업로드 1. imageVoList
		
		
		// 기본키 생성
		int knowhowBoardPK = knowhowBoardSQLMapper.createKey();
		
		vo.setJet_board_knowhow_no(knowhowBoardPK);
		
		// 글 쓰기
		knowhowBoardSQLMapper.insert(vo);
		
		// 이미지 업로드 1. 반복문 돌려서 이미지 리스트 가져오기
		for (KnowhowBoardImageVo imageVo : imageVoList) {
			imageVo.setJet_board_knowhow_no(knowhowBoardPK);    // 기본키 세팅
			knowhowBoardImageSQLMapper.insert(imageVo);
		}
	}
	
	// 글 목록 출력
	public ArrayList<HashMap<String, Object>> getKnowhowBoardList(String search_word, String search_type, int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		// 글 검색 조건문 위해서 초기화
		ArrayList<KnowhowBoardVo> knowhowBoardList = null;
		
		// 글 검색
		if (search_word == null || search_type == null) {
			knowhowBoardList = knowhowBoardSQLMapper.selectAll(page_num);
		} else {
			if (search_type.equals("title")) {
				knowhowBoardList = knowhowBoardSQLMapper.selectByTitle(search_word);
			} else if (search_type.equals("content")) {
				knowhowBoardList = knowhowBoardSQLMapper.selectByContent(search_word);
			} else if (search_type.equals("writer")) {
				knowhowBoardList = knowhowBoardSQLMapper.selectByWriter(search_word);
			} else {
				knowhowBoardList = knowhowBoardSQLMapper.selectAll(page_num);
			}
		}
		
		// 글 목록 출력
		for (KnowhowBoardVo knowhowBoardVo : knowhowBoardList) {
			int jet_member_no = knowhowBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			
			// 댓글 개수 출력
			int countReple = knowhowBoardRepleSQLMapper.countReple(knowhowBoardVo.getJet_board_knowhow_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			// put(String key, Object value)
			// 값은 넣어야 하는 오브젝트들. 왜 오브젝트인가? 둘이 다른 리턴 타입이므로
			// 키는 get할 때 쓰인다. 내가 짓고 싶은 이름으로 짓자.
			map.put("memberVo", memberVo);
			map.put("knowhowBoardVo", knowhowBoardVo);
			map.put("countReple", countReple);
			
			resultList.add(map);
		}
		return resultList;
	}
	

	// 글 읽기
	// 하나의 Vo 만 뽑아내므로 ArrayList 로 안 엮는다
	public HashMap<String, Object> getKnowhowBoard(int contentNo) {
		
		// 조회수 증가
		knowhowBoardSQLMapper.increaseReadCount(contentNo);
		
		KnowhowBoardVo knowhowBoardVo = knowhowBoardSQLMapper.selectByNo(contentNo);
				
		int jet_member_no = knowhowBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		
		// knowhowBoardVo + memberVo 뽑아오기. 이제 HashMap 으로 엮는다
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 이미지 11. 이미지 리스트 받기
		ArrayList<KnowhowBoardImageVo> imageVoList = knowhowBoardImageSQLMapper.selectByContentNo(contentNo);
		
		map.put("knowhowBoardVo", knowhowBoardVo);    // 단위 객체
		map.put("memberVo", memberVo);    // 단위 객체
		map.put("imageVoList", imageVoList);  // 이미지 11. 배열 객체
		
		return map;
	}
	
	// 글 삭제하기
	public void deleteKnowhowBoard(int contentNo) {
		
		knowhowBoardSQLMapper.deleteByNo(contentNo);
		
	}
	
	// 글 수정하기
	public void updateKnowhowBoard(KnowhowBoardVo vo) {
		
		knowhowBoardSQLMapper.update(vo);
		
	}
	
	// 댓글 쓰기
	public void writeRepleKnowhowBoard(KnowhowBoardRepleVo vo)  {
		
		knowhowBoardRepleSQLMapper.insertReple(vo);
		
	}
	
	// 댓글 보기 (글 목록 출력과 유사)
	public ArrayList<HashMap<String, Object>> getRepleByNo(int no) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<KnowhowBoardRepleVo> repleList = knowhowBoardRepleSQLMapper.selectRepleByNo(no);
		
		for (KnowhowBoardRepleVo repleVo : repleList) {
			int jet_member_no = repleVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("repleVo", repleVo);
			
			result.add(map);		
		}
		return result;
	}
	
	// 댓글 개수 출력
	public int countRepleKnowhowBoard(int no) {
		
		return knowhowBoardRepleSQLMapper.countReple(no);
		
	}
	
	// 페이지 수
	public int countPageKnowhowBoard() {
		return knowhowBoardSQLMapper.countPage();
	}
}