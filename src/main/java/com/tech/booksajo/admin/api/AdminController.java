package com.tech.booksajo.admin.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.booksajo.admin.service.AdminService;
import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.MonthlySalesDto;
import com.tech.booksajo.admin.vo.OrderDto;
import com.tech.booksajo.admin.vo.ProductDto;


@Controller
public class AdminController {
	
	@Autowired
	AdminService service;

//	private SqlSession sqlSession;
	
	@RequestMapping(value = "/admin_home", method = RequestMethod.GET)
	public String admin_home(Model model) {
		System.out.println("~~admin_home Controller~~");
		
		List<AdminDto> userData = service.getUserData();
		
		model.addAttribute("user_list", userData);
		
		return "admin_home";
	}
	
	@RequestMapping(value = "/admin_user", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_user(Model model, HttpServletRequest request, @RequestParam HashMap<Object, Object> param) {
		System.out.println("~~admin_user Controller~~");
		String keyword = "";
		keyword = request.getParameter("user_search_keyword");
		List<AdminDto> userData = new ArrayList<>();
		System.out.println("search : " + keyword);
		
		String user_id = String.valueOf(param.get("target"));
		if (user_id != null) {
			service.userDelete(user_id);
		}
		if (keyword == null) {
			userData = service.getUserData();
		} else {
			userData = service.getUserSearch(keyword);
		}
		
		model.addAttribute("list", userData);
		
		return "admin_user";
	}
	
	@RequestMapping(value = "/admin_order", method = RequestMethod.GET)
	public String admin_order(Model model, HttpServletRequest request) {
		System.out.println("~~admin_order Controller~~");
		String keyword = request.getParameter("order_search_keyword");
		List<OrderDto> orderList = new ArrayList<>();
		
		if (keyword == null) {
			orderList = service.orderList();
		} else {
			orderList = service.orderSearch(keyword);
		}
		

		model.addAttribute("list", orderList);
		
		return "admin_order";
	}
	
	@RequestMapping(value = "/admin_product", method = RequestMethod.GET)
	public String admin_product(Model model, HttpServletRequest request) {
		System.out.println("~~admin_product_list Controller~~");
		String keyword = "";
		keyword = request.getParameter("product_search_keyword");
		
		List<ProductDto> productData = new ArrayList<>();
		if (keyword == null) {
			productData = service.productAllData();
		} else {
			productData = service.productSearchData(keyword);
		}
		
		
		model.addAttribute("list", productData);
		
		return "admin_product";
	}
	
	@RequestMapping(value = "/admin_product_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String product_product_detail(Model model, HttpServletRequest request) {
		System.out.println("~~admin_product_detail Controller~~");
		String isbn = request.getParameter("isbn");
		ProductDto productData = service.productView(isbn);
		model.addAttribute("list", productData);
		return "admin_product_detail";
	}
	
	
	@RequestMapping(value = "/product_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public String product_modify(Model model, HttpServletRequest request) {
		System.out.println("~~admin_product_modify Controller~~");
		String isbn = request.getParameter("isbn");
		ProductDto productData = service.productView(isbn);
		model.addAttribute("list", productData);
		return "product_modify";
	}
	
	@RequestMapping(value = "/admin_product_update", method = {RequestMethod.GET, RequestMethod.POST})
	public void admin_product_update(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("~~admin_product_update Controller~~");
		String isbn = request.getParameter("isbn");
		String authors = request.getParameter("authors");
		String publisher = request.getParameter("publisher");
		String pub_year = request.getParameter("pub_year");
		String price = request.getParameter("price");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		System.out.println("isbn : " + isbn);
		System.out.println("authors : " + authors);
		
		service.productUpdate(isbn, authors, publisher, pub_year, price, title, contents);
		
		response.sendRedirect("admin_product_detail?isbn=" + isbn);
	}
	
	
	
	
	@RequestMapping(value = "/admin_sales", method = RequestMethod.GET)
	public String admin_sales(Model model) {
		System.out.println("~~admin_sales Controller~~");
		
		List<MonthlySalesDto> li = service.getSales();
		
		List<String> list = new ArrayList<>();
		
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < li.size(); j++) {
				if (i == Integer.parseInt(li.get(j).getOrder_date()) - 1) {
					list.add(i, li.get(j).getMonthly_sales());
					System.out.println( i + "," + j +" : " + list.size());
					System.out.println("list : " + list.toString());
					break;
				} else if (i == list.size() - 1) {
					break;
				} else {
					list.add(i, "0");
					System.out.println( i + "," + j +" : " + list.size());
					System.out.println("list : " + list.toString());
				}
				
			}
		}

//		List<Map<String, String>> list = new ArrayList<>();
//		Map<String, String> map = new HashMap<>();
//		
//		for (int i = 0; i < li.size(); i++) {
//			map.put("monthly_sales", li.get(i).getMonthly_sales());
//			map.put("order_date", li.get(i).getOrder_date());
//			list.add(map);
//		}
		System.out.println("list : " + list.toString());
		System.out.println("list.size() : " + list.size());
		
		model.addAttribute("list", list);
		
		return "admin_sales";
	}

	private int i(int i, String monthly_sales) {
		// TODO Auto-generated method stub
		return 0;
	}
	
//	@RequestMapping(value = "/user_search", method = RequestMethod.GET)
//	public String user_search(Model model, HttpServletRequest request) {
//		System.out.println("~~admin_user Controller~~");
//		AdminMapper dao = sqlSession.getMapper(AdminMapper.class);
//		String search = request.getParameter("user_search");
//		List<AdminDto> userData = dao.userSearch(search);
//		
//		model.addAttribute("list", userData);
//		
//		return "admin_user";
//	}

}
