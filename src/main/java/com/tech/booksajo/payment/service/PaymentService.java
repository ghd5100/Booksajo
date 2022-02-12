package com.tech.booksajo.payment.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface PaymentService  {
	
	List<Map<String,Object>> pList();

	List<Map<String, Object>> plist(Map<String, Object> requestDto);
	
	void write(String bName, String bTitle, String bContent);
	Map<String,Object> content_view(String bid);
}
