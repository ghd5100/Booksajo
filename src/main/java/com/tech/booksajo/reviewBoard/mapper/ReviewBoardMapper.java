package com.tech.booksajo.bdboard.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface BdboardMapper {

	List<Map<String, Object>> getList();
	
}
