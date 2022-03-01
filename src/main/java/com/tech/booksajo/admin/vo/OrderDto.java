package com.tech.booksajo.admin.vo;


public class OrderDto {
	private String user_id, order_no, order_date, order_status, order_total_price;
	private String user_name, user_phone, user_email, user_addr, title, price, order_count, isbn;
	private String order_product_no, total_price;

	public String getTotal_price() {
		return total_price;
	}


	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}


	public String getOrder_product_no() {
		return order_product_no;
	}


	public void setOrder_product_no(String order_product_no) {
		this.order_product_no = order_product_no;
	}


	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_addr() {
		return user_addr;
	}


	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getOrder_count() {
		return order_count;
	}


	public void setOrder_count(String order_count) {
		this.order_count = order_count;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getOrder_total_price() {
		return order_total_price;
	}


	public void setOrder_total_price(String order_total_price) {
		this.order_total_price = order_total_price;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getOrder_no() {
		return order_no;
	}


	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}


	public String getOrder_date() {
		return order_date;
	}


	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}


	public String getOrder_status() {
		return order_status;
	}


	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_status_ko() {
		String strResult = "";
		int flag = Integer.parseInt(this.order_status);
		if (flag == 0) {
			strResult = "배송전";
		} else if (flag == 1) {
			strResult = "배송중";
		} else if (flag == 2) {
			strResult = "배송완";
		} else if (flag == 3) {
			strResult = "반품중";
		} else if (flag == 4) {
			strResult = "반품완";
		} else if (flag == 5) {
			strResult = "취소";
		}
		return strResult;
	}

	public OrderDto() {
		// TODO Auto-generated constructor stub
	}
}
