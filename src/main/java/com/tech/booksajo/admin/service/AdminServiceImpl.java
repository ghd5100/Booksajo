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
	public List<AdminDto> getUserData(int rowStart, int rowEnd) {
		// TODO Auto-generated method stub
		return mapper.getUserData(rowStart, rowEnd);
	}


	@Override
	public List<AdminDto> getUserSearch(String keyword, int rowStart, int rowEnd) {
		// TODO Auto-generated method stub
		return mapper.userSearch(keyword, rowStart, rowEnd);
	}


	@Override
	public void userDelete(String user_id) {
		mapper.delete_user(user_id);
	}


	@Override
	public List<OrderDto> orderList(int rowStart, int rowEnd) {
		List<OrderDto> list = mapper.orderList(rowStart, rowEnd);
		//setStatus(list);
		return list;
	}


	@Override
	public List<ProductDto> productAllData(int rowStart, int rowEnd) {
		
		return mapper.productAllData(rowStart, rowEnd);
	}


	@Override
	public List<ProductDto> productSearchData(String keyword, int rowStart, int rowEnd) {
		
		return mapper.productSearchData(keyword, rowStart, rowEnd);
	}


	@Override
	public List<MonthlySalesDto> getSales(String selectYear) {
		
		return mapper.monthly_sales(selectYear);
	}
	
//	public void setStatus(List<OrderDto> list) {
//		for (OrderDto orderDto : list) {
//			int flag = Integer.parseInt(orderDto.getOrder_status());
//			if (flag == 0) {
//				orderDto.setOrder_status("배송전");
//			} else if (flag == 1) {
//				orderDto.setOrder_status("배송중");
//			} else if (flag == 2) {
//				orderDto.setOrder_status("배송완");
//			} else if (flag == 3) {
//				orderDto.setOrder_status("반품중");
//			} else if (flag == 4) {
//				orderDto.setOrder_status("반품완");
//			} else if (flag == 5) {
//				orderDto.setOrder_status("취소");
//			}
//		}
//	}

	@Override
	public List<OrderDto> orderSearch(String keyword, int rowStart, int rowEnd) {
		List<OrderDto> list = mapper.orderSearch(keyword, rowStart, rowEnd);
		
		//setStatus(list);
		
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


	@Override
	public List<OrderDto> orderView(String order_no) {
		
		return mapper.orderView(order_no);
	}


	@Override
	public int orderCount() {
		// TODO Auto-generated method stub
		return mapper.orderCount();
	}


	@Override
	public int orderSearchCount(String keyword) {
		
		return mapper.orderSearchCount(keyword);
	}


	@Override
	public int productCount() {
		// TODO Auto-generated method stub
		return mapper.productCount();
	}


	@Override
	public int productSearchCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.productSearchCount(keyword);
	}


	@Override
	public int userCount() {
		
		return mapper.userCount();
	}


	@Override
	public int userSearchCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.userSearchCount(keyword);
	}


	@Override
	public void orderUpdate(String orderProductNo, String orderStatus, String orderCount) {
		mapper.orderUpdate(orderProductNo, orderStatus, orderCount);
		
	}

}
