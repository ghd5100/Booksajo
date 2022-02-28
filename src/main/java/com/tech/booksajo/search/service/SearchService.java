package com.tech.booksajo.search.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tech.booksajo.search.vo.ReviewDto;
import com.tech.booksajo.search.vo.ShopView;
import com.tech.booksajo.search.vo.UserSelect;
import com.tech.booksajo.search.vo.getcount;


public interface SearchService  {
	
	List<Map<String,Object>> sList();

	List<Map<String, Object>> slist(Map<String, Object> requestDto);
	
	void write(String bName, String bTitle, String bContent);
	Map<String,Object> content_view(String bid);
	

	ArrayList<Object> keywordget(String isbn13) throws Exception;
	
	ArrayList<String> categoryget(String search) throws IOException,Exception;
	
	ArrayList<ShopView> shoplist(String isbnscr,int count,String userId);
	
	ShopView bookinfo(String isbnscr,int count);
	
	
	ArrayList<Object> categoryName(String isbn13) throws Exception;
	
//	ArrayList<ShopView> getshoplist();

	List<UserSelect> totalcount(String userId);
	
	
//  이선아 : 리뷰게시판
	List<ReviewDto> reviewList(int rowStart, int rowEnd);
	int reviewCount();
	int cartCount(String isbn,String userId);
	void cartUpdate(String isbn,int count,String userId);

	
}
