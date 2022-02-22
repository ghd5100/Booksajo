package com.tech.booksajo.mypage.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.tech.booksajo.mypage.vo.Myinfomation;

@MapperScan
public interface mypageMapper {
	
	List<Map<String,Object>> getList();
	Myinfomation userinfo();
}
