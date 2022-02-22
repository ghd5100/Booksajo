package com.tech.booksajo.payment.api;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.payment.service.PaymentService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;

	
	SqlSession sqlsession;
	
/*	어토 와이어 두개서비스연결은 안되나보네 빈에러남
 * @Autowired
	boardService boardservice;*/

	
	@RequestMapping(value = "/payment/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> pList(){
		return paymentService.pList();
	}	
	
	//자바딴에서 왔따갔다할때 써줘야함.
	//@ResponseBody는 ajax롤 보낼때 써주고
	//ajax 받을때 @RequestParam 을 쓴다 그런데 매개변수에대가 써줘야함

	@RequestMapping("payment")
	public String payment(HttpServletRequest request, Model model) {
		
		System.out.println("payment들어옴");
		String isbn13=request.getParameter("isbn");
		System.out.println(isbn13);
		
		//들어왔넹.
		
		return "payment";
	}
	

	
	
	

}
