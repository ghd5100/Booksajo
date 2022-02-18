package com.tech.booksajo.admin.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;
import com.tech.booksajo.main.vo.MainDto;




@MapperScan
public interface AdminMapper {

	List<Map<String, Object>> getList();
	List<AdminDto> getUserData();
	List<AdminDto> userSearch(String keyword);
	int delete_user(String user_id);
	
	List<OrderDto> orderList();
	List<OrderDto> orderSearch(String keyword);
	
	List<ProductDto> productAllData();
	List<ProductDto> productSearchData(String keyword);
	
	ProductDto productView(String isbn);
	void productUpdate(String isbn, String authors, String publisher, String pub_year, String price, String title, String contents);
	
	List<MonthlySalesDto> monthly_sales();
}
