package com.tech.booksajo.search.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SearchView {
//서치할떄 필요한 테이블 필드들
	
	private ArrayList<Object> wordlist;
	private Object jarrlist;
	private ArrayList<Object> catelist;
	private int maxnum;
	

	public SearchView() {
		// TODO Auto-generated constructor stub
	}
	
	
}
