package com.cjo.jet.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjo.jet.freeboard.service.FreeboardServiceImpl;
import com.cjo.jet.vo.FreeboardVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/freeboard/*")
public class FreeboardController {
	@Autowired
	private FreeboardServiceImpl freeboardService;
	
	@RequestMapping("main_free_board.do")
	public String mainPage(Model model) {
	
		ArrayList<HashMap<String, Object>> resultList = freeboardService.getFreeboardList();
		
		model.addAttribute("resultList", resultList);
		
		return "/freeboard/main_free_board";
	}
	
	@RequestMapping("write_free_board_page.do")
	public String writeFreeboardPage() {
		
		return "freeboard/write_free_board_page";
	}
	
	
	@RequestMapping("write_free_board_process.do")
	public String writeFreeboardProcess(HttpSession session, FreeboardVo param) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		freeboardService.writeFreeboard(param);
		
		return "redirect:./main_free_board.do";
	}
	
	@RequestMapping("read_free_board_page.do")
	public String readFreeboardPage(Model model, int jet_board_free_no) {
		
		HashMap<String, Object> map = freeboardService.getFreeboardContent(jet_board_free_no);
		
		model.addAttribute("result", map);
		
		return "freeboard/read_free_board_page";
	}

	@RequestMapping("delete_free_board_process.do")
	public String deleteFreeboardProcess(int jet_board_free_no) {
		
		freeboardService.deleteFreeboard(jet_board_free_no);
		
		return "redirect:./main_free_board.do";
	}
	
	@RequestMapping("update_free_board_page.do")
	public String updateFreeboardPage(Model model, int jet_board_free_no) {
		
		HashMap<String, Object> map = freeboardService.getFreeboardContent(jet_board_free_no);
		
		model.addAttribute("result", map);
		
		return "freeboard/update_free_board_page";
	}
	
	@RequestMapping("update_free_board_process.do")
	public String updateFreeboardProcess(FreeboardVo param) {
		
		freeboardService.updateFreeboard(param);
		
		return "redirect:./main_free_board.do";
	}
}
