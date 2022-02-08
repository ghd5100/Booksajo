package com.tech.booksajo.notice.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.notice.vo.NoticeDto;

@MapperScan
public interface NoticeMapper {
	
	public List<NoticeDto> getList();
//	public ArrayList<NoticeDto> noticelist(int nseq,String ntitle,String ncontent);
	public NoticeDto contentView(int nseq);
	public void upHit(int nseq);

}
