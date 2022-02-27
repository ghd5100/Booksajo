package com.tech.booksajo.notice.api;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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


@Controller
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
		
		//주소창으로 강제접속 막는 조건식
//		String id = "";
//		
//		if (id != "admin") {
//			return "redirect:noticeList";
//		}
		
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
			if (brdtitle[0].indexOf(",") != -1) {
				for (int i = 0; i < brdtitle[0].indexOf(","); i++) {
					ntitle += brdtitle[0].charAt(i);
				}
				for (int i = brdtitle[0].indexOf(",") + 1; i < brdtitle[0].length(); i++) {
					ncontent += brdtitle[0].charAt(i);
				}
				model.addAttribute("ntitle","true");
				model.addAttribute("ncontent","true");
			} else {
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
		searchVO.setSearchKeyword(searchKeyword);
//		System.out.println("searchVO.getSearchKeywrod : " + searchVO.getSearchKeyword());
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
		searchVO.setSearchKeyword(searchKeyword);
		
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
		
//		System.out.println("searchVO : " + searchVO.getSearchKeyword());
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

	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeUpdate");
		
		String nseq=request.getParameter("nseq");
		System.out.println(nseq);
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		
		NoticeDto noticedto=noticemapper.noticeView(nseq);
		System.out.println("nseq : " + noticedto.getNseq());
		model.addAttribute("noticeView",noticedto);
		
		return "noticeUpdate";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/noticeModify")  
	public void noticeModify(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		System.out.println("pass by noticeModify");
		
	
//		int nseq=(Integer.parseInt(request.getParameter("nseq")));
		String nseq=request.getParameter("nseq");
		String nTitle=request.getParameter("nTitle");
		String nContent=request.getParameter("nContent");
		
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeModify(nseq,nTitle,nContent);
		response.sendRedirect("noticeView?nseq=" + nseq);
//		return "noticeView";
		
	}
	
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeDelete");
		
		String nseq=request.getParameter("nseq");

		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeDelete(nseq);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping("/noticeCancel")
	public String noticeCancle(HttpServletRequest request, Model model) {
		System.out.println("pass by noticeCancel");
		
		String nseq=request.getParameter("nseq");
		NoticeMapper noticemapper=sqlSession.getMapper(NoticeMapper.class);
		noticemapper.noticeCancel(nseq);
		
		return "redirect:noticeView";
	}
	
}
