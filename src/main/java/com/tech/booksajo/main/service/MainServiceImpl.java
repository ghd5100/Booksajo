package com.tech.booksajo.main.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.tech.booksajo.main.mapper.MainMapper;
import com.tech.booksajo.main.vo.MainDto;


@Service(value="mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;

	@Override
	public List<Map<String, Object>> getList() {
		return mapper.getList();
	}

	@Override
	public List<MainDto> getBestData() {
		return mapper.getData();
	}

	@Override
	public List<MainDto> getBestAll(int rowStart, int rowEnd) {
		
		return mapper.getAllData(rowStart, rowEnd);
	}

	@Override
	public int bestCount() {
		
		return mapper.bestCount();
	}

}
