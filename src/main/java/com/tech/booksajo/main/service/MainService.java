package com.tech.booksajo.main.service;

import java.util.List;
import java.util.Map;

import com.tech.booksajo.main.vo.MainDto;


public interface MainService {
	
	List<Map<String,Object>> getList();
	List<MainDto> getBestData();
	List<MainDto> getBestAll(int rowStart, int rowEnd, int categoryCheck);
	List<MainDto> rList(String id);
	int bestCount(int categoryCheck);
}
