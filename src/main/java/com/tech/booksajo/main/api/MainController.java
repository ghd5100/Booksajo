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
import com.tech.booksajo.main.vo.PageVO;

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
	public String best(HttpServletRequest request, PageVO pageVO, Model model) throws Exception {
		System.out.println("~~Best Controller~~");
//		MainMapper dao = sqlSession.getMapper(MainMapper.class);;
		
		String strPage = request.getParameter("page");
		
		if(strPage == null) strPage = "1";
		
		int page = Integer.parseInt(strPage);
		
		pageVO.setPage(page);
		int total = 200;
		pageVO.pageCalculate(total);
		
		int rowStart = pageVO.getRowStart();
		int rowEnd = pageVO.getRowEnd();
		
		List<MainDto> list = service.getBestAll(rowStart, rowEnd);
		
		model.addAttribute("list", list);
		model.addAttribute("page", pageVO);
		model.addAttribute("totRowCnt", total);
		
		return "bestList";
	}
	

}
