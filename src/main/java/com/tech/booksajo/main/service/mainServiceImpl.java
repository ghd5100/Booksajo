package com.tech.booksajo.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.main.mapper.mainMapper;


@Service(value="mainService")
public class mainServiceImpl implements mainService {
	
	@Autowired
	mainMapper mapper;

	@Override
	public List<Map<String, Object>> getList() {
		return mapper.getList();
	}

}
