package com.cjo.jet.classboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.classboard.service.ClassboardServiceImpl;
import com.cjo.jet.vo.ClassPickVo;
import com.cjo.jet.vo.ClassReservationVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/classboard/*")
@ResponseBody
public class RESTfulClassboardController {
	
	@Autowired
	ClassboardServiceImpl classboardService;

	
	// 클래스 예약하기
	@RequestMapping("reserve_class_process.do")
	public void reserveClassProcess(HttpSession session, ClassReservationVo reserveVo, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		reserveVo.setJet_member_no(jet_member_no);
		
		classboardService.insertReserve(reserveVo);
	
	}
	
	// 클래스 예약 취소하기
	@RequestMapping("cancel_class_process.do")
	public void deleteReserveClassProcess(HttpSession session, ClassReservationVo reserveVo, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		reserveVo.setJet_member_no(jet_member_no);

		classboardService.deleteReserve(reserveVo);
		
	}
	
	//클래스 예약 true false
	@RequestMapping("classboard_reserve_map.do")
	public HashMap<String, Object> ClassboardReserveMap(int jet_class_detail_no, HttpSession session){
		HashMap<String, Object> ReserveMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		ClassReservationVo classReservationVo = null;
		
		boolean checkReserve = false;
		if(memberVo != null) {
			classReservationVo = classboardService.checkReservation(memberVo, jet_class_detail_no);
			
			if(classReservationVo != null) {
				checkReserve = true;
			}else {
				checkReserve = false;
			}
		}
		
		int countReserve = classboardService.countReserve(jet_class_detail_no);
		
		ReserveMap.put("checkReserve", checkReserve);
		ReserveMap.put("countReserve", countReserve);
		
		return ReserveMap;
	}
	
	
	// 찜 프로세스
	@RequestMapping("classboard_pick_process.do")
	public void pickClassProcess(ClassPickVo vo, HttpSession session, int jet_class_detail_no) {
		
		int jet_member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		vo.setJet_member_no(jet_member_no);
		vo.setJet_class_detail_no(jet_class_detail_no);
		
		classboardService.insertPick(vo);
	}
	
	// 찜 취소 프로세스
	@RequestMapping("classboard_unpick_process.do")
	public void unpickClassProcess(HttpSession session, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		classboardService.deletePick(jet_class_detail_no, jet_member_no);
	}
	
	@RequestMapping("classboard_pick_check_process.do")
	public HashMap<String, Object> classboardPickMap(int jet_class_detail_no, HttpSession session){
		
		HashMap<String, Object> pickMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		ClassPickVo classPickVo = null;
		
		boolean pickCheck = false;
		
		if(memberVo != null) {
			classPickVo = classboardService.checkPick(jet_class_detail_no, memberVo);
			
			if(classPickVo != null) {
				pickCheck = true;
			}else {
				pickCheck = false;
			}
		
		}
		
		pickMap.put("pickCheck", pickCheck);
		
		return pickMap;
	}
}