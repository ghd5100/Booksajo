package com.tech.booksajo.notice.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		System.out.println("pass by noticeList");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		List<NoticeDto> noticelist=noticemapper.noticeList();
		System.out.println("noticelist : "+noticelist);
		model.addAttribute("noticeList",noticelist);
		
		return "noticeList";
	}
	
	@RequestMapping("/noticeView")
	public String noticeView(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeView");
//		int nseq=(Integer.parseInt(request.getParameter("nseq")));
		String nseq=request.getParameter("nseq");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.upHit(nseq);
		
		NoticeDto noticedto=noticemapper.noticeView(nseq);
		model.addAttribute("noticeView",noticedto);
		
		return "noticeView";
	}
	
	@RequestMapping("/noticeWriteView") //write_view
	public String noticeWriteView() {
		System.out.println("pass by noticeWriteView");
				
		return "noticeWriteView";
	}
		
	@RequestMapping("noticeWrite")  //write
	public String noticeWrite(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeWrite");
		
		String ntitle=request.getParameter("ntitle");
		String ncontent=request.getParameter("ncontent");
	
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeWrite(ntitle,ncontent);
	
		return "noticeList";
	}

	@RequestMapping(method=RequestMethod.GET,value="/noticeModify")  
	public String noticeModify(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeModify");
		
//		int nseq=(Integer.parseInt(request.getParameter("nseq")));
		String nseq=request.getParameter("nseq");
		String ntitle=request.getParameter("ntitle");
		String ncontent=request.getParameter("ncontent");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeModify(nseq,ntitle,ncontent);
		
		return "noticeModify";
		
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeDelete");
		
		String nseq=request.getParameter("nseq");
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeDelete(nseq);
		
		return "noticeList";
	}
	
}
