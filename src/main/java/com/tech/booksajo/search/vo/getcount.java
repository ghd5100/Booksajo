package com.tech.booksajo.search.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class getcount {

	private int totalcount;
	private String bsjselectbook_isbn;

public getcount() {
	// TODO Auto-generated constructor stub
}

public getcount(int totalcount, String bsjselectbook_isbn) {

	this.totalcount = totalcount;
	this.bsjselectbook_isbn = bsjselectbook_isbn;
}


}

