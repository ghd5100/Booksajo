package com.tech.booksajo.payment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class KakaoPayApproval {

	
    //response
    private String aid;
    private String tid;
    private String cid;
    private String sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private Amount amount;
    private Card card_info;
    private String item_name;
    private String item_code;
    private String payload;
    private int quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;
    private String pg_token;
    
}
