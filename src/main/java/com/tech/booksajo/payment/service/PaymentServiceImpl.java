package com.tech.booksajo.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.payment.mapper.PaymentMapper;
import com.tech.booksajo.search.mapper.SearchMapper;
import com.tech.booksajo.search.vo.SearchVO;


@Service(value="PaymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentMapper paymentmapper;

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



}
