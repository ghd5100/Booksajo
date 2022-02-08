package com.tech.booksajo.main.api;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.booksajo.main.mapper.mainMapper;
import com.tech.booksajo.main.vo.MainDto;
import com.tech.booksajo.main.vo.PageVO;

@Controller
public class mainController {
	
//	mainService service;

	@Autowired
	private SqlSession sqlSession;
	
//	@RequestMapping(value = "/main/api/getList", method = RequestMethod.GET  )
//	@ResponseBody
//	public List<Map<String,Object>> getList(){
//		return service.getList();
//	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("~~Index Controller~~");
		mainMapper dao = sqlSession.getMapper(mainMapper.class);
//		List<Map<String, Object>> list = dao.getData();
		
		List<MainDto> list = dao.getData();
		
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping(value = "/bestList", method = RequestMethod.GET)
	public String best(HttpServletRequest request, PageVO pageVO, Model model) {
		System.out.println("~~Best Controller~~");
		mainMapper dao = sqlSession.getMapper(mainMapper.class);;
		
		String strPage = request.getParameter("page");
		
		if(strPage == null) strPage = "1";
		
		int page = Integer.parseInt(strPage);
		
		pageVO.setPage(page);
		int total = dao.selectTotCount(); 
		pageVO.pageCalculate(total);
		
		int rowStart = pageVO.getRowStart();
		int rowEnd = pageVO.getRowEnd();
		
		System.out.println(rowStart);
		System.out.println(rowEnd);
		List<MainDto> list = dao.getAllData(rowStart, rowEnd);

		
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("page", pageVO);
		model.addAttribute("totRowCnt", total);
		
		return "bestList";
	}
	
}
