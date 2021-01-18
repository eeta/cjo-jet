package com.cjo.jet.boardReview.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.boardReview.mapper.BoardReviewSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class BoardReviewServiceImpl {
	@Autowired
	private BoardReviewSQLMapper boardReviewSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeReview(BoardReviewVo vo) {
		boardReviewSQLMapper.insertBoardReview(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getBoardReviewList(){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<BoardReviewVo> boardReviewList = boardReviewSQLMapper.selectAll();
		
		for(BoardReviewVo boardReviewVo : boardReviewList) {
			
			int member_no = boardReviewVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("boardReviewVo", boardReviewVo);
			System.out.println("test");
			resultList.add(map);
			
		}
		return resultList;
	}
	public HashMap<String, Object> getReview(int boardReviewNo){
		
		BoardReviewVo boardReviewVo = boardReviewSQLMapper.selectByNo(boardReviewNo);
		int member_no = boardReviewVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("boardReviewVo", boardReviewVo);
		
		return map;
	}
}
