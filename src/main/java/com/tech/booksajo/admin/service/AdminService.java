package com.tech.booksajo.admin.service;

import java.util.List;
import java.util.Map;

import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;


public interface AdminService {
	
	List<Map<String,Object>> getList();
	List<AdminDto> getUserData(int rowStart, int rowEnd);
	List<AdminDto> getUserSearch(String keyword, int rowStart, int rowEnd);
	AdminDto userDetail(String user_id);
	List<OrderDto> userOrderList(String user_id);
	
	int userCount();
	int userSearchCount(String keyword);
	
	List<OrderDto> orderList(int rowStart, int rowEnd);
	List<OrderDto> orderSearch(String keyword, int rowStart, int rowEnd);
	List<OrderDto> orderView(String order_no);
	
	void orderUpdate(String orderProductNo, String orderStatus, String orderCount);
	
	int orderCount();
	int orderSearchCount(String keyword);
	
	List<ProductDto> productAllData(int rowStart, int rowEnd);
	List<ProductDto> productSearchData(String keyword, int rowStart, int rowEnd);
	
	int productCount();
	int productSearchCount(String keyword);
//	THUMBNAIL, ISBN, ,TITLE, CONTENTS, AUTHORS, PUBLISHER, PUB_YEAR, PRICE, KEYWORD, CLASS_MAJOR, CLASS_MINOR, CRE_DT, CRE_ID, MOD_DT, MOD_ID, USE_YN, STOCK
	void productReg(String thumbnail, String isbn, String title, String contents, String authors, String publisher, String pub_year, String price, String keyword, String class_major, String stock);
	
	ProductDto productView(String isbn);
	void productUpdate(String thumbnail, String isbn, String authors, String publisher, String pub_year, String price, String title, String contents);
	void productDelete(String isbn);
	List<MonthlySalesDto> getSales(String selectYear);
	
	void userDelete(String user_id);
	
}
