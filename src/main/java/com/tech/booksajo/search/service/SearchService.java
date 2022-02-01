package com.tech.booksajo.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface SearchService  {
	
	List<Map<String,Object>> getList();

	List<Map<String, Object>> list(Map<String, Object> requestDto);
	
	void write(String bName, String bTitle, String bContent);
	Map<String,Object> content_view(String bid);
}
