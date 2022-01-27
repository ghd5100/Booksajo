package com.tech.booksajo.notice.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface NoticeMapper {

	List<Map<String, Object>> getList();

}
