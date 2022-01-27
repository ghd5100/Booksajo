package com.tech.booksajo.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.notice.mapper.NoticeMapper;


@Service(value="NoticeService")
public class NoticeServiceImpl implements NoticeMapper {
	
	@Autowired
	NoticeMapper nmapper;

	@Override
	public List<Map<String, Object>> getList() {
		return nmapper.getList();
	}

}
