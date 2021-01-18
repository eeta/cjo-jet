package com.cjo.jet.csboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.csboard.mapper.CsBoardImageSQLMapper;
import com.cjo.jet.csboard.mapper.CsBoardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.CsBoardImageVo;
import com.cjo.jet.vo.CsBoardVo;
import com.cjo.jet.vo.MemberVo;


@Service
public class CsBoardServiceImpl {

	@Autowired
	private CsBoardSQLMapper csBoardSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	@Autowired
	private CsBoardImageSQLMapper csBoardImageSQLMapper;
	
	//글쓰기
	public void writeCsBoard(CsBoardVo vo, ArrayList<CsBoardImageVo> imageVoList) {
		
		int csBoardPK = csBoardSQLMapper.creatKey();
		//프라이머리 키 생성하고
		System.out.println("csBoardPK : " + csBoardPK);
		
		vo.setJet_board_m_cs_no(csBoardPK);
		
		csBoardSQLMapper.insert(vo);
		//글쓰기 
		
		for(CsBoardImageVo imageVo : imageVoList) {
			imageVo.setJet_board_m_cs_no(csBoardPK);
			//이미지 출력시 여기서 실수 난 image_no 에 넣어버림 시발
			csBoardImageSQLMapper.insert(imageVo);
		}

	}
		
	//글 리스트 출력 CS게시판 메인에서
	public ArrayList<HashMap<String, Object>> getCsBoardList(String search_word ,String search_type,int page_num){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CsBoardVo> csBoardList = null;
		
		if(search_word == null || search_type == null) {
			csBoardList = csBoardSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("title")) {	
				csBoardList = csBoardSQLMapper.selectByTitle(search_word);
			}
			else if(search_type.equals("content")) {
				csBoardList = csBoardSQLMapper.selectByContent(search_word);
			}else if (search_type.equals("writer")) {
				csBoardList = csBoardSQLMapper.selectByWriter(search_word);
			}else {
				csBoardList = csBoardSQLMapper.selectAll(page_num);
			}
		}
		
		//csVo + memberVo 병합하자 
		for(CsBoardVo csBoardVo : csBoardList) {
			int JET_member_no = csBoardVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(JET_member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("csBoardVo", csBoardVo);
			
			resultList.add(map);	
		}
		
		return resultList;
	}
		
	//글 읽기
	public HashMap<String, Object> getCsBoard(int contentNo) {
		//하나의 Vo 만 뽑아내므로 ArrayList 로 안엮음
		
		
		csBoardSQLMapper.increaseReadcount(contentNo);
		//조회수..증가연동
		
		CsBoardVo csBoardVo = csBoardSQLMapper.selectByNo(contentNo);
		
		//read 할때 엔터가 안되는거 고치기.
		String str = csBoardVo.getJet_board_m_cs_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		csBoardVo.setJet_board_m_cs_content(str);
		
		int JET_member_no = csBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(JET_member_no);
		
		//csBoardVo + memberVo 뽑아오기 이제 hashMap으로 엮자
		
		ArrayList<CsBoardImageVo> imageVoList = csBoardImageSQLMapper.selectByContentNo(contentNo);
		//이미지 리스트 받기
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("csBoardVo", csBoardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		
		
		return map;
	}
		
	//글삭제
	public void deleteCsBoard(int contentNo) {
		csBoardSQLMapper.deleteByNo(contentNo);
	}

	//글 수정
	public void updateCsBoard(CsBoardVo vo) {
		csBoardSQLMapper.update(vo);
	}
	
	//페이지 갯수
	public int getPageCount() {	
		return csBoardSQLMapper.getPageCount();
	}

	
		
}
