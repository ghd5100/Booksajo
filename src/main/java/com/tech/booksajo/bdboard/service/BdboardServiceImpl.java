package com.tech.booksajo.bdboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.bdboard.mapper.BdboardMapper;

@Service(value="BdboardService")
public class BdboardServiceImpl implements BdboardMapper{

	@Autowired
	BdboardMapper bdmapper;
	
	@Override
	public List<Map<String, Object>> getList() {
		return bdmapper.getList();
	}
}