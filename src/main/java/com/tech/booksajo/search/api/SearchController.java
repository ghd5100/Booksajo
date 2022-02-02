package com.tech.booksajo.search.api;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.main.service.mainService;
import com.tech.booksajo.search.mapper.SearchMapper;
import com.tech.booksajo.search.service.SearchService;
/*import com.tech.booksajo.search.service.bookService;*/


import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class SearchController {
	
	@Autowired
	SearchService searchService;
	

	SqlSession sqlsession;
	
/*	어토 와이어 두개서비스연결은 안되나보네 빈에러남
 * @Autowired
	boardService boardservice;*/

	
	@RequestMapping(value = "/search/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return searchService.getList();
	}	
	
	

	@RequestMapping("/search")
	public String search() {
		
		return "search";
	}
	


	
	@RequestMapping(value="/search_table")
	public String search_table(HttpServletRequest request,Model model) {
		System.out.println("서치테이블 맵핑 들어옴");
		String search=request.getParameter("search");
		model.addAttribute("search", search);
		
		
		
		//isbn이라는 기준고유값을 이용해서 제이슨 자료를 얻고 그걸 담아서 그 결과를 쿼리에 인서트로 넣어줘야함.
//		SearchMapper dao=sqlsession.getMapper(SearchMapper.class);
		//dao.test();
		
		
		
		return "search_table";
	}
	
	
	@RequestMapping(value = "/list")
	public List<Map<String,Object>> List(@RequestBody Map<String,Object> requestDto){
		return searchService.list(requestDto);
	}

	

	@RequestMapping("/write")
	public void write(@RequestBody Map<String,Object> requestDto) {
		String bName= (String) requestDto.get("bName");
		String bTitle = (String) requestDto.get("bTitle");
		String bContent= (String) requestDto.get("bContent");
		searchService.write(bName,bTitle,bContent);
	}
	
	@RequestMapping("/content_view/load/{bid}")
	public Map<String,Object> content_view(@PathVariable String bid) {
			return searchService.content_view(bid);
	}

	
	
	

}
