package com.tech.booksajo.notice.api;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class NoticeController {
	
	@Autowired
	NoticeService nservice;
	
	@RequestMapping(value = "/notice/api/getList", method = RequestMethod.POST  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return nservice.getList();
	}
	
	@RequestMapping("/notice")
	public String notice() {
		
		return "notice";
	}
	
	@RequestMapping("/notice_detail")
	public String notice_detail(ServletRequest request, Model model) {
		System.out.println("'공지사항 상세' 확인");
		String notice=request.getParameter("notice");
		model.addAttribute("notice",notice);
		
		return "notice_detail";
	}

}
