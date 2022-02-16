package com.tech.booksajo.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface NoticeService  {
	
	public void execute(Model model);
	
	List<Map<String,Object>> getList();

	List<Map<String, Object>> noticeList(Map<String, Object> requestDto);

	Map<String, Object> noticeView(String nseq);

}
