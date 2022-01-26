package com.tech.booksajo.mypage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;


public interface MypageService  {
	
	List<Map<String,Object>> getList();

}
