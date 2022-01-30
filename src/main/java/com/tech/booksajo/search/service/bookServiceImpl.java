package com.tech.booksajo.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tech.booksajo.search.mapper.BookMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class bookServiceImpl implements bookService {
	
	@Autowired
	BookMapper bookMapper;

	@Override
	public List<Map<String, Object>> findAll() {
		 return bookMapper.getList();
	}
	
	

}
