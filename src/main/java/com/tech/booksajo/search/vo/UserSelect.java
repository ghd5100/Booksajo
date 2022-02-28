package com.tech.booksajo.search.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserSelect {

	private int totalcount;
	private String totalisbn;
	
	
	public UserSelect() {
		// TODO Auto-generated constructor stub
	}


	public UserSelect(String totalisbn,int totalcount) {
		this.totalcount = totalcount;
		this.totalisbn = totalisbn;
	}

}
