package com.tech.booksajo.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.notice.mapper.NoticeMapper;
import com.tech.booksajo.notice.vo.NoticeDto;


@Service(value="NoticeService")
public class NoticeServiceImpl implements NoticeMapper {
	
	@Autowired
	NoticeMapper noticemapper;

	@Override
	public ArrayList<NoticeDto> noticeList() {
		return noticemapper.noticeList();
	}

	@Override
	public NoticeDto noticeView(String nseq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upHit(String nseq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void noticeWrite(String ntitle, String ncontent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void noticeWriteView(String ntitle, String ncontent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void noticeDelete(String nseq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void noticeModify(String nseq, String ntitle, String ncontent) {
		// TODO Auto-generated method stub
		
	}


}
