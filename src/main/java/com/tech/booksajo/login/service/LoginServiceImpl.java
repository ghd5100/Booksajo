package com.tech.booksajo.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.login.mapper.LoginMapper;

@Service(value="LoginService")
public class LoginServiceImpl implements LoginMapper{

	@Autowired
	LoginMapper loginmapper;
	
	@Override
	public List<Map<String, Object>> getList() {
		return loginmapper.getList();
	}
}