package com.tech.booksajo.search.vo;

import lombok.Getter;
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
	
	public String getBsjselectbook_isbn() {
		return bsjselectbook_isbn;
	}
	public void setBsjselectbook_isbn(String bsjselectbook_isbn) {
		this.bsjselectbook_isbn = bsjselectbook_isbn;
	}
	public int getBsjselectbook_id() {
		return bsjselectbook_id;
	}
	public void setBsjselectbook_id(int bsjselectbook_id) {
		this.bsjselectbook_id = bsjselectbook_id;
	}
	public int getBsjselectbook_price() {
		return bsjselectbook_price;
	}
	public void setBsjselectbook_price(int bsjselectbook_price) {
		this.bsjselectbook_price = bsjselectbook_price;
	}
	public int getBsjselectbook_sale() {
		return bsjselectbook_sale;
	}
	public void setBsjselectbook_sale(int bsjselectbook_sale) {
		this.bsjselectbook_sale = bsjselectbook_sale;
	}
	public int getBsjselectbook_count() {
		return bsjselectbook_count;
	}
	public void setBsjselectbook_count(int bsjselectbook_count) {
		this.bsjselectbook_count = bsjselectbook_count;
	}
	public String getBsjselectbook_url() {
		return bsjselectbook_url;
	}
	public void setBsjselectbook_url(String bsjselectbook_url) {
		this.bsjselectbook_url = bsjselectbook_url;
	}
	public String getBsjselectbook_title() {
		return bsjselectbook_title;
	}
	public void setBsjselectbook_title(String bsjselectbook_title) {
		this.bsjselectbook_title = bsjselectbook_title;
	}
	public String getBsjselectbook_status() {
		return bsjselectbook_status;
	}
	public void setBsjselectbook_status(String bsjselectbook_status) {
		this.bsjselectbook_status = bsjselectbook_status;
	}
	
	
	


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
