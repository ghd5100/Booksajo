package com.tech.booksajo.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.faq.mapper.FaqMapper;


@Service(value="FaqService")
public class FaqServiceImpl implements FaqMapper {
	
	@Autowired
	FaqMapper faqmapper;

	@Override
	public List<Map<String, Object>> getList() {
		return faqmapper.getList();
	}

}
