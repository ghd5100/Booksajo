package com.tech.booksajo.main.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.main.vo.MainDto;




@MapperScan
public interface MainMapper {

	List<Map<String, Object>> getList();
	List<MainDto> getData();
	int bestCount();
	List<MainDto> getAllData(int rowStart, int rowEnd, int categoryCheck);
//	int selectTotCount();
	List<Map<String, Object>> getData2();
//	List<MainDto> getList();
	List<String> classMajor(String id);
	List<MainDto> rList(String class_major);

}
