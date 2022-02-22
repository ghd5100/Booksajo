package com.tech.booksajo.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.mypage.mapper.mypageMapper;
import com.tech.booksajo.mypage.vo.Myinfomation;


@Service(value="mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	mypageMapper mmapper;

	@Override
	public List<Map<String, Object>> getList() {
		return mmapper.getList();
	}

	@Override
	public Myinfomation userinfo() {
		
		
		return mmapper.userinfo();
	}

}
