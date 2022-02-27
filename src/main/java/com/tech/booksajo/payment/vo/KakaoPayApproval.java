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
    private String partner_order_id;
    private String partner_user_id;
    private String payment_method_type;
    private Amount amount;
    private Card card_info;
    private String item_name;
    private String item_code;
    private String payload;
    private int quantity;
    private int tax_free_amount;
    private int vat_amount;
    private Date created_at, approved_at;
    private String pg_token;
    
    
    
}
