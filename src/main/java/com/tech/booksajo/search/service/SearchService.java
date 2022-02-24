package com.tech.booksajo.search.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tech.booksajo.search.vo.SearchView;
import com.tech.booksajo.search.vo.ShopView;


public interface SearchService  {
	
	List<Map<String,Object>> sList();

	List<Map<String, Object>> slist(Map<String, Object> requestDto);
	
	void write(String bName, String bTitle, String bContent);
	Map<String,Object> content_view(String bid);
	

	ArrayList<Object> keywordget(String isbn13) throws Exception;
	
	ArrayList<String> categoryget(String search) throws IOException,Exception;
	
	ArrayList<ShopView> shoplist(String isbnscr,int count);
	
	ShopView bookinfo(String isbnscr,int count);
	
//	ArrayList<ShopView> getshoplist();

}
