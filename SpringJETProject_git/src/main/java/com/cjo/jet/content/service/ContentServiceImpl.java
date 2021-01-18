package com.cjo.jet.content.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.content.mapper.ContentSQLMapper;

@Service
public class ContentServiceImpl {
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	
}
