package com.tech.booksajo.faq.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.faq.service.FaqService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class FaqController {
	
	@Autowired
	FaqService faqservice;
	
	@RequestMapping(value = "/faq/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return faqservice.getList();
	}
	
}
