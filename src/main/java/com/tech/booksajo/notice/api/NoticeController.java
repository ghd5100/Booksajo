package com.tech.booksajo.notice.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.booksajo.notice.mapper.NoticeMapper;
import com.tech.booksajo.notice.service.NoticeService;
import com.tech.booksajo.notice.vo.NoticeDto;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class NoticeController {
	NoticeService noticeService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/noticeList")
	public String noticelist(Model model) {
		System.out.println("pass by notice");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		List<NoticeDto> noticelist=noticemapper.getList();
		System.out.println("noticelist : "+noticelist);
		model.addAttribute("noticeList",noticelist);
		
		return "noticeList";
	}
	
	@RequestMapping("/noticeView")
	public String contentView(HttpServletRequest request, Model model) {
		System.out.println("'공지사항 상세' 확인");
		int nseq=(Integer.parseInt(request.getParameter("nseq")));
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.upHit(nseq);
		
		NoticeDto noticedto=noticemapper.contentView(nseq);
		model.addAttribute("noticeView",noticedto);
		
		return "noticeView";
	}
	
}
