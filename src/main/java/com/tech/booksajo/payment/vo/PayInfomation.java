package com.tech.booksajo.payment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PayInfomation {
	private String user_id;
	private String user_nickname;
	private String user_gender;
	private int user_age;
	private String user_name;
	private String user_phone;
	private String user_addr;
	private String user_email;
	private Date user_date;
	private int user_mailcheck;
	private int user_verification;
	private int user_check;
	private int user_point;
	private String user_coupon;
	private String user_birthday;
	private String user_sms_agree;
	private String user_email_agree;
	private String user_private_agree;
	/*	private String user_shapwd varchar2(65),
	private String user_bcpwd varchar2(65),*/

	public PayInfomation() {
		
	}
	public PayInfomation(String user_id, String user_nickname, String user_gender, int user_age, String user_name,
			String user_phone, String user_addr, String user_email, Date user_date, int user_mailcheck,
			int user_verification, int user_check, int user_point, String user_coupon, String user_birthday,
			String user_sms_agree, String user_email_agree, String user_private_agree) {

		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_gender = user_gender;
		this.user_age = user_age;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_addr = user_addr;
		this.user_email = user_email;
		this.user_date = user_date;
		this.user_mailcheck = user_mailcheck;
		this.user_verification = user_verification;
		this.user_check = user_check;
		this.user_point = user_point;
		this.user_coupon = user_coupon;
		this.user_birthday = user_birthday;
		this.user_sms_agree = user_sms_agree;
		this.user_email_agree = user_email_agree;
		this.user_private_agree = user_private_agree;
		
		
	}
 
	
}
