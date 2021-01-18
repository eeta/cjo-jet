package com.cjo.jet.content.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjo.jet.content.service.ContentServiceImpl;

@Controller
@RequestMapping("/content/*")
public class MainPageController {
	
	@Autowired
	private ContentServiceImpl contentService;
	
	@RequestMapping("main_page.do")
	public String mainPage() {
		
		return "content/main_page";
	}
}
