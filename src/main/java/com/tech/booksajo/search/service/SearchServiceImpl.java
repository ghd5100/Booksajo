package com.tech.booksajo.search.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.search.mapper.SearchMapper;
import com.tech.booksajo.search.vo.SearchVO;
import com.tech.booksajo.search.vo.SearchView;

@Service(value = "searchService")
public class SearchServiceImpl implements SearchService {
	
	ArrayList<Object> jarrlist=new ArrayList<Object>();
	
	@Autowired
	SearchMapper searchmapper;

	/*
	 * @Override public List<Map<String, Object>> getList() { return
	 * searchmapper.getList(); }
	 */

	@Override
	public List<Map<String, Object>> slist(Map<String, Object> requestDto) {

		List<Map<String, Object>> result = null;

		System.out.println("=========pass by list()=============");

		boolean btitle = (boolean) requestDto.get("btitle");
		boolean bcontent = (boolean) requestDto.get("bcontent");
		String searchKeyword = (String) requestDto.get("searchKeyword");

		int listValue;
		if (requestDto.get("listValue") == null) {
			listValue = 1;
		} else {
			listValue = Integer.parseInt(requestDto.get("listValue").toString());
		}

		int page = listValue;

		SearchVO searchVO = new SearchVO();
		searchVO.setPage(page);

		int total = 0; // 珥덇린�솕 �떆�궎怨�
		if (btitle == true && bcontent == false) { // ���씠���씠 �꽑�깮�릺怨� 而⑦뀗�듃媛� �꽑�깮�븞�뤌�엳�쓣�뻹
			total = searchmapper.selectBoardTotCount1(searchKeyword);
		} else if (btitle == false && bcontent == true) { // 而⑦깲�듃留� �꽑�깮
			total = searchmapper.selectBoardTotCount2(searchKeyword);
		} else if (btitle == true && bcontent == true) { // �몮�떎 �꽑�깮�맖
			total = searchmapper.selectBoardTotCount3(searchKeyword);
		} else if (bcontent == false && bcontent == false) { // 紐⑤몢 �꽑�깮 �븞�릪
			total = searchmapper.selectBoardTotCount0(searchKeyword);
		}

		searchVO.pageCalculate(total);

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		/* 4媛쒖쓽 寃쎌슦媛��깮湲대떎. */
		if (btitle == true && bcontent == false) { // ���씠���씠 �꽑�깮�릺怨� 而⑦뀗�듃媛� �꽑�깮�븞�뤌�엳�쓣�뻹
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "1");
		} else if (btitle == false && bcontent == true) { // 而⑦깲�듃留� �꽑�깮
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "2");
		} else if (btitle == true && bcontent == true) { // �몮�떎 �꽑�깮�맖
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "3");
		} else if (bcontent == false && bcontent == false) { // 紐⑤몢 �꽑�깮 �븞�릪
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "0");
		}

		System.out.println("Totpage : " + total);
		System.out.println("clickPage : " + listValue);
		System.out.println("pageStart : " + searchVO.getPageStart());
		System.out.println("pageEnd : " + searchVO.getPageEnd());
		System.out.println("pageTot : " + searchVO.getTotPage());
		System.out.println("rowStart : " + searchVO.getRowStart());
		System.out.println("rowEnd : " + searchVO.getRowEnd());

		// 留덉�留� 諛곗뿴濡� �삩寃껋� �럹�씠吏뺤젙蹂�
		Map<String, Object> tempMap = new HashMap();
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
		searchmapper.write(bName, bTitle, bContent);

	}

	@Override
	public Map<String, Object> content_view(String bid) {
		Map<String, Object> result = null;
		searchmapper.upHit(bid);
		result = searchmapper.contentView(bid);
		return result;
	}

	@Override
	public List<Map<String, Object>> sList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> keywordget(String isbn13) throws Exception {

		ArrayList<Object> keywordlist = new ArrayList<Object>();
		
		System.out.println("keywordget매소드 들어옴");

		String serviceKey = "http://data4library.kr/api/keywordList?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69";
		String urlStr = serviceKey + "&isbn13=" + isbn13 + "&additionalYN=Y&format=json";

		URL url = new URL(urlStr);

		BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream()));

		try {

			String jstr = bf.readLine();

			String strJson = jstr;

			// 2. Parser
			JSONParser jsonParser = new JSONParser();

			// 3. To Object
			Object obj = jsonParser.parse(strJson);

			// 4. To JsonObject
			JSONObject jsonObj = (JSONObject) obj;

			// print
			System.out.println(jsonObj.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨

			Object responseObj = jsonObj.get("response");
			JSONObject json1 = (JSONObject) responseObj;

			System.out.println();

			System.out.println("json1.get아이템:"+json1.get("items")); // sim

			// 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고.
			// 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			JSONArray jarr = (JSONArray) json1.get("items");

			
			

			// 이거는 리스트를 만들어서 리스트에 인덱스안 안에 정보 다 쌓이도록하는거고...
			//내부리스트가 있느것은 제이슨 오브젝트타입에서 겟으로 얻어온 다중구조를 오브젝트로 담아주고 -> 그 담아준것을 다시 제이슨오브젝트로 강제형변환해준것으로 변수다시 담아주고. 이렇게 내부로 들어가기
			
			//이거는 제이슨 자료가 여러개가아니야 딱 한 도서 정보만 나오는 거니까... 포문으로 돌릴 이유가없다. 하지만 리스트는 돌려야함
			
			

			
			
		
			SearchView sv=new SearchView();
			
			for (int i=0; i < jarr.size(); i++) {
			    jarr.get(i);
			    System.out.println(jarr.get(i));
			    keywordlist.add(jarr.get(i));
			    sv.setWordlist(keywordlist);
			   
			    
			}
			
			
		/*	
			for (JSONObject objarr : jarr) {

				System.out.println("obj2:"+objarr);
				
				JSONObject json2obj =  (JSONObject) obj2;
				
				System.out.println("json2obj:"+json2obj.get("item"));
				
				JSONObject itemword = (JSONObject) json2obj.get("word");
				
				System.out.println("가중치1:"+itemword.get("weight"));
				System.out.println("키워드1:"+itemword.get("word"));
				//System.out.println("아이템1:"+jsonitem.get("item")); //이미 item내부라서 없는건가봄..
				
				
				//제이슨오브젝트타입-> 어레이 
				jarr2 = (JSONArray) itemword.get("word");
				// 다시 오브젝트로 담아주고 -> 제이슨오브젝트로 강제형변환 
				
				

			}
			
			
			
			
			/*for (Object obj3 : jarr2) {
				JSONObject json3obj = (JSONObject) obj3;
				//제이슨 오브젝트로부터 다시 겟으로 얻기 내부것
				//JSONObject jsonweight = (JSONObject) json3obj.get("weight");
				JSONObject jsonword = (JSONObject) json3obj.get("word");
				//System.out.println("가중치2:"+jsonweight.get("weight"));
				System.out.println("키워드2"+jsonword.get("word"));
			}*/

			/*for (Object obj3 : jarr2) {

				System.out.println(obj3);
				JSONObject json3obj = (JSONObject) obj3;
				JSONObject jsonweight = (JSONObject) json3obj.get("weight");
				JSONObject jsonword = (JSONObject) json3obj.get("word");
				System.out.println("가중치2:"+jsonweight.get("weight"));
				System.out.println("키워드2"+jsonword.get("word"));

				// 키워드 오브젝트 담아줄 리스트 멩글기
				

				// 하나씩 쌓아주는 작업 키워드
				//SearchView keyword = new SearchView();
				//keywordlist.add((Map<String, Object>) jsonword.get("word")); // 인덱스 0번에 하나씩 쌓는다... 끝까지 word쌓기

				//System.out.println("최종담은것:" + jsonword.toString());

				// jsonitem가 안들어가는 이유는 이거는 제이슨 오브젝트이니까 타입을 JsonObject로 만들어줘야 담고.
				// ArrayList는 리스트니까 Jsonlist타입인 jarr를 담을수있는거고 . 담을수있는 타입을 잘 구분해야한다.
				// 위에서 다쌓아준 것을 변수모음 장소에다가 저장해준다. 꺼내쓸수있게
				//keyword.setWordlist(keywordlist);
				// System.out.println(keyword.getWordlist().toString());
			}
*/
		} catch (

		Exception e) {

		}

		return keywordlist;
	}

	/*
	 * @Override public List<Map<String, Object>> slist(Map<String, Object>
	 * requestDto) { // TODO Auto-generated method stub return null; }
	 */

}
