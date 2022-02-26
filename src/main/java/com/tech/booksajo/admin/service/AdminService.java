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
	
	
	ProductDto productView(String isbn);
	void productUpdate(String isbn, String authors, String publisher, String pub_year, String price, String title, String contents);
	
	
	List<MonthlySalesDto> getSales(String selectYear);
	
	void userDelete(String user_id);
	
}
