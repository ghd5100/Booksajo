package com.tech.booksajo.notice.mapper;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.notice.vo.NoticeDto;

@MapperScan
public interface NoticeMapper {
	
	public ArrayList<NoticeDto> noticeList();
	
	public ArrayList<NoticeDto> noticeList(int start,int end,String searchKeyword,String selNum);

	public NoticeDto noticeView(String nseq);

	public void noticeWriteView(String ntitle, String ncontent);

	public void noticeWrite(String ntitle, String ncontent);

	public void upHit(String nseq);

	public void noticeDelete(String nseq);

	public void noticeModify(String nseq,String ntitle, String ncontent);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount0(String searchKeyword);

//	ArrayList<NoticeDto> noticeList();


}
