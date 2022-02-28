package com.tech.booksajo.payment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Paymentinfomation {

	private String payment_isbn;
	private int payment_count;
	private int PAYMENT_TOTALSUM;
	private int PAYMENT_SUM;
	private String PAYMENT_METHOD;
	private String PAYMENT_TID;
	private Date PAYMENT_DATETIME;
	
	public Paymentinfomation() {

	}

	public Paymentinfomation(String payment_isbn, int payment_count) {
		this.payment_isbn = payment_isbn;
		this.payment_count = payment_count;
	}

}
