package com.tech.booksajo.main.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.main.vo.MainDto;




@MapperScan
public interface mainMapper {

	List<Map<String, Object>> getList();
	List<MainDto> getData();
	List<MainDto> getAllData(int rowStart, int rowEnd);	
//	int selectTotCount();
	List<Map<String, Object>> getData2();
//	List<MainDto> getList();


}
