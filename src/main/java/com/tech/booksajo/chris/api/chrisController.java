package com.tech.booksajo.chris.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.chris.service.chrisService;
import com.tech.booksajo.faq.service.FaqService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class chrisController {
	
	@Autowired
	chrisService chrisservice;
	
	@RequestMapping(value = "/chris/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return chrisservice.getList();
	}

	

	
}
