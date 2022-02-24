package com.tech.booksajo.search.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class ShopView {

	//장바구니 테이블에 관련된 변수
	private String bsjselectbook_isbn;
	private int bsjselectbook_id;
	private int bsjselectbook_price;
	private int bsjselectbook_sale;
	private int bsjselectbook_count;
	private String bsjselectbook_url;
	private String bsjselectbook_title;
	private String bsjselectbook_status;
	


//	public ShopView() {
//		// TODO Auto-generated constructor stub
//	}
//
//
//
//	public ShopView(String bsjselectbook_isbn, int bsjselectbook_id, int bsjselectbook_price, int bsjselectbook_sale,
//			int bsjselectbook_count, String bsjselectbook_url, String bsjselectbook_title) {
//		
//		
//		
//		this.bsjselectbook_isbn = bsjselectbook_isbn;
//		this.bsjselectbook_id = bsjselectbook_id;
//		this.bsjselectbook_price = bsjselectbook_price;
//		this.bsjselectbook_sale = bsjselectbook_sale;
//		this.bsjselectbook_count = bsjselectbook_count;
//		this.bsjselectbook_url = bsjselectbook_url;
//		this.bsjselectbook_title = bsjselectbook_title;
//		//this.bsjselectbook_status = bsjselectbook_status;
//	}


	
}
