package com.cjo.jet.boardReview.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjo.jet.boardReview.service.BoardReviewServiceImpl;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/board_Review/*")
public class BoardReviewController {
	@Autowired
	private BoardReviewServiceImpl boardReviewService;
	
	@RequestMapping("board_Review.do")
	public String boardReview(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = boardReviewService.getBoardReviewList();
		
		model.addAttribute("resultList", resultList);
		return "board_Review/board_Review";
	}
	
	@RequestMapping("board_Review_Write.do")
	public String boardReviewWrite() {

		return "board_Review/board_Review_Write";
	}
	
	@RequestMapping("board_Review_Write_Process.do")
	public String boardReviewWriteProcess(HttpSession session, BoardReviewVo param) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		boardReviewService.writeReview(param);
			
		return "redirect:./board_Review.do";
	}
	
	@RequestMapping("board_Review_View.do")
	public String boardReviewView(Model model, int board_Review_no) {
		
		HashMap<String, Object> map = boardReviewService.getReview(board_Review_no);
	
		model.addAttribute("result", map);
		
		return "board_Review/board_Review_View";
	}
}
