package com.tech.booksajo.search.vo;

import java.util.Date;

public class ReviewDto {

	private String isbn;
	private Date re_date;
	private int re_score;
	private String re_content;
	private int re_group;
	private int re_step;
	private String re_filesrc;
	private String user_id;
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getRe_score() {
		return re_score;
	}
	public void setRe_score(int re_score) {
		this.re_score = re_score;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_group() {
		return re_group;
	}
	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public String getRe_filesrc() {
		return re_filesrc;
	}
	public void setRe_filesrc(String re_filesrc) {
		this.re_filesrc = re_filesrc;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
	
}
