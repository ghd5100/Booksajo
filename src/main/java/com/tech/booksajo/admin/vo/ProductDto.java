package com.tech.booksajo.admin.vo;

import java.sql.Date;

public class ProductDto {
	
	private String thumbnail;
	private String isbn;
	private String title;
	private String contents;
	private String authors;
	private String publisher;
	private String price;
	private Date cre_dt;
	private String cre_id;
	private Date mod_dt;
	private String mod_id;
	private String use_yn;
	private String pub_year;
	private String stock;
	private String keyword;
	private String class_major;
	private String class_major_ko;
	private String book_status;
	
	public String getBook_status() {
		return book_status;
	}


	public String getClass_major_ko() {
		return class_major_ko;
	}


	public String getClass_major() {
		return class_major;
	}

	public void setClass_major(String class_major) {
		this.class_major = class_major;
		changeClass(class_major);
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
		if (stock == null) {
			this.book_status = "품절";
		} else {
			this.book_status = "판매중";
		}
		
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
		thumbnailCheck(thumbnail);
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Date getCre_dt() {
		return cre_dt;
	}

	public void setCre_dt(Date cre_dt) {
		this.cre_dt = cre_dt;
	}

	public String getCre_id() {
		return cre_id;
	}

	public void setCre_id(String cre_id) {
		this.cre_id = cre_id;
	}

	public Date getMod_dt() {
		return mod_dt;
	}

	public void setMod_dt(Date mod_dt) {
		this.mod_dt = mod_dt;
	}

	public String getMod_id() {
		return mod_id;
	}

	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getPub_year() {
		return pub_year;
	}

	public void setPub_year(String pub_year) {
		this.pub_year = pub_year;
	}

	public ProductDto() {
		// TODO Auto-generated constructor stub
	}
	
	
//	method
	
	public void changeClass(String class_major) {

		switch (class_major) {
		case "0":
			class_major_ko = "총류";
			break;
		case "1":
			class_major_ko = "철학";
			break;
		case "2":
			class_major_ko = "종교";
			break;
		case "3":
			class_major_ko = "사회과학";
			break;
		case "4":
			class_major_ko = "자연과학";
			break;
		case "5":
			class_major_ko = "기술과학";
			break;
		case "6":
			class_major_ko = "예술";
			break;
		case "7":
			class_major_ko = "언어";
			break;
		case "8":
			class_major_ko = "문학";
			break;
		case "9":
			class_major_ko = "역사";
			break;

		default:
			break;
		}
		

	}
	
	public void thumbnailCheck(String thumbnail) {
		String path = "resources/upload_img/";
		if (!(thumbnail.contains("http"))) {
			this.thumbnail = path + thumbnail;
		}
	}
}
