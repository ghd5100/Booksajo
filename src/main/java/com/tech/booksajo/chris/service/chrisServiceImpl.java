package com.tech.booksajo.chris.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.chris.mapper.chrisMapper;
import com.tech.booksajo.main.mapper.mainMapper;


@Service(value="chrisService")
public class chrisServiceImpl implements chrisService {
	
	@Autowired
	chrisMapper chrismapper;

	@Override
	public List<Map<String, Object>> getList() {
		return chrismapper.getList();
	}

}
