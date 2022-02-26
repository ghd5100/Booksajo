package com.tech.booksajo.admin.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.booksajo.admin.service.AdminService;
import com.tech.booksajo.admin.vo.AdminDto;
import com.tech.booksajo.admin.vo.AdminSearchVO;
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
		
		List<AdminDto> userData = service.getUserData(1, 6);
		
		model.addAttribute("user_list", userData);
		
		return "admin_home";
	}
	
	@RequestMapping(value = "/admin_user", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_user(Model model, AdminSearchVO searchVO, HttpServletRequest request) {
		System.out.println("~~admin_user Controller~~");
		String keyword = "";
		keyword = request.getParameter("user_search_keyword");
		List<AdminDto> userData = new ArrayList<>();
		System.out.println("keyword : " + keyword);
		

		String strPage=request.getParameter("page");
		System.out.println("strPage1 : " + strPage);
		if(strPage == null)
			strPage = "1";
		System.out.println("strPage2 : " + strPage);
		
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		searchVO.setSearchKeyword(keyword);
		
		
		int total = 0;
		if(keyword == null) {
			total = service.userCount();
			System.out.println("userCount : " + total);
		} else {
			total = service.userSearchCount(keyword);
			System.out.println("userSearchCount : " + total);
		}
		searchVO.pageCalculate(total);
		int rowStart = searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		
		
		
		
		if (keyword == null) {
			userData = service.getUserData(rowStart, rowEnd);
		} else {
			userData = service.getUserSearch(keyword, rowStart, rowEnd);
		}
		
		model.addAttribute("list", userData);
		model.addAttribute("searchVO", searchVO);
		
		return "admin_user";
	}
	
	@RequestMapping(value = "/admin_order", method = RequestMethod.GET)
	public String admin_order(Model model, AdminSearchVO searchVO, HttpServletRequest request) {
		System.out.println("~~admin_order Controller~~");
		String keyword = request.getParameter("order_search_keyword");
		List<OrderDto> orderList = new ArrayList<>();
		
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : " + strPage);
		if(strPage == null)
			strPage = "1";
		System.out.println("strPage2 : " + strPage);
		
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		searchVO.setSearchKeyword(keyword);
		
		
		int total = 0;
		if(keyword == null) {
			total = service.orderCount();
			System.out.println("orderCount : " + total);
		} else {
			total = service.orderSearchCount(keyword);
			System.out.println("orderSearchCount : " + total);
		}
		searchVO.pageCalculate(total);
		int rowStart = searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		if (keyword == null) {
			orderList = service.orderList(rowStart, rowEnd);
		} else {
			orderList = service.orderSearch(keyword, rowStart, rowEnd);
		}
		
		
		model.addAttribute("list", orderList);
		model.addAttribute("searchVO", searchVO);

		return "admin_order";
	}
	
	@RequestMapping(value = "/admin_order_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String product_order_detail(Model model, HttpServletRequest request) {
		System.out.println("~~admin_order_detail Controller~~");
		String order_no = request.getParameter("order_no");
		System.out.println("order_no : " + order_no);
		List<OrderDto> orderView = service.orderView(order_no);
		
		System.out.println("list.size() : " + orderView.size());
		
		List<String> orderProductList = new ArrayList<>();
		for (int i = 0; i < orderView.size(); i++) {
			orderProductList.add(orderView.get(i).getOrder_product_no());
		}
		
		
		model.addAttribute("list", orderView);
		model.addAttribute("orderProductList", orderProductList);
		return "admin_order_detail";
	}
	
	@RequestMapping(value = "/admin_order_modify", method = {RequestMethod.GET, RequestMethod.POST})
	public void product_order_modify(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="orderStatusList[]") List<String> orderStatusList,
			@RequestParam(value="orderProductNo[]") List<String> orderProductNoList,
			@RequestParam(value="orderCountList[]") List<String> orderCountList) throws IOException {
		System.out.println("~~admin_order_modify Controller~~");
		String orderProductNo = "";
		String orderStatus = "";
		String orderCount = "";
		int length = orderStatusList.size();
		
		for (int i = 0; i < length; i++) {
			orderProductNo = orderProductNoList.get(i);
			orderStatus = orderStatusList.get(i);
			orderCount = orderCountList.get(i);
			service.orderUpdate(orderProductNo, orderStatus, orderCount);
		}		
		
		
		
	}
	
	
	@RequestMapping(value = "/admin_product", method = RequestMethod.GET)
	public String admin_product(Model model, AdminSearchVO searchVO, HttpServletRequest request) {
		System.out.println("~~admin_product_list Controller~~");
		
		String keyword = request.getParameter("product_search_keyword");
		
		List<ProductDto> productData = new ArrayList<>();
		
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : " + strPage);
		if(strPage == null)
			strPage = "1";
		System.out.println("strPage2 : " + strPage);
		
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		searchVO.setSearchKeyword(keyword);
		
		
		int total = 0;
		if(keyword == null) {
			total = service.productCount();
			System.out.println("productCount : " + total);
		} else {
			total = service.productSearchCount(keyword);
			System.out.println("productSearchCount : " + total);
		}
		searchVO.pageCalculate(total);
		int rowStart = searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		
		if (keyword == null) {
			productData = service.productAllData(rowStart, rowEnd);
		} else {
			productData = service.productSearchData(keyword, rowStart, rowEnd);
		}
		
		
		model.addAttribute("list", productData);
		model.addAttribute("searchVO", searchVO);
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
	public void admin_product_update(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("~~admin_product_update Controller~~");
//		String isbn = request.getParameter("isbn");
//		String authors = request.getParameter("authors");
//		String publisher = request.getParameter("publisher");
//		String pub_year = request.getParameter("pub_year");
//		String price = request.getParameter("price");
//		String title = request.getParameter("title");
//		String contents = request.getParameter("contents");
//		System.out.println("isbn : " + isbn);
//		System.out.println("authors : " + authors);

		String attachPath = "resources\\upload\\";
		
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		System.out.println("uploadPath : " + uploadPath);
		
//		String path=uploadPath+attachPath;
//		System.out.println("path : " + path);
		
//		String path = "C:\\webSpring\\springWork\\booksajo\\src\\main\\webapp\\resources\\upload_img";
		String path = "C:\\spring\\springWork\\booksajo\\src\\main\\webapp\\resources\\upload_img";
		
		MultipartRequest req = new MultipartRequest(request, path, 1024*1024*20,"utf-8", new DefaultFileRenamePolicy());
		
		
		Enumeration fName = req.getFileNames();
		String isbn = req.getParameter("isbn");
		String authors = req.getParameter("authors");
		String publisher = req.getParameter("publisher");
		String pub_year = req.getParameter("pub_year");
		String price = req.getParameter("price");
		String title = req.getParameter("title");
		String contents = req.getParameter("htmlData");
		
		List<String> imgFiles = new ArrayList<>();
		System.out.println(fName.hashCode());

		int count = 0;

		System.out.println("%%%%%%%%%%%%%%%%%%%%");
		while(fName.hasMoreElements()) {
			
			count++;
			
			String imgName = (String)fName.nextElement();
			String imgfile = req.getFilesystemName(imgName);
			imgFiles.add(imgfile);
			
			System.out.println(imgName);
			
		}
		
		System.out.println("%%%%%%%%%%%%%%");
		System.out.println(count);
		
		System.out.println("imgFiles : " + imgFiles.toString());
		
		System.out.println("isbn : " + isbn);
		System.out.println("authors : " + authors);
		System.out.println("publisher : " + publisher);
		System.out.println("pub_year : " + pub_year);
		System.out.println("price : " + price);
		System.out.println("title : " + title);
		System.out.println("contents : " + contents);
		
		service.productUpdate(isbn, authors, publisher, pub_year, price, title, contents);
		
//		response.sendRedirect("admin_product_detail?isbn=" + isbn);
		
	}
	
	
	
	
	@RequestMapping(value = "/admin_sales", method = RequestMethod.GET)
	public String admin_sales(Model model, HttpServletRequest request) {
		System.out.println("~~admin_sales Controller~~");
		String selectYear = "";
		if (request.getParameter("selectYear") == null) {
			selectYear = "2022";
		} else {
			selectYear = request.getParameter("selectYear");
		}
		System.out.println("selectYear");
		List<MonthlySalesDto> li = service.getSales(selectYear);
		
		List<String> list = new ArrayList<>();
		
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < li.size(); j++) {
				if (i == Integer.parseInt(li.get(j).getOrder_date()) - 1) {
					list.add(i, li.get(j).getMonthly_sales());
					break;
				} else if (i == list.size() - 1) {
					break;
				} else {
					list.add(i, "0");

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
		model.addAttribute("selectYear", selectYear);
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
