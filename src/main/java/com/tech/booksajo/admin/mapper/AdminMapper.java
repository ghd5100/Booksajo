package com.tech.booksajo.admin.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;




@MapperScan
public interface AdminMapper {

	List<Map<String, Object>> getList();
	List<AdminDto> getUserData(int rowStart, int rowEnd);
	List<AdminDto> userSearch(String keyword, int rowStart, int rowEnd);
	void delete_user(String user_id);
	
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
	
	List<MonthlySalesDto> monthly_sales(String selectYear);
}
