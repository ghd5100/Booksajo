package com.tech.booksajo.notice.mapper;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.notice.vo.NoticeDto;

@MapperScan
public interface NoticeMapper {
	
	public ArrayList<NoticeDto> noticeList();

	public NoticeDto noticeView(String nseq);

	public void noticeWriteView(String ntitle, String ncontent);

	public void noticeWrite(String ntitle, String ncontent);

	public void upHit(String nseq);

	public void noticeDelete(String nseq);

	public void noticeModify(String nseq, String ntitle, String ncontent);

}
