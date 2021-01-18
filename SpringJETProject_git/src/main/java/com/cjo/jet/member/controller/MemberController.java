package com.cjo.jet.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("login_page.do")
	public String loginPage() {
		
		return "member/login_page";
	}
	
	@RequestMapping("join_member_page.do")
	public String joinMemberPage() {
		return "member/join_member_page";
	}
	
	@RequestMapping("join_member_process.do")
	public String joinMemberProcess(MemberVo param, String [] jet_interest_name) {
		
		memberService.joinMember(param, jet_interest_name);

		return "member/join_member_complete";
	}
	
	@RequestMapping("login_process.do")
	public String loginProcess(MemberVo param, HttpSession session) {
		
		MemberVo sessionUser = memberService.login(param);
		System.out.println("[test]" + sessionUser);
		
		if(sessionUser != null) {
			session.setAttribute("sessionUser", sessionUser);
			
			return "redirect:../content/main_page.do";
		}else {
			return "member/login_fail";
		}
	}
	@RequestMapping("logout_process.do")
	public String logoutProcess(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		if(referer != null && !referer.equals("")) {
			return "redirect:"+referer;
		}else {
			return "redirect:/";
		}
		
	}
	//ajax 아이디 중복확인
	@ResponseBody//<- ajax로 부터 호출되는 요청의 응답을 데이터만 보낼 때 이 어노테이션을 사용 - 포워딩 하지 않는 방식
	@RequestMapping("exist_id.do")
	public String existId(String id) {
		System.out.println("[ajax server test]" + id);//테스트 코드
		boolean existId = memberService.existId(id);
		
		if(existId == true) {//ajax로 부터 호출되는 명령의 응답은 순수하게 데이터만 리턴되어야 함.
			return "true"; //나중에 null도 추가해서 테스트해 볼 것
		}else {
			return "false";
		}
	}
}
