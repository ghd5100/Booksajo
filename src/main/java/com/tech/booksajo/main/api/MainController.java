package com.tech.booksajo.main.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.booksajo.main.service.MainService;
import com.tech.booksajo.main.vo.MainDto;
import com.tech.booksajo.main.vo.MainPageVO;
import com.tech.booksajo.main.vo.MainSearchVO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;


//	private SqlSession sqlSession;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("~~Index Controller~~");
		
		List<MainDto> list = service.getBestData();
		
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping(value = "/bestList", method = RequestMethod.GET)
	public String best(HttpServletRequest request, MainSearchVO searchVO, Model model) throws Exception {
		System.out.println("~~Best Controller~~");
//		MainMapper dao = sqlSession.getMapper(MainMapper.class);;
		
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : " + strPage);
		if(strPage == null)
			strPage = "1";
		System.out.println("strPage2 : " + strPage);
		
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		
		int total = 0;
		
		total = service.bestCount();
		System.out.println("bestCount : " + total);
		
		searchVO.pageCalculate(total);
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		
		List<MainDto> list = service.getBestAll(rowStart, rowEnd);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
		
		return "bestList";
	}
	

}
