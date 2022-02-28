package com.tech.booksajo.payment.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.mypage.vo.Myinfomation;
import com.tech.booksajo.payment.mapper.PaymentMapper;
import com.tech.booksajo.payment.vo.PayInfomation;
import com.tech.booksajo.search.mapper.SearchMapper;
import com.tech.booksajo.search.vo.SearchVO;



@Service(value="paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentMapper paymentmapper;

	
	SqlSession sqlsession;
	
/*	@Override
	public List<Map<String, Object>> getList() {
		return searchmapper.getList();
	}
	*/
	
@Override
public List<Map<String,Object>> plist(Map<String,Object> requestDto) {
	
	List<Map<String,Object>>  result = null;

	System.out.println("=========pass by list()=============");

	boolean btitle = (boolean) requestDto.get("btitle");
	boolean bcontent = (boolean) requestDto.get("bcontent"); 
	String searchKeyword = (String) requestDto.get("searchKeyword"); 
	
	
	int listValue;
	if(requestDto.get("listValue") == null) {
		listValue = 1;
	}else {
		listValue = Integer.parseInt(requestDto.get("listValue").toString());
	}
	

	
	int page = listValue;
	
	SearchVO searchVO = new SearchVO();
	searchVO.setPage(page);

	int total = 0; //珥덇린�솕 �떆�궎怨�
	if (btitle == true && bcontent == false) { //���씠���씠 �꽑�깮�릺怨� 而⑦뀗�듃媛� �꽑�깮�븞�뤌�엳�쓣�뻹
		total=paymentmapper.selectBoardTotCount1(searchKeyword);
	}else if (btitle == false && bcontent == true ) { //而⑦깲�듃留� �꽑�깮
		total=paymentmapper.selectBoardTotCount2(searchKeyword);
	}else if (btitle == true && bcontent == true ) { //�몮�떎 �꽑�깮�맖
		total=paymentmapper.selectBoardTotCount3(searchKeyword);
	}else if ( bcontent == false  && bcontent == false ) { //紐⑤몢 �꽑�깮 �븞�릪
		total=paymentmapper.selectBoardTotCount0(searchKeyword);
	}

	searchVO.pageCalculate(total);

	int rowStart = searchVO.getRowStart();
	int rowEnd = searchVO.getRowEnd();

	

	

	/*4媛쒖쓽 寃쎌슦媛��깮湲대떎.*/
	if (btitle == true && bcontent == false) { //���씠���씠 �꽑�깮�릺怨� 而⑦뀗�듃媛� �꽑�깮�븞�뤌�엳�쓣�뻹
		result = paymentmapper.list(rowStart, rowEnd, searchKeyword, "1");
	}else if (btitle == false && bcontent == true ) { //而⑦깲�듃留� �꽑�깮
		result = paymentmapper.list(rowStart, rowEnd, searchKeyword, "2");
	}else if (btitle == true && bcontent == true ) { //�몮�떎 �꽑�깮�맖
		result = paymentmapper.list(rowStart, rowEnd, searchKeyword, "3");
	}else if ( bcontent == false  && bcontent == false ) { //紐⑤몢 �꽑�깮 �븞�릪
		result = paymentmapper.list(rowStart, rowEnd, searchKeyword, "0");
	}

	System.out.println("Totpage : "+total);
	System.out.println("clickPage : "+listValue);
	System.out.println("pageStart : "+searchVO.getPageStart());
	System.out.println("pageEnd : "+searchVO.getPageEnd());
	System.out.println("pageTot : "+searchVO.getTotPage());
	System.out.println("rowStart : "+searchVO.getRowStart());
	System.out.println("rowEnd : "+searchVO.getRowEnd());
	
	
	
	//留덉�留� 諛곗뿴濡� �삩寃껋� �럹�씠吏뺤젙蹂�
	Map<String,Object> tempMap = new HashMap();
	tempMap.put("totRowCnt", total);
	tempMap.put("clickPage", listValue);
	tempMap.put("pageStart", searchVO.getPageStart());
	tempMap.put("pageEnd", searchVO.getPageEnd());
	tempMap.put("pageTot", searchVO.getTotPage());
	tempMap.put("rowStart", searchVO.getRowStart());
	tempMap.put("rowEnd", searchVO.getRowEnd());
	tempMap.put("page", searchVO.getPage());
	tempMap.put("totPage", searchVO.getTotPage());
	result.add(tempMap);

	
	return result;
}



	@Override
	public void write(String bName, String bTitle, String bContent) {
		paymentmapper.write(bName, bTitle, bContent);
		
	}

	@Override
	public Map<String, Object> content_view(String bid) {
		Map<String, Object> result = null;
		paymentmapper.upHit(bid);
		result = paymentmapper.contentView(bid);
		return result;
	}



	@Override
	public List<Map<String, Object>> pList() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Myinfomation getuser() {
		
		//서비스 못들어온이유.. 서비스 대소문자...젠장 
		//오류내용:  Request processing failed; nested exception is org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.tech.booksajo.payment.service.PaymentService.getuser
		System.out.println("getuser매소드 들어왔나여");
		//Myinfomation meme=new Myinfomation();
		
		//왜 이렇게 리턴해주면안될까?
		//meme=paymentmapper.getusers();
		
		return paymentmapper.getuserinfo();
	}



	@Override
	public ArrayList<Object> insertwork(ArrayList<String> selectisbnlist, ArrayList<Integer> countlist) throws Exception {
		
		PreparedStatement pstmt;
		ArrayList<Object> paymentbook=new ArrayList<Object>();
		//디비에 한줄한줄 넣어주는 작업하기..
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//접속
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="hr";
			String pw="123456";
			Connection con=DriverManager.getConnection(url, user, pw);
			System.out.println("성공");
			
/*		
			PAYMENT_ISBN	VARCHAR2(20 BYTE)
			PAYMENT_COUNT	NUMBER
	*/	
			
			for (int i = 0; i < selectisbnlist.size(); i++) {
				
			String sql="insert into BSJPAYMENT_BOOK values(?,?)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, selectisbnlist.get(i));
			pstmt.setInt(2, countlist.get(i));
			
			pstmt.executeUpdate();
			
			}
		
			
			//디비에서 리스트로 가져오기
			
			paymentbook=paymentmapper.paymentlist();
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return paymentbook;
	}



	@Override
	public void insertpayinfo(String a ,String b) {
		paymentmapper.insertpayinfo(a,b);
		
	}



	@Override
	public ArrayList<Object> getpayinfo() {
		
		ArrayList<Object> payarr=new ArrayList<Object>();
		payarr=paymentmapper.getpayinfo();
		
		return payarr;
	}



}
