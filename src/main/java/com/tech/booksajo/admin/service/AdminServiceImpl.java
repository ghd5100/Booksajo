package com.tech.booksajo.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.admin.mapper.AdminMapper;
import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;


@Service(value="adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<Map<String, Object>> getList() {
		return mapper.getList();
	}


	@Override
	public List<AdminDto> getUserData() {
		// TODO Auto-generated method stub
		return mapper.getUserData();
	}


	@Override
	public List<AdminDto> getUserSearch(String keyword) {
		// TODO Auto-generated method stub
		return mapper.userSearch(keyword);
	}


	@Override
	public void userDelete(String user_id) {
		mapper.delete_user(user_id);
	}


	@Override
	public List<OrderDto> orderList() {
		List<OrderDto> list = mapper.orderList();
		setStatus(list);
		return list;
	}


	@Override
	public List<ProductDto> productAllData() {
		
		return mapper.productAllData();
	}


	@Override
	public List<ProductDto> productSearchData(String keyword) {
		
		return mapper.productSearchData(keyword);
	}


	@Override
	public List<MonthlySalesDto> getSales() {
		
		return mapper.monthly_sales();
	}
	
	public void setStatus(List<OrderDto> list) {
		for (OrderDto orderDto : list) {
			int flag = Integer.parseInt(orderDto.getOrder_status());
			if (flag == 0) {
				orderDto.setOrder_status("배송전");
			} else if (flag == 1) {
				orderDto.setOrder_status("배송중");
			} else if (flag == 2) {
				orderDto.setOrder_status("배송완");
			} else if (flag == 3) {
				orderDto.setOrder_status("반품중");
			} else if (flag == 4) {
				orderDto.setOrder_status("반품완");
			} else if (flag == 5) {
				orderDto.setOrder_status("취소");
			}
		}
	}

	@Override
	public List<OrderDto> orderSearch(String keyword) {
		List<OrderDto> list = mapper.orderSearch(keyword);
		
		setStatus(list);
		
		return list;
	}


	@Override
	public ProductDto productView(String isbn) {
		
		return mapper.productView(isbn);
	}


	@Override
	public void productUpdate(String isbn, String authors, String publisher, String pub_year, String price, String title, String contents) {
		mapper.productUpdate(isbn, authors, publisher, pub_year, price, title, contents);
		
	}

}
