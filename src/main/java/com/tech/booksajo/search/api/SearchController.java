package com.tech.booksajo.search.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.main.service.mainService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class SearchController {
	
	@Autowired
	mainService service;
	
	@RequestMapping(value = "/search/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return service.getList();
	}
	

	@RequestMapping("/search")
	public String search() {
		
		return "search";
	}

}
