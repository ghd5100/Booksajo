package com.tech.booksajo.admin.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.booksajo.main.mapper.mainMapper;
import com.tech.booksajo.main.vo.MainDto;
import com.tech.booksajo.main.vo.PageVO;

@Controller
public class admin_controller {
	
//	mainService service;

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/admin_home", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("~~admin_home Controller~~");
		
		
		return "common/admin_page/admin_home";
	}

}
