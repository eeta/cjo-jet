package com.cjo.jet.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.freeboard.mapper.FreeboardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.FreeboardVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class FreeboardServiceImpl {
	@Autowired
	private FreeboardSQLMapper freeboardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeFreeboard(FreeboardVo vo) {
		freeboardSQLMapper.insert(vo);
	}	
	
	public ArrayList<HashMap<String, Object>> getFreeboardList(){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FreeboardVo> freeboardList = freeboardSQLMapper.selectAll();
		
		for(FreeboardVo freeboardVo : freeboardList) {
			int member_no = freeboardVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);  
			map.put("freeboardVo", freeboardVo);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public HashMap<String, Object> getFreeboardContent(int freeboard_no){
		
		// 조회수 증가 쿼리 추가
		freeboardSQLMapper.increaseReadCount(freeboard_no);
		
		FreeboardVo freeboardVo = freeboardSQLMapper.selectByNo(freeboard_no);
		int member_no = freeboardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberVo", memberVo);
		map.put("freeboardVo", freeboardVo);
		
		return map;
	}
	
	public void deleteFreeboard(int freeboard_no) {
		freeboardSQLMapper.deleteByNo(freeboard_no);
	}
	
	public void updateFreeboard(FreeboardVo vo) {
		freeboardSQLMapper.update(vo);
	}
	
}
