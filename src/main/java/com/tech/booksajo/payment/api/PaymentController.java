package com.tech.booksajo.payment.api;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.mypage.mapper.mypageMapper;
import com.tech.booksajo.mypage.vo.Myinfomation;
import com.tech.booksajo.payment.service.PaymentService;
import com.tech.booksajo.payment.vo.KakaoPayApproval;
import com.tech.booksajo.payment.vo.PayInfomation;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;

	
	SqlSession sqlsession;
	
	
	KakaoPayApproval app=new KakaoPayApproval();
	String tid="";
	String pg_token="";
/*	어토 와이어 두개서비스연결은 안되나보네 빈에러남
 * @Autowired
	boardService boardservice;*/
	//KakaoPayApproval approveinfo;
	
	@RequestMapping(value = "/payment/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> pList(){
		return paymentService.pList();
	}	
	
	//자바딴에서 왔따갔다할때 써줘야함.
	//@ResponseBody는 ajax롤 보낼때 써주고
	//ajax 받을때 @RequestParam 을 쓴다 그런데 매개변수에대가 써줘야함

	@RequestMapping("/payment")
	public String payment(HttpServletRequest request, Model model, Myinfomation payme) {
		
		System.out.println("payment들어옴");
		String isbn13=request.getParameter("isbn");
		System.out.println(isbn13);
		
		//들어왔넹.
		
		//아이디와 회원포인트 정보넣어줄 테이블에서 정보가져오기 ..마이페이지에 있음. 
		//유저 아이디 같고 들어가기
		payme=paymentService.getuser();
		
		model.addAttribute("payinfo", payme);
		
		return "payment";
	}
	

	@GetMapping("kakaopay")
	@ResponseBody
	public String kakaopay(Model model) {//결제요청매소드
		
		//여기에 받아와야할거는 item_name, total_amount, vat_amount, quantity(수량)을 기입해줘야함...
		//디테일 페이지에서 들어오니까..
		
		//장바구니에서 가져오기
		
		
		String strJson="";
		
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 5e4890f4441fe723d54c9057602bef48"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:9007/booksajo/paymentApprove" // 결제 성공 시
					+ "&fail_url=http://localhost:9007/booksajo/paymentFail" // 결제 실패 시
					+ "&cancel_url=http://localhost:9007/booksajo/paymentCancel"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			
			/*여기에서 tid를 추출해서 전달해줘야겠다..제이슨타입으로 받을테니까..뽑아와야지..*/
			//tid가 맨날 바뀌니까 여기서 받아서 줘야겠다. 모델에 담아서.
			
			//System.out.println(change.readLine());

			//파싱
			try {
				//파싱 이어서 못받은 이유. 위에서 리드라인해버리면 커서가 위치가 끝으로가던가 이미 내용다 뽑아서 못뽑아내는듯 다시 뽑으려고하면
				//위에 시스아웃 리드라인 형성하면 못뽑아옴.. 데이터
				
				String jstr = change.readLine();

				strJson = jstr;

				// 2. Parser
				JSONParser jsonParser = new JSONParser();

				// 3. To Object
				Object obj = jsonParser.parse(strJson);

				// 4. To JsonObject
				JSONObject jsonObj = (JSONObject) obj;

				// print
				tid=(String) jsonObj.get("tid"); // 리스폰안에들어간 리퀘스트가 출력됨
				//파싱에 쓰이면 아래에서 리턴 값이 없어서 못해주네.. 값을 한군데어서만 사용한것같은데.. 어떠카지
				
				KakaoPayApproval app=new KakaoPayApproval();
				app.setTid(tid);
				
				System.out.println("요청하는 매소드에서 필드에서가져온tid:"+app.getTid());
				
				
			}catch (Exception e) {
				System.out.println("파싱에러");
			}


			//tid= 제이슨에서 뽑은 tid 정보
			
			//return "change.readLine()";
			System.out.println("kakaopay쪽 tid"+app.getTid());  //주문에 해당하는 고유 번호 
			
			return strJson; 
			// 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		////방법 tid를 변수로 넣어줘서 jsp에서 
		model.addAttribute("tid", app.getTid());
		
		return "";
	}


	@RequestMapping("/paymentApprove")
	@ResponseBody
	public String paymentApprove(HttpServletRequest request,Model model) { //결제 승인 매소드 여기서 문제...
	
		System.out.println("paymentApprove맵핑 들어왔나여?");
		
		pg_token=request.getParameter("pg_token");
		//String tid=request.getParameter("tid");//결제고유번호   
		System.out.println("승인하는쪽에서 받은pg_token:"+pg_token); //들어온것 확인함
		System.out.println("paymentApprove매소드안에 tid:"+tid);
		
		
		KakaoPayApproval app=new KakaoPayApproval();
		app.setTid(tid);
		
		//System.out.println("tid의 변수타입:"+tid.getClass().getSimpleName()); //스트링인데 왜 배치가 안됌..
		
		

		System.out.println("승인하는 매소드 필드에서가져온tid:"+app.getTid());
		
try {
	
	
			
			URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 5e4890f4441fe723d54c9057602bef48"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			/*T162187f781f12756456 결제 새로할때마다 tid가 계속 바뀌는 구나..tid받아와야함*/
			//T1621882b420f933413d
			
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&tid="+tid+""
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&pg_token="+pg_token+"";//하하 오타.. pg 앞에 큰따옴표를 하나 더 넣었네..
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)

			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {//제대로 받았을때
				receive = connection.getInputStream();
			}else { //못 받았을떄
				receive = connection.getErrorStream(); 
				System.out.println("못받아옴");
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			
			return change.readLine();
			//return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		return "";
	}
	

	@GetMapping("kakaopay2")
	@ResponseBody
	public String kakaopay2() {
		System.out.println("kakaopay2");
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 5e4890f4441fe723d54c9057602bef48"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=초코파이" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:9007/booksajo/index" // 결제 성공 시
					+ "&fail_url=http://localhost:9007/booksajo/search" // 결제 실패 시
					+ "&cancel_url=http://localhost:9007/booksajo/paymentCancel"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	
	@RequestMapping(value="/productInfo", method=RequestMethod.POST)
	public void productInfo(@RequestBody KakaoPayApproval info) throws Exception {
	
		System.out.println("==============productInfo들어옴");
		
		productInfo(info);
		
	
	//return "memberModify";
	}


	
}
