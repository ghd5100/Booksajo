package com.tech.booksajo.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@MapperScan
public interface mainMapper {
	
	List<Map<String,Object>> getList();

}
