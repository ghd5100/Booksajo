package com.tech.booksajo.payment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tech.booksajo.mypage.vo.Myinfomation;
import com.tech.booksajo.payment.vo.PayInfomation;


public interface PaymentService  {
	
	List<Map<String,Object>> pList();

	List<Map<String, Object>> plist(Map<String, Object> requestDto);
	
	void write(String bName, String bTitle, String bContent);
	Map<String,Object> content_view(String bid);
	
	Myinfomation getuser();
	
	ArrayList<Object> insertwork(ArrayList<String> selectisbnlist, ArrayList<Integer> countlist) throws Exception;
	//public 써주지않는다. 서비스에선

	void insertpayinfo(String a,String b);

	ArrayList<Object> getpayinfo();


}
