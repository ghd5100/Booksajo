package com.tech.booksajo.notice.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class NoticeController {
	
	@Autowired
	NoticeService nservice;
	
	@RequestMapping(value = "/notice/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return nservice.getList();
	}
	


}
