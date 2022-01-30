package com.tech.booksajo.search.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.main.service.mainService;
import com.tech.booksajo.search.service.SearchService;
/*import com.tech.booksajo.search.service.bookService;*/

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
//	@Autowired
//	bookService bookservice;

	
	@RequestMapping(value = "/search/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return searchService.getList();
	}	
	
	
	
	@RequestMapping("/search")
	public String search() {
		
		return "search";
	}
	
	
/*	
	@RequestMapping(value = "/List")
	public List<Map<String,Object>> List(@RequestBody Map<String,Object> requestDto){
		return searchService.List(requestDto);
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
*/
	
	
	

}
