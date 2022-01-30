package com.tech.booksajo.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.search.mapper.SearchMapper;


@Service(value="SearchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchMapper searchmapper;

	@Override
	public List<Map<String, Object>> getList() {
		return searchmapper.getList();
	}
	
	
/*	@Override
	public List<Map<String, Object>> List(Map<String,Object> requestDto) {
	
		List<Map<String,Object>>  result = null;
		
		return result;
	}

	@Override
	public void write(String bName, String bTitle, String bContent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> content_view(String bid) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
