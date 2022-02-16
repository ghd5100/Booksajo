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
	public void dataInput(String isbn, String bookImage, String authors, String publisher, String bookName, String pub_year, String rank);
	
//	int selectTotCount();
	List<Map<String, Object>> getData2();
//	List<MainDto> getList();


}
