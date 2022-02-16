package com.tech.booksajo.notice.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class NoticeDto {

	private int nseq;
	private String ntitle;
	private String ncontent;
	private  Date ndate;
	private int nhit;
	
	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}



}

