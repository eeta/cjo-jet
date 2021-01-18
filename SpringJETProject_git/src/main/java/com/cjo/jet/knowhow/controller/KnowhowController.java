package com.cjo.jet.knowhow.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjo.jet.knowhow.service.KnowhowBoardServiceImpl;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/knowhowboard/*")
public class KnowhowController {
	
	@Autowired
	private KnowhowBoardServiceImpl knowhowBoardService;
	
	// 팁과 노하우 게시판으로
	@RequestMapping("knowhowboard_page.do")
	public String knowhowBoardList(Model model) {
		
		// 글 목록 출력
		ArrayList<HashMap<String, Object>> resultList = knowhowBoardService.getKnowhowBoardList();
		
		model.addAttribute("resultList", resultList);
		
		return "knowhowboard/knowhowboard_page";
	}
	
	// 글 작성 페이지로
	@RequestMapping("write_knowhowboard_page.do")
	public String knowhowBoardWrite() {
		
		return "knowhowboard/write_knowhowboard_page";
	}
	
	// 글 작성 프로세스로
	@RequestMapping("write_knowhowboard_process.do")
	public String knowhowBoardWriteProcess(HttpSession session, KnowhowBoardVo param) {
		
		// 데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		knowhowBoardService.writeKnowhowBoard(param);
		
		return "redirect:./knowhowboard_page.do";
	}
	
	// 글 읽기 페이지로
	@RequestMapping("read_knowhowboard_page.do")
	public String readKnowhowBoardPage(Model model, int jet_board_knowhow_no) {
		
		HashMap<String, Object> map = knowhowBoardService.getKnowhowBoard(jet_board_knowhow_no);
		
		model.addAttribute("result", map);
		
		return "knowhowboard/read_knowhowboard_page";
	}
	
	// 글 삭제 프로세스로
	@RequestMapping("delete_knowhowboard_process.do")
	public String deleteKnowhowBoardProcess(int jet_board_knowhow_no) {
		
		knowhowBoardService.deleteKnowhowBoard(jet_board_knowhow_no);
		
		return "redirect:./knowhowboard_page.do";
	}
}