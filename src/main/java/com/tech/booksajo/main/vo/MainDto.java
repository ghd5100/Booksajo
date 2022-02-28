package com.tech.booksajo.main.vo;

import java.sql.Date;


public class MainDto {
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
	private String class_major;
	
	
	public String getClass_major() {
		return class_major;
	}

	public void setClass_major(String class_major) {
		this.class_major = class_major;
	}

	public MainDto() {
		// TODO Auto-generated constructor stub
	}

	public String getPub_year() {
		return pub_year;
	}

	public void setPub_year(String pub_year) {
		this.pub_year = pub_year;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	
	
}
