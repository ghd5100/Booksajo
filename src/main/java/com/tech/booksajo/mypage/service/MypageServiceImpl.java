package com.tech.booksajo.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.main.mapper.mainMapper;
import com.tech.booksajo.mypage.mapper.mypageMapper;


@Service(value="MypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	mypageMapper mmapper;

	@Override
	public List<Map<String, Object>> getList() {
		return mmapper.getList();
	}

}
