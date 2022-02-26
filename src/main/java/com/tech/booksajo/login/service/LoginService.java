package com.tech.booksajo.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface LoginService  {
	
	List<Map<String,Object>> getList();
	
	public String execute(Model model);

}

