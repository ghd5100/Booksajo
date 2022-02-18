package com.tech.booksajo.admin.service;

import java.util.List;
import java.util.Map;

import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;


public interface AdminService {
	
	List<Map<String,Object>> getList();
	List<AdminDto> getUserData();
	List<AdminDto> getUserSearch(String keyword);
	
	List<OrderDto> orderList();
	List<OrderDto> orderSearch(String keyword);
	
	List<ProductDto> productSearchData(String keyword);
	List<ProductDto> productAllData();
	
	ProductDto productView(String isbn);
	void productUpdate(String isbn, String authors, String publisher, String pub_year, String price, String title, String contents);
	
	
	List<MonthlySalesDto> getSales();
	
	void userDelete(String user_id);
	
}
