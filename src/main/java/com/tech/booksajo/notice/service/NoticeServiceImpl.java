package com.tech.booksajo.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.notice.mapper.NoticeMapper;
import com.tech.booksajo.notice.vo.NoticeDto;


@Service(value="NoticeService")
public class NoticeServiceImpl implements NoticeMapper {
	
	@Autowired
	NoticeMapper noticemapper;

	@Override
	public List<NoticeDto> getList() {
		return noticemapper.getList();
	}
	
/*	@Override
	public ArrayList<NoticeDto> noticelist(int nseq, String ntitle, String ncontent) {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	public NoticeDto contentView(int nseq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upHit(int nseq) {
		// TODO Auto-generated method stub
		
	}





}
