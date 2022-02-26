package com.tech.booksajo.bdboard.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.bdboard.service.BdboardService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class BdboardController {
	
	@Autowired
	BdboardService bdservice;
	
	@RequestMapping(value = "/bdboard/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return bdservice.getList();
	}
	


}
