package com.tech.booksajo.mypage.api;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.mypage.service.MypageService;
import com.tech.booksajo.mypage.vo.Myinfomation;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value = "/mypage/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return mypageService.getList();
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		
		
		Myinfomation meme=new Myinfomation();
		
		meme=mypageService.userinfo();
		
		model.addAttribute("myinfo", meme);
		
		return "mypage";
	}
	

	
	
	@RequestMapping("/mycontents")
	public String mycontents(Model model) {
		
		System.out.println("mycontents 맵핑 들어옴");
		
		return "mycontents";
	}
	

	@RequestMapping("/myinfo")
	public String myInfo(Model model) {
	
		System.out.println("mypage인포 맵핑들어옴");
		//회원 정보 가져와서 뿌려주기
		
		Myinfomation meme=new Myinfomation();
		
		meme=mypageService.userinfo();
		
		model.addAttribute("myinfo", meme);
		
		//리턴 받은것 모델에 담아서 보내주긔
		
		return "myinfo";
	}
	
	
	@RequestMapping("/mypage_center2")
	public String mypage_center2(Model model) {
		
		Myinfomation meme=new Myinfomation();
		
		meme=mypageService.userinfo();
		
		model.addAttribute("myinfo", meme);
		
		return "mypage_center2";
	}
	
	
	
}
