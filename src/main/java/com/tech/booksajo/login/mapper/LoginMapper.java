package com.tech.booksajo.login.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface LoginMapper {

	List<Map<String, Object>> getList();
	
}
