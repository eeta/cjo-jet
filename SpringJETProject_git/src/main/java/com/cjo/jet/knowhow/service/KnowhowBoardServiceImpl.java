package com.cjo.jet.knowhow.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.knowhow.mapper.KnowhowBoardImageSQLMapper;
import com.cjo.jet.knowhow.mapper.KnowhowBoardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class KnowhowBoardServiceImpl {
	
	@Autowired
	private KnowhowBoardSQLMapper knowhowBoardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	// 글 쓰기
	public void writeKnowhowBoard(KnowhowBoardVo vo) {	
		
		// 기본키 생성
		int knowhowBoardPK = knowhowBoardSQLMapper.createKey();
		
		vo.setJet_board_knowhow_no(knowhowBoardPK);
		
		// 글 쓰기
		knowhowBoardSQLMapper.insert(vo);
		
	}
	
	// 글 목록 출력
	public ArrayList<HashMap<String, Object>> getKnowhowBoardList() {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<KnowhowBoardVo> knowhowBoardList = knowhowBoardSQLMapper.selectAll();
		
		for (KnowhowBoardVo knowhowBoardVo : knowhowBoardList) {
			int jet_member_no = knowhowBoardVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			// put(String key, Object value)
			// 값은 넣어야 하는 오브젝트들. 왜 오브젝트인가? 둘이 다른 리턴 타입이므로
			// 키는 get할 때 쓰인다. 내가 짓고 싶은 이름으로 짓자.
			map.put("memberVo", memberVo);
			map.put("knowhowBoardVo", knowhowBoardVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	

	// 글 읽기
	// 하나의 Vo 만 뽑아내므로 ArrayList 로 안 엮는다
	public HashMap<String, Object> getKnowhowBoard(int no) {
		
		KnowhowBoardVo knowhowBoardVo = knowhowBoardSQLMapper.selectByNo(no);
				
		int jet_member_no = knowhowBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		
		// knowhowBoardVo + memberVo 뽑아오기. 이제 HashMap 으로 엮는다
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("knowhowBoardVo", knowhowBoardVo);
		map.put("memberVo", memberVo);
		
		return map;
	}
}