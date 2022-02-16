package com.tech.booksajo.notice.api;

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
import com.tech.booksajo.notice.vo.SearchVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class NoticeController {
	NoticeService noticeService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/noticeList")
	public String noticelist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("pass by noticeList");
		
//		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
//		List<NoticeDto> noticelist=noticemapper.noticeList();
//		System.out.println("noticelist : "+noticelist);
//		model.addAttribute("noticeList",noticelist);
		
//		search
		String ntitle="";
		String ncontent="";
		String[] brdtitle=request.getParameterValues("searchType");
		if(brdtitle!=null) {
			for(int i=0;i<brdtitle.length;i++) {
				System.out.println("========================");
				System.out.println("brdtitle : "+brdtitle[i]);
			}
		}
		
//		ch 값 변수에 저장
		if(brdtitle!=null) {
			for (String val : brdtitle) {
				if(val.equals("ntitle")) {
					model.addAttribute("ntitle","true"); //검색유지
					ntitle="ntitle";
				}else if(val.equals("ncontent")) {
					model.addAttribute("ncontent","true"); //검색유지
					ncontent="ncontent";
				}
			}
		}
		
		
		String searchKeyword=request.getParameter("sk");
		if(searchKeyword==null)
			searchKeyword="";
		System.out.println("searchKeyWord : "+searchKeyword);
		
		
		
//		paging
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : "+strPage);
		if(strPage==null)
			strPage="1";
		System.out.println("strPage2 : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		
//		totcnt
		int total=0;
		if(ntitle.equals("ntitle") && ncontent.equals("")) {
			total=noticemapper.selectBoardTotCount1(searchKeyword);
		}else if(ntitle.equals("") && ncontent.equals("ncontent")) {
			total=noticemapper.selectBoardTotCount2(searchKeyword);
		}else if(ntitle.equals("ntitle") && ncontent.equals("ncontent")) {
			total=noticemapper.selectBoardTotCount3(searchKeyword);
		}else if(ntitle.equals("") && ncontent.equals("")) {
			total=noticemapper.selectBoardTotCount0(searchKeyword);
		}
			
		
		
		searchVO.pageCalculate(total);
		
		System.out.println("Totrowcnt : "+total);
		System.out.println("clickPage : "+strPage);
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("pageTot : "+searchVO.getTotPage());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		
		if(ntitle.equals("ntitle") && ncontent.equals("")) {
			model.addAttribute("noticeList",noticemapper.noticeList(rowStart,rowEnd,searchKeyword,"1"));
		}else if(ntitle.equals("") && ncontent.equals("ncontent")) {
			model.addAttribute("noticeList",noticemapper.noticeList(rowStart,rowEnd,searchKeyword,"2"));
		}else if(ntitle.equals("ntitle") && ncontent.equals("ncontent")) {
			model.addAttribute("noticeList",noticemapper.noticeList(rowStart,rowEnd,searchKeyword,"3"));
		}else if(ntitle.equals("") && ncontent.equals("")) {
			model.addAttribute("noticeList",noticemapper.noticeList(rowStart,rowEnd,searchKeyword,"0"));
		}
		
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);
		
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
		
		String nTitle=request.getParameter("nTitle");
		String nContent=request.getParameter("nContent");
	
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeWrite(nTitle,nContent);
	
		return "redirect:noticeList";
	}

	@RequestMapping(method=RequestMethod.GET,value="/noticeModify")  
	public String noticeModify(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeModify");
		
//		int nseq=(Integer.parseInt(request.getParameter("nseq")));
		String nseq=request.getParameter("nseq");
		String nTitle=request.getParameter("nTitle");
		String nContent=request.getParameter("nContent");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeModify(nseq,nTitle,nContent);
		
		return "redirect:noticeView";
		
	}
	
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeDelete");
		
		String nseq=request.getParameter("nseq");
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeDelete(nseq);
		
		return "redirect:noticeList";
	}
	
}
