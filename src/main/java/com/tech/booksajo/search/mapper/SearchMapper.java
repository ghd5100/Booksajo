package com.tech.booksajo.search.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@MapperScan
public interface SearchMapper {
	
	List<Map<String,Object>> getList();

}
