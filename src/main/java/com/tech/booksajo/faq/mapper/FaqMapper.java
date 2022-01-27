package com.tech.booksajo.faq.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface FaqMapper {

	List<Map<String, Object>> getList();

}
