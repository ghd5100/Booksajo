package com.tech.booksajo.login.api;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.login.mapper.LoginMapper;
import com.tech.booksajo.login.service.LoginService;
import com.tech.booksajo.login.util.BCrypt;
import com.tech.booksajo.login.util.EmailSHA;
import com.tech.booksajo.login.util.Gmail;
import com.tech.booksajo.login.util.SHA256;
import com.tech.booksajo.login.vo.SignInVO;


import lombok.RequiredArgsConstructor;


//이현빈login
@Controller
@RequiredArgsConstructor
public class LoginController {
	
	@Autowired
	LoginService loginservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/login/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return loginservice.getList();
	}
	
	@RequestMapping(value="/signIn", method=RequestMethod.GET)
	public String goSign() {
		
		
		return "signIn_center";
	}
	
	@RequestMapping(value="/signInProc", method=RequestMethod.POST)
	public String goSignProc(HttpServletRequest request, Model model) {
		System.out.println("===========join=========");
		model.addAttribute("request",request);
		
		
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pwd");
		String nick=request.getParameter("nickname");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String postcode=request.getParameter("postcode");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String addr=addr1+" "+addr2;
		String email=request.getParameter("email");
		
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		System.out.println("nick : "+nick);
		System.out.println("gender : "+gender);
		System.out.println("age : "+age);
		System.out.println("name : "+name);
		System.out.println("phone : "+phone);
		System.out.println("postcode : "+postcode);
		System.out.println("addr1 : "+addr1);
		System.out.println("addr2 : "+addr2);
		System.out.println("email : "+email);
//		

		
		
		
		String shpwd="";
		String bcpwd="";
		try {
			SHA256 sha=SHA256.getInsatnce();
			shpwd = sha.getSha256(pw.getBytes());
			bcpwd = BCrypt.hashpw(shpwd, BCrypt.gensalt());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);

//		join 처리전 전에 id, nickname 중복체크
	
		
		int idCheckResult=idCheck(id);
		System.out.println("id check : "+idCheckResult);
		
		int nickCheckResult=nickCheck(nick);
		System.out.println("nick check : "+nickCheckResult);
		
		if(idCheckResult==0 && nickCheckResult==0) {
			
//			join 처리
			int insertResult=logMap.signInProc(id,nick,gender,age,name,
					phone,postcode,addr,email,shpwd,bcpwd);
//			System.out.println("hihihihih:"+insertResult);
			if(insertResult==1) {//성공
				emailSendAction(id);
				return "redirect:/";
			}else {
				return "redirect:/signIn";
			}
			
			
			
			
			
		}else if(idCheckResult==1 && nickCheckResult==0) {
			System.out.println("아이디있음");
			return "redirect:/signIn";
		}else if(idCheckResult==0 && nickCheckResult==1) {
			System.out.println("닉네일있음");	
			return "redirect:/signIn";
		}else {
			return "redirect:/signIn";
		}
		
		
		
		
		
		
//		
		
		
//		===============
		
		/*if(result==1) {//성공
			request.getSession().setAttribute("memberNickname", nickname);
			emailSendAction(id);
//			return "member/sendMail";
			return "redirect:/";
		}else if(result==-1){//ID 중복
			return "iddupl";
		}else if(result==-2){//닉네임 중복
			return "nndupl";
		}else {
			return "error";
		}
	}
	
	
	private void emailSendAction(String id) {
		// TODO Auto-generated method stub
*/		
//		return "redirect:/";
	}

	private void emailSendAction(String id) {
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);

//		join 처리전 전에 id, nickname 중복체크
	
		
		int idCheckResult=idCheck(id);
		String host="http://localhost:9007/booksajo/";
		
		String from="hyunbinl236@gmail.com";
		SignInVO signInVO=logMap.idCheck(id);
		
		String to=signInVO.getUser_email();
		String code=new EmailSHA().getSHA256(to);
		String subject="회원가입 인증을 위한 메일입니다.";
		String content="다음 링크에 접속하여 이메일 인증을 진행하세요."+"<a href='"+host+"emailCheck?code="+code+"&id="+id+"'>이메일 인증하기</a>";
		
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}

	private int nickCheck(String nick) {
		// TODO Auto-generated method stub
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);

//		join 처리
		SignInVO signInVO=logMap.nickCheck(nick);
		if(signInVO==null) {
			System.out.println("닉 없음");
			return 0;
		}else {
		
			System.out.println("닉 있음");
			return 1;
		}
		
	}

	private int idCheck(String id) {
		String sql="select * from jmember where id = ?";
		
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);

//		join 처리
		SignInVO signInVO=logMap.idCheck(id);
		if(signInVO==null) {
			System.out.println("아이디 없음");
			return 0;
		}else {
		
			System.out.println("아이디 있음");
			return 1;
		}
		
		
//		try {
//			con = dataSource.getConnection();
//			ps=con.prepareStatement(sql);
//			ps.setString(1, id);
//			rs=ps.executeQuery();
//			if(rs.next()){
//				return 1;//이미 가입한 아이디
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
//			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
//			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
//		}
//		return 0;//가입 가능
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String goLogin(HttpServletRequest request) {
		String isbn = request.getParameter("isbn");
		request.getSession().setAttribute("isbn", isbn);
		System.out.println("isbn : " + isbn);
		
		return "login_center";
	}
	
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	public String loginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		System.out.println("===========loginProc=========");
		model.addAttribute("request",request);
		
		
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pwd");
		
		
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);

		
		SHA256 Sha = SHA256.getInsatnce();
		String shaPass=Sha.getSha256(pw.getBytes());
		Boolean idpwboolean=false;
		
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);
		SignInVO signInVO=logMap.loginProc(id,pw);
		String ypass="";
		int x=-1;
		String msg="";
		try {
			if(!signInVO.equals(null))
				System.out.println("loginresult : "+signInVO.getUser_shapw());
			else
				System.out.println("nulllllllll");
			
			if(!signInVO.equals(null) && signInVO.getUser_mailcheck()==1) {//메일확인이 끝난상태확인
				idpwboolean =BCrypt.checkpw(shaPass, signInVO.getUser_bcpw());
				if(idpwboolean)
					x=1;
				else
					x=0;		
			}else {
				x=-1;
					
			}
		} catch (Exception e) {
			System.out.println("errorrrrrrr");
		}
		System.out.println("x :::: "+x);
		
		
		
		if(x==1) {//로그인 성공하면
			String isbn = (String) session.getAttribute("isbn");
			System.out.println("isbn : " + isbn);
			if (isbn != null) {
				request.getSession().setAttribute("userid", id);
				session.removeAttribute("isbn");
				return "redirect:search_detail?isbn="+isbn;
			} else {
				request.getSession().removeAttribute("error");
				request.getSession().setAttribute("userid", id);
				return "redirect:/";
				
			}
		}else {
			request.getSession().setAttribute("error", "Login Retry");
			return "redirect:login";
		}	
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session) {
		System.out.println("===========loginout=========");
		
		session.removeAttribute("userid");
		
		return "redirect:/login";
		
	}
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public String emailCheck(HttpServletRequest request, HttpSession session) {
		System.out.println("===========emailCheck=========");
		
		String code=request.getParameter("code");
		String id=request.getParameter("id");
		
		LoginMapper logMap=sqlSession.getMapper(LoginMapper.class);

//		join 처리
		SignInVO signInVO=logMap.idCheck(id);
		String email=signInVO.getUser_email();
		boolean isRight=(new EmailSHA().getSHA256(email).equals(code))?true:false;
		if(isRight==true){
			logMap.updateMemberEmailChecked(id);
			return "redirect:/";
		}else {
			return "error";//고드 구현 없음
		}
		
		
	}

}
