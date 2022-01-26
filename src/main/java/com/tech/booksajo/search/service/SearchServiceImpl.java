package com.tech.booksajo.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.main.mapper.mainMapper;
import com.tech.booksajo.search.mapper.SearchMapper;


@Service(value="SearchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchMapper smapper;

	@Override
	public List<Map<String, Object>> getList() {
		return smapper.getList();
	}

}
