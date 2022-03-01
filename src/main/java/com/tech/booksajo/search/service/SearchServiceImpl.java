package com.tech.booksajo.search.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
import com.tech.booksajo.search.vo.ReviewDto;
import com.tech.booksajo.search.vo.SearchVO;
import com.tech.booksajo.search.vo.SearchView;
import com.tech.booksajo.search.vo.ShopView;
import com.tech.booksajo.search.vo.getcount;
import com.tech.booksajo.search.vo.UserSelect;

@Service(value = "searchService")
public class SearchServiceImpl implements SearchService {

<<<<<<< HEAD
	//임현주 key:bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69
=======
	//500번 이상 에러날때 키 바꾸기 (아래 바꿔야하는 key부분 4개있음)
	//현주언니 kdy: bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69
>>>>>>> master
	//경섭씨 key:72e70652c089ddede639f01b2e237eebaf6f5ec4bbd2b6ceee0bc852b0ee32b2
	
	ArrayList<Object> jarrlist = new ArrayList<Object>();

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

		int total = 0; // 珥덇린 솕 떆 궎怨
		if (btitle == true && bcontent == false) { // 씠 씠 꽑 깮 릺怨 而⑦뀗 듃媛 꽑 깮 븞 뤌 엳 쓣 뻹
			total = searchmapper.selectBoardTotCount1(searchKeyword);
		} else if (btitle == false && bcontent == true) { // 而⑦깲 듃留 꽑 깮
			total = searchmapper.selectBoardTotCount2(searchKeyword);
		} else if (btitle == true && bcontent == true) { // 몮 떎 꽑 깮 맖
			total = searchmapper.selectBoardTotCount3(searchKeyword);
		} else if (bcontent == false && bcontent == false) { // 紐⑤몢 꽑 깮 븞 릪
			total = searchmapper.selectBoardTotCount0(searchKeyword);
		}

		searchVO.pageCalculate(total);

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		/* 4媛쒖쓽 寃쎌슦媛 깮湲대떎. */
		if (btitle == true && bcontent == false) { // 씠 씠 꽑 깮 릺怨 而⑦뀗 듃媛 꽑 깮 븞 뤌 엳 쓣 뻹
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "1");
		} else if (btitle == false && bcontent == true) { // 而⑦깲 듃留 꽑 깮
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "2");
		} else if (btitle == true && bcontent == true) { // 몮 떎 꽑 깮 맖
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "3");
		} else if (bcontent == false && bcontent == false) { // 紐⑤몢 꽑 깮 븞 릪
			result = searchmapper.list(rowStart, rowEnd, searchKeyword, "0");
		}

		System.out.println("Totpage : " + total);
		System.out.println("clickPage : " + listValue);
		System.out.println("pageStart : " + searchVO.getPageStart());
		System.out.println("pageEnd : " + searchVO.getPageEnd());
		System.out.println("pageTot : " + searchVO.getTotPage());
		System.out.println("rowStart : " + searchVO.getRowStart());
		System.out.println("rowEnd : " + searchVO.getRowEnd());

		// 留덉 留 諛곗뿴濡 삩寃껋 럹 씠吏뺤젙蹂
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

			System.out.println("json1.get아이템:" + json1.get("items")); // sim

			// 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고.
			// 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			JSONArray jarr = (JSONArray) json1.get("items");

			// 이거는 리스트를 만들어서 리스트에 인덱스안 안에 정보 다 쌓이도록하는거고...
			// 내부리스트가 있느것은 제이슨 오브젝트타입에서 겟으로 얻어온 다중구조를 오브젝트로 담아주고 -> 그 담아준것을 다시 제이슨오브젝트로
			// 강제형변환해준것으로 변수다시 담아주고. 이렇게 내부로 들어가기

			// 이거는 제이슨 자료가 여러개가아니야 딱 한 도서 정보만 나오는 거니까... 포문으로 돌릴 이유가없다. 하지만 리스트는 돌려야함

			SearchView sv = new SearchView();

			for (int i = 0; i < jarr.size(); i++) {
				jarr.get(i);
				System.out.println(jarr.get(i));
				keywordlist.add(jarr.get(i));
				sv.setWordlist(keywordlist);

			}

			/*
			 * for (JSONObject objarr : jarr) {
			 * 
			 * System.out.println("obj2:"+objarr);
			 * 
			 * JSONObject json2obj = (JSONObject) obj2;
			 * 
			 * System.out.println("json2obj:"+json2obj.get("item"));
			 * 
			 * JSONObject itemword = (JSONObject) json2obj.get("word");
			 * 
			 * System.out.println("가중치1:"+itemword.get("weight"));
			 * System.out.println("키워드1:"+itemword.get("word"));
			 * //System.out.println("아이템1:"+jsonitem.get("item")); //이미 item내부라서 없는건가봄..
			 * 
			 * 
			 * //제이슨오브젝트타입-> 어레이 jarr2 = (JSONArray) itemword.get("word"); // 다시 오브젝트로 담아주고
			 * -> 제이슨오브젝트로 강제형변환
			 * 
			 * 
			 * 
			 * }
			 * 
			 * 
			 * 
			 * 
			 * /*for (Object obj3 : jarr2) { JSONObject json3obj = (JSONObject) obj3; //제이슨
			 * 오브젝트로부터 다시 겟으로 얻기 내부것 //JSONObject jsonweight = (JSONObject)
			 * json3obj.get("weight"); JSONObject jsonword = (JSONObject)
			 * json3obj.get("word"); //System.out.println("가중치2:"+jsonweight.get("weight"));
			 * System.out.println("키워드2"+jsonword.get("word")); }
			 */

			/*
			 * for (Object obj3 : jarr2) {
			 * 
			 * System.out.println(obj3); JSONObject json3obj = (JSONObject) obj3; JSONObject
			 * jsonweight = (JSONObject) json3obj.get("weight"); JSONObject jsonword =
			 * (JSONObject) json3obj.get("word");
			 * System.out.println("가중치2:"+jsonweight.get("weight"));
			 * System.out.println("키워드2"+jsonword.get("word"));
			 * 
			 * // 키워드 오브젝트 담아줄 리스트 멩글기
			 * 
			 * 
			 * // 하나씩 쌓아주는 작업 키워드 //SearchView keyword = new SearchView();
			 * //keywordlist.add((Map<String, Object>) jsonword.get("word")); // 인덱스 0번에 하나씩
			 * 쌓는다... 끝까지 word쌓기
			 * 
			 * //System.out.println("최종담은것:" + jsonword.toString());
			 * 
			 * // jsonitem가 안들어가는 이유는 이거는 제이슨 오브젝트이니까 타입을 JsonObject로 만들어줘야 담고. //
			 * ArrayList는 리스트니까 Jsonlist타입인 jarr를 담을수있는거고 . 담을수있는 타입을 잘 구분해야한다. // 위에서 다쌓아준
			 * 것을 변수모음 장소에다가 저장해준다. 꺼내쓸수있게 //keyword.setWordlist(keywordlist); //
			 * System.out.println(keyword.getWordlist().toString()); }
			 */
		} catch (

		Exception e) {

		}

		return keywordlist;
	}

	public ArrayList<String> categoryget(String search) throws IOException, Exception {

		// 카테고리 자겨오긔..

		ArrayList<Object> categorylist = new ArrayList<Object>();
		ArrayList<String> isbnlist = new ArrayList<String>();

		System.out.println("categoryget매소드 들어옴");

		String search2 = URLEncoder.encode(search, "UTF-8");
		// http://data4library.kr/api/srchBooks?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69&keyword=%EC%9E%90%EB%B0%94&pageNo=1&pageSize=30&format=json

		// String
		// urlStr="http://data4library.kr/api/srchBooks?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69&keyword="
		// + search +"&pageNo=1&pageSize=30&format=json";

		String serviceKey = "http://data4library.kr/api/srchBooks?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69";
		String urlStr = serviceKey + "&keyword=" + search2 + "&pageNo=1&pageSize=10&format=json";
		// &gender=0&from_age=6&to_age=10

		// 기입할때... 도서나루 json타입 확인할떄 주소... 다포맷 다 설정한다음에 마지막에 인증키를 넣어줘야 페이지 에러가 안남..
		// 인터넷연결해서 자료 확인할떄...
		// 키워드가 한글로 들어갔을떄 발생한느 에러..
		// api호출시 404에러날때는 주소에 공백있으면 에러날때도있음.. 그러므로 붙여서 써주기... 그리고 한글로 받을때 인코딩 변경해서
		// 현글받아오게 넣어줘야함..
		// 한글부분만 인코딩변형해주기

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
			// System.out.println(jsonObj.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨

			Object responseObj = jsonObj.get("response");
			JSONObject json1 = (JSONObject) responseObj;

			// System.out.println("json1.get의 docs:" + json1.get("docs")); // sim

			// 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고.
			// 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			JSONArray jarr = (JSONArray) json1.get("docs");

			// 이거는 리스트를 만들어서 리스트에 인덱스안 안에 정보 다 쌓이도록하는거고...
			// 내부리스트가 있느것은 제이슨 오브젝트타입에서 겟으로 얻어온 다중구조를 오브젝트로 담아주고 -> 그 담아준것을 다시 제이슨오브젝트로
			// 강제형변환해준것으로 변수다시 담아주고. 이렇게 내부로 들어가기

			// 이거는 제이슨 자료가 여러개가아니야 딱 한 도서 정보만 나오는 거니까... 포문으로 돌릴 이유가없다. 하지만 리스트는 돌려야함

			SearchView sv = new SearchView();

			for (int i = 0; i < jarr.size(); i++) {
				// System.out.println("jarr.get(i):" + jarr.get(i));
				// 다시 오브젝트로담아주긔 위에 리스트를 오브젝트 리스트를 멩글어야함.
				categorylist.add(jarr.get(i)); // 오브젝트로 담겨짐.

			}

			JSONArray arrydoc = new JSONArray();

			for (Object object : categorylist) {
				JSONObject objj = (JSONObject) object; // 이거 오브제로 콘솔에서 출력됨
				arrydoc.add(objj.get("doc"));
				// System.out.println("요기:" + objj.get("doc"));
			}
			// doc에있는거 다 담았구..

			// 여기서 isbn들만 추출해보쟈

			System.out.println("==========================================");
			System.out.println(arrydoc);

			for (Object object2 : arrydoc) {
				// System.out.println("arrddoclist임" + object2);
				JSONObject objj2 = (JSONObject) object2;
				// System.out.println("isbn13:" + objj2.get("isbn13"));
				// 틀린이유 키를 isbn13이라고안하고 isbn으러했넹
				isbnlist.add((String) objj2.get("isbn13"));

			}

			// 제이슨타입이 들어오기까지 좀 걸리네.. 새로고침 많이해야하는듯.

			// 이제 위에 모아준 isbn을 가지고 ... 카테고리 뽑아오기 대분류랑. 소분류까지만..
			// 도서상세조회

			// http://data4library.kr/api/srchDtlList?authKey=[발급받은키]&isbn13=9788972756194&loaninfoYN=Y&displayInfo=age

			// 도서관별 장서/대출 데이터 조회
			// http://data4library.kr/api/itemSrch?type=ALL&libCode=[도서관코드]&authKey=[발급받은키]&pageNo=1&pageSize=10
			// page 5에보면 isbn13 은 ; 로 구분된 복수의 항목 입력 가능(최대 5 개)

			// 그럼 5개의 카테고리만 뽑아보자.

			// 그러면 여러개 isbn사용할때 쓰는 것
			// ;로 연결이 안됌..다른책을 읽어오니까

			/*
			 * for (String s : isbnlist) { System.out.println(s); }
			 */

			String add = "";
			String add2 = "";
			for (int i = 0; i < 5; i++) {
				String str = isbnlist.get(i);
				add = add.concat(str + ";");
				int last = add.lastIndexOf(";");
				add2 = add.substring(0, last);
			}
			// System.out.println("붙여쓴거는:" + add2);

			ArrayList<String> class_nolist = new ArrayList<String>();
			ArrayList<String> class_nmlist = new ArrayList<String>();
			ArrayList<Object> finallist = new ArrayList<Object>();
			ArrayList<Object> arrydoc2 = new ArrayList<Object>();

			// 4번 인덱스에서 어러남 값이 없어서
			// System.out.println("isbnlist사이즈는:"+isbnlist.size());
			// System.out.println("j번호:"+j);

			String serviceKey2 = "http://data4library.kr/api/itemSrch?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69&type=ALL&libCode=111111";
			// String urlStr2 = serviceKey2 + "&isbn13="
			// +isbnlist.get(0)+";"+isbnlist.get(1)+";"+isbnlist.get(2)+";"+isbnlist.get(3)+";"+isbnlist.get(4)+
			// "&pageNo=1&pageSize=15&format=json";
			String urlStr2 = serviceKey2 + "&isbn13=" + add2 + "&pageNo=1&pageSize=30&format=json";

			// 1권밖에 안나온이유. +와 ";"사이 띄어쓰기해서
			// System.out.println("urlStr2:" + urlStr2);

			URL url2 = new URL(urlStr2);

			BufferedReader bf2 = new BufferedReader(new InputStreamReader(url2.openStream()));

			String jstr2 = bf2.readLine();

			String strJson2 = jstr2;

			// 2. Parser
			JSONParser jsonParser2 = new JSONParser();

			// 3. To Object
			Object obj2 = jsonParser2.parse(strJson2);

			// 4. To JsonObject
			JSONObject jsonObj2 = (JSONObject) obj2;

			// print
			// System.out.println(jsonObj2.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨

			Object responseObj2 = jsonObj2.get("response");
			JSONObject json12 = (JSONObject) responseObj2;

			System.out.println();

			// System.out.println("json12.get의 docs:" + json12.get("docs")); // sim

			// 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고.
			// 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			JSONArray jarr2 = (JSONArray) json12.get("docs");

			System.out.println("=====================");
			System.out.println(jarr2);

			// doc에있는거 다 담았구..
			// 여기서 isbn들만 추출해보쟈

			System.out.println("크기");
			System.out.println(arrydoc2.size());

			// for (Object object21 : arrydoc2) {
			//
			//
			//
			// //System.out.println("arrydoc2임" + object21);
			// JSONObject objj23 = (JSONObject) object21;
			// //System.out.println("class_no:" + objj23.get("class_no"));
			// //System.out.println("class_nm:" + objj23.get("class_nm")); // 이거는 디테일 페이지에서
			// 쓸수있겠다.
			//
			//
			//
			// class_nolist.add((String) objj23.get("class_no")); //번호분류
			// class_nmlist.add((String) objj23.get("class_nm")); //이름분류
			// //중간에 안나온이유... class_nmlist 초기선언을 null로 해서 그렇네...
			// }

			for (String string : class_nolist) {
				System.out.println("KDC출력:" + string);
			}
			/*
			 * 
			 * for (String classSmall : class_nmlist) {
			 * System.out.println("카테고리분류:"+classSmall); }
			 * 
			 */

			// 아무래도 카테고리 없는애들이 뒤에서 에러생기게하는듯 제대로 진행안돼게

			// 다 뽑았다. 이제 추려서... 카테고리 창에다가 뿌려주긔.. 표기해주긔

			// 자바쳤을때.치는것마다 추출하려면
			/*
			 * 843 846 843 846 408
			 */

			// 대 카테고리 추출

			// 대 카테고리 1개 뽑고 . 소 카테고리 2개 꼽을수있따.
			// 대 카테고리는 맨 앞에 숫자. 세부카테고리는 일의자리랑 십의자리숫자 합쳐서 43,46 이렇케

			int[] count = new int[9];
			int countmax = count[0];
			int index = 0;
			ArrayList<String> numaarr = new ArrayList<String>();

			for (int i = 0; i < class_nolist.size(); i++) {

				// System.out.println("리스트사이즈:"+class_nolist.size());
				String a = class_nolist.get(i).substring(0, 1);
				// System.out.println("대 카테고리:" + a);

				switch (a) {

				case "0":
					count[0] = 1 + count[0];

					break;
				case "1":
					count[1] = 1 + count[1];

					break;
				case "2":
					count[2] = 1 + count[2];

					break;
				case "3":
					count[3] = 1 + count[3];

					break;
				case "4":
					count[4] = 1 + count[4];

					break;
				case "5":
					count[5] = 1 + count[5];

					break;
				case "6":
					count[6] = 1 + count[6];

					break;
				case "7":
					count[7] = 1 + count[7];

					break;
				case "8":
					count[8] = 1 + count[8];

					break;
				case "9":
					count[9] = 1 + count[9];

					break;
				default:
					break;
				}

				for (int z = 0; z < count.length; z++) {
					if (count[z] > countmax) {
						countmax = count[z];
						// System.out.println("인덱스번호:"+i);
						index = z;
					} else if (count[z] == countmax) {
						String x = Integer.toString(z);
						numaarr.add(x);
					}
				}
				// System.out.println("인덱스 번호:" + index);
				sv.setMaxnum(index); // 이것이 대분류가 될 숫자임

			}

			// System.out.println("배열중 최대값:" + countmax); // 확인 완료
			// vo에 저장해서 호출해서 불러오는 것으로 하자.

			// System.out.println(" 0:"+zero+" 1:"+one+" 2:"+two+" 3:"+three+" 4:"+four+"
			// 5:"+five+" 6:"+six+" 7:"+seven+" 8:"+eight+" 9:"+nine);
			// System.out.println("count[8]:" + count[8]);

			// ArrayList<String> class_s_list = new ArrayList<String>();

			/*
			 * 
			 * for (int i = 0; i < class_nolist.size(); i++) {
			 * 
			 * // 소 카테고리 추출 String b = class_nolist.get(i).substring(1);
			 * System.out.println("소 카테고리분류 :" + b);
			 * 
			 * // kdc문자열과 똑같이 해주긔. 앞에 0 붙어야함
			 * 
			 * String c = "0"; String d = c.concat(b);
			 * 
			 * System.out.println("KDC:" + d);
			 * 
			 * // 리스트에 넣기 class_s_list.add(d);
			 * 
			 * }
			 */

			/*
			 * for (String string : class_s_list) { System.out.println(string); }
			 */

			/*
			 * //디비에서 조인해서 가져오기... 필드값 가져오기 셀렉트 쿼리로... 셀렉트로 인덱스를 참조하여 카테고리명을 가져오기..
			 * 
			 * ArrayList<String> class_s_jarr=new ArrayList<String>();
			 * 
			 * for (int i = 0; i < class_s_list.size(); i++) { class_s_jarr =
			 * searchmapper.selectClass(class_s_list.get(i));
			 * 
			 * }
			 * 
			 */

			// isbn을 여러개 넣을수없음... 한개씩 넣어서 돌려줘야함..문제있음
			// 한개 isbn으로 내용 꺼내올때 한개 사용할떄

			/*
			 * ArrayList<Object> classNmlist = new ArrayList<Object>();
			 * 
			 * for (int j = 0; j < isbnlist.size(); j++) {
			 * 
			 * System.out.println("j번호:"+j);
			 * 
			 * String serviceKey3 =
			 * "http://data4library.kr/api/usageAnalysisList?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69";
			 * String urlStr2 = serviceKey3 + "&isbn13="+isbnlist.get(j)+"&format=json";
			 * 
			 * 
			 * //1권밖에 안나온이유. +와 ";"사이 띄어쓰기해서 System.out.println("urlStr2:"+urlStr2);
			 * 
			 * URL url2 = new URL(urlStr2);
			 * 
			 * BufferedReader bf2 = new BufferedReader(new
			 * InputStreamReader(url2.openStream()));
			 * 
			 * 
			 * String jstr2 = bf2.readLine();
			 * 
			 * String strJson2 = jstr2;
			 * 
			 * // 2. Parser JSONParser jsonParser2 = new JSONParser();
			 * 
			 * // 3. To Object Object obj2 = jsonParser2.parse(strJson2);
			 * 
			 * // 4. To JsonObject JSONObject jsonObj2 = (JSONObject) obj2;
			 * 
			 * // print System.out.println(jsonObj2.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨
			 * 
			 * Object responseObj2 = jsonObj2.get("response"); JSONObject json12 =
			 * (JSONObject) responseObj2;
			 * 
			 * System.out.println();
			 * 
			 * System.out.println("json12.get의 Book:"+json12.get("book")); // sim
			 * 
			 * 
			 * 
			 * // 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고. // 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			 * JSONObject recbooks=(JSONObject) json12.get("book");
			 * System.out.println("class_nm뽑음:"+recbooks.get("class_nm")); Object
			 * classNm=recbooks.get("class_nm"); classNmlist.add(classNm);
			 * 
			 * }
			 * 
			 * for (Object object : classNmlist) {
			 * System.out.println("classNmlist:"+object); }
			 * 
			 * //3단계로 나뉘는데.. 어떻게 디비랑 맞춰야하려나.. //이 3개 카테고리를 다 뷰에 보여줘야하는데 디비에서 매칭해서, //스플릿해서
			 * ..다 스트링 배열로 만든다음에. //보여주는건 끝에 일자리만 가져가도 될것같은데..
			 * 
			 * //스플릿에 또 스플릿 해야겠군. //,없으면 스플릿하지않는 조건. 그냥넣어주고 ,있으면 스플릿해서 나눠서 배열에 넣어줘서 보내줘야겠따.
			 * 
			 */

			// 이거는 위에서 isbn에서 받아온 kdc와 dtl_kdc 리스트를 넣어줘야함 분류 인기 검색이니까. isbn은 검색조건에 못 넣음.
			/*
			 * ArrayList<Object> classNmlist=new ArrayList<Object>();
			 * 
			 * for (int j = 0; j < isbnlist.size(); j++) {
			 * 
			 * System.out.println("j번호:" + j);
			 * 
			 * String serviceKey4 = "";
			 * 
			 * http: //
			 * data4library.kr/api/loanItemSrch?authKey=[발급받은키]&gender=0&from_age=6&to_age=
			 * 10&region=11;22&addCode=0&kdc=6&pageNo=1&pageSize=10
			 * 
			 * serviceKey4 =
			 * "http://data4library.kr/api/loanItemSrch?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69";
			 * String urlStr2 = serviceKey4 +
			 * "&gender=0&from_age=20&to_age=50&region=11;22&addCode=0&kdc=" +4+
			 * "&format=json";
			 * 
			 * // 1권밖에 안나온이유. +와 ";"사이 띄어쓰기해서 System.out.println("urlStr2:" + urlStr2);
			 * 
			 * URL url2 = new URL(urlStr2);
			 * 
			 * BufferedReader bf2 = new BufferedReader(new
			 * InputStreamReader(url2.openStream()));
			 * 
			 * String jstr2 = bf2.readLine();
			 * 
			 * String strJson2 = jstr2;
			 * 
			 * // 2. Parser JSONParser jsonParser2 = new JSONParser();
			 * 
			 * // 3. To Object Object obj2 = jsonParser2.parse(strJson2);
			 * 
			 * // 4. To JsonObject JSONObject jsonObj2 = (JSONObject) obj2;
			 * 
			 * // print System.out.println(jsonObj2.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨
			 * 
			 * Object responseObj2 = jsonObj2.get("response"); JSONObject json12 =
			 * (JSONObject) responseObj2;
			 * 
			 * System.out.println();
			 * 
			 * System.out.println("json12.get의 Book:" + json12.get("book")); // sim
			 * 
			 * // 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고. // 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
			 * JSONObject recbooks = (JSONObject) json12.get("book");
			 * System.out.println("class_nm뽑음:" + recbooks.get("class_nm")); Object classNm
			 * = recbooks.get("class_nm"); classNmlist.add(classNm);
			 * 
			 * }
			 * 
			 * for (Object object : classNmlist) { System.out.println("classNmlist:" +
			 * object); }
			 * 
			 * // 3단계로 나뉘는데.. 어떻게 디비랑 맞춰야하려나.. // 이 3개 카테고리를 다 뷰에 보여줘야하는데 디비에서 매칭해서, //
			 * 스플릿해서 ..다 스트링 배열로 만든다음에. // 보여주는건 끝에 일자리만 가져가도 될것같은데..
			 * 
			 * // 스플릿에 또 스플릿 해야겠군. // ,없으면 스플릿하지않는 조건. 그냥넣어주고 ,있으면 스플릿해서 나눠서 배열에 넣어줘서
			 * 보내줘야겠따.
			 */
		} catch (

		Exception e) {

		} finally {
			bf.close();

		}

		return null;

	}
	/*
	 * @Override public List<Map<String, Object>> slist(Map<String, Object>
	 * requestDto) { // TODO Auto-generated method stub return null; }
	 */

	@Override
	public ShopView bookinfo(String isbnscr, int count) {
		//
		// //isbn으로 모든 정보 다 받아오기
		//
		// //1.썸네일 url있어야하고 2.판매가 3.세일가격 3.수량필요
		//
		// //가격때문에 카카오나 네이버에서 가져와야할덧. ->이클립스에서 가져올수있는거 확인함
		// String apikey ="2ecf5febe1e05d5d376370e2b4d6c779";
		//
		// try {
		//
		// /*�닿��� ��諛���. 9788968481475(8968481474)*/
		//
		// String postParams="target=isbn&query="+isbnscr;
		// String apiURL="https://dapi.kakao.com/v3/search/book?"+postParams;
		// URL url=new URL(apiURL);
		//
		// HttpURLConnection con = (HttpURLConnection) url.openConnection();
		// String userCredentials=apikey;
		// String basicAuth="KakaoAK "+userCredentials;
		// con.setRequestProperty("Authorization", basicAuth);
		// con.setRequestMethod("GET");
		// con.setRequestProperty("Content-Type", "application/json;");
		// con.setRequestProperty("charset", "utf-8");
		// con.setUseCaches(false);
		// con.setDoInput(true);
		// con.setDoOutput(true);
		//
		// int responseCode=con.getResponseCode();
		// System.out.println("responseCode >> "+responseCode);
		// BufferedReader br;
		// if (responseCode==200) { //�����몄���
		// br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		// }
		// else { //���� 諛���
		// br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		// }
		//
		// String inputLine;
		// StringBuffer res= new StringBuffer();
		// while ((inputLine=br.readLine()) != null) {
		// res.append(inputLine);
		// }
		// br.close();
		// System.out.println("응답 결과 >> "+res.toString());
		//
		// //이제 이결과를 제이슨 타입으로 파싱해준다.
		// JSONParser json = new JSONParser();
		// JSONObject jsonobj=(JSONObject) json.parse(res.toString());
		//
		// JSONArray jsonarr=(JSONArray) jsonobj.get("documents");
		//
		// Object isbnobj=new Object();
		// Object priceobj=new Object();
		// Object saleobj=new Object();
		// Object urlobj=new Object();
		// Object titleobj=new Object();
		//
		// isbnobj="";
		// priceobj="";
		// saleobj="";
		// urlobj="";
		// titleobj="";
		//
		// for (Object object : jsonarr) {
		// System.out.println(object);
		// JSONObject jobj=(JSONObject) object; //제이슨오브제로 바꿔줘야 키와벨류로 가져온다.
		// isbnobj=jobj.get("isbn");
		// priceobj=jobj.get("price");
		// saleobj=jobj.get("sale_price");
		// urlobj=jobj.get("thumbnail");
		// titleobj=jobj.get("title");
		// }
		// System.out.println("isbn오브제나와라:"+isbnobj);
		//
		//
		// /*
		// 뽑아올 목록
		// bsjselectbook_isbn varchar2(30),
		// bsjselectbook_id number,
		// bsjselectbook_price number,
		// bsjselectbook_sale number,
		// bsjselectbook_count number,
		// bsjselectbook_url varchar2(1000),
		// bsjselectbook_title varchar2(200),
		// bsjselectbook_status varchar2(50));
		//
		// */
		//
		// //다뽑았고
		// //뽑은내용을 디비에 넣어주는 작업
		// //디비에 바로안넣고 변수저장을 해줘야하는 이유가있나??
		//
		// //일단 디비에 넣는것부터
		// //업데이트할꺼니까 리턴안받아두 될것같은데..
		//
		// searchmapper.shoplist();
		//
		//
		// } catch (Exception e) {
		// System.out.println("--���몄�� ");
		// System.out.println(e);
		// }
		//
		//

		return null;
	}

	@Override
	public ArrayList<ShopView> shoplist(String isbnscr, int count, String userId) {

		ArrayList<ShopView> shopvlist = new ArrayList<ShopView>();
		// isbn으로 모든 정보 다 받아오기

		// 1.썸네일 url있어야하고 2.판매가 3.세일가격 3.수량필요

		// 가격때문에 카카오나 네이버에서 가져와야할덧. ->이클립스에서 가져올수있는거 확인함
		String apikey = "2ecf5febe1e05d5d376370e2b4d6c779";

		try {

			/* �닿��� ��諛���. 9788968481475(8968481474) */

			String postParams = "target=isbn&query=" + isbnscr;
			String apiURL = "https://dapi.kakao.com/v3/search/book?" + postParams;
			URL url = new URL(apiURL);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			String userCredentials = apikey;
			String basicAuth = "KakaoAK " + userCredentials;
			con.setRequestProperty("Authorization", basicAuth);
			con.setRequestMethod("GET");
			con.setRequestProperty("Content-Type", "application/json;");
			con.setRequestProperty("charset", "utf-8");
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);

			int responseCode = con.getResponseCode();
			System.out.println("responseCode >> " + responseCode);
			BufferedReader br;
			if (responseCode == 200) { // �����몄���
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� 諛���
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}

			br.close();

			System.out.println("응답 결과 >> " + res.toString());

			// 이제 이결과를 제이슨 타입으로 파싱해준다.
			JSONParser json = new JSONParser();
			JSONObject jsonobj = (JSONObject) json.parse(res.toString());

			JSONArray jsonarr = (JSONArray) jsonobj.get("documents");

			Object isbnobj = new Object();
			Object priceobj = new Object();
			Object saleobj = new Object();
			Object urlobj = new Object();
			Object titleobj = new Object();
			Object isbn13obj = new Object();

			// 오브젝트가 최상위 단계이기떄문에 이거를 인트형으로 아랫단계로 변환하면 문제생김
			/*
			 * java.lang.ClassCastException: java.lang.Long cannot be cast to
			 * java.lang.Integer
			 */

			isbnobj = "";
			isbn13obj = "";
			urlobj = "";
			titleobj = "";
			// 얘네는 인트로 바꿔줘야함.
			priceobj = "";
			saleobj = "";

			Map<String, Integer> m = new HashMap<>();

			for (Object object : jsonarr) {
				// System.out.println(object);
				JSONObject jobj = (JSONObject) object; // 제이슨오브제로 바꿔줘야 키와벨류로 가져온다.
				isbnobj = jobj.get("isbn");
				priceobj = jobj.get("price");
				saleobj = jobj.get("sale_price");
				urlobj = jobj.get("thumbnail");
				titleobj = jobj.get("title");

				// 인덱스번호로 구분하기

			}
			// System.out.println("isbn오브제나와라:"+isbnobj);
			int price = ((Number) priceobj).intValue();
			int sale = ((Number) saleobj).intValue();

			System.out.println("x:" + price);
			System.out.println("y:" + sale);

			String isbn13 = (String) isbnobj.toString().substring(11, 24);
			String url2 = (String) urlobj.toString();
			String title = (String) titleobj.toString();

			System.out.println("isbn나와:" + isbn13);

			// 1.업데이트해주면서 2. 테이블불러와야한다.

			// 다뽑았고
			// 뽑은내용을 디비에 넣어주는 작업
			// 디비에 바로안넣고 변수저장을 해줘야하는 이유가있나??

			// 일단 디비에 넣는것부터
			// 업데이트할꺼니까 리턴안받아두 될것같은데..

			// 위에서 변수에 넣어준걸가지고 디비에 가져가서 업데이트해줘야지 파람 인서트해줘야지

			// 1.업데이트작업//확인완료.
			searchmapper.upshoplist(isbn13, price, sale, url2, title, count, userId);

			// 2.테이블 불러오는작업 .. 각각의 테이블을 다 불러와야함..
			// ShopView에다가 넣어줘야함. -> 그다음에 리턴해준다.
			/* 그래야 테이블 불러온다. */

			/*
			 * public ShopView(String bsjselectbook_isbn, int bsjselectbook_id, int
			 * bsjselectbook_price, int bsjselectbook_sale, int bsjselectbook_count, String
			 * bsjselectbook_url, String bsjselectbook_title, String bsjselectbook_status)
			 */

			ShopView shopv = new ShopView();

			shopv.setBsjselectbook_isbn(isbn13);
			// shopv.setBsjselectbook_id(1);
			shopv.setBsjselectbook_price(price);
			shopv.setBsjselectbook_sale(sale);
			shopv.setBsjselectbook_count(count);
			shopv.setBsjselectbook_url(url2);
			shopv.setBsjselectbook_title(title);
			// shopv.setBsjselectbook_status("2일이내");

			// 2.
			// 맵퍼에서 장바구니리스트 불러는 작업. 디비에서 bsjselectbook 테이블 불러오는 작업

			shopvlist = searchmapper.getshoplist(userId);

			// 형변환시 각 타입에 맞게 나오는지 확인하기
			/* int i = (int)Object. 객체앞에 (int)를 써서 강제형변환 */
			// String title=(String)titleobj;
			// String thumbnail=(String)urlobj;
			// JSONObject price=(JSONObject)priceobj;

			/*
			 * 오브젝트가 가장 상위단계라서 강제형변환 안돼네.. 안뽑아지네...어떻게 뽑아야하지?* 스트링리스트에 넣으면.. 되긴하는것같긴한데/
			 * 
			 * 
			 * 
			 * /* 뽑아올 목록 bsjselectbook_isbn varchar2(30), bsjselectbook_id number,
			 * bsjselectbook_price number, bsjselectbook_sale number, bsjselectbook_count
			 * number, bsjselectbook_url varchar2(1000), bsjselectbook_title varchar2(200),
			 * bsjselectbook_status varchar2(50));
			 * 
			 */

/*			// isbn과 count를 변수에 저장해둬서.. isbn중복될땐 업데이트문을 시키고 count+1 을 해주는 쿼리에 쓰일용도
			Integer countInteg = count;
			getcount strequl = new getcount();

			strequl.getIsbnequl().add(isbnscr);
			strequl.getCount().add(countInteg);
			
			*/

		} catch (Exception e) {
			System.out.println("--���몄�� ");
			System.out.println(e);
		}

		return shopvlist;

	}


	@Override
	public ArrayList<Object> categoryName(String isbn13) throws Exception {

		// 각각의 책에 맞는 카테고리 정보 보내주기

		ArrayList<Object> catenamelist = new ArrayList<Object>();

		String serviceKey3 = "http://data4library.kr/api/usageAnalysisList?authKey=bd1ca3ab552dd10a147c1e0594dd11525c60dcdb8f5f22d0cd940b3faa2f3c69";
		String urlStr2 = serviceKey3 + "&isbn13=" + isbn13 + "&format=json";

		// 1권밖에 안나온이유. +와 ";"사이 띄어쓰기해서 System.out.println("urlStr2:"+urlStr2);

		URL url2 = new URL(urlStr2);

		BufferedReader bf3 = new BufferedReader(new InputStreamReader(url2.openStream()));

		String jstr3 = bf3.readLine();

		// String strJson2 = jstr3;

		// 2. Parser JSONParser
		JSONParser strJson3 = new JSONParser();

		// 3. To Object
		Object obj3 = strJson3.parse(jstr3);

		// 4. To JsonObject
		JSONObject jsonObj3 = (JSONObject) obj3;

		// print System.out.println(jsonObj2.get("response")); // 리스폰안에들어간 리퀘스트가 출력됨

		Object responseObj3 = jsonObj3.get("response");

		JSONObject json123 = (JSONObject) responseObj3;

		System.out.println();

		System.out.println("json12.get의 Book:" + json123.get("book")); // sim

		// 이 jason어레이 구조를 출력하고싶으면 객체를 어레이로 강제 형변환을 하고. // 이걸 포문을 돌려주면 꺼내서 보면 다 꺼내쥠!
		JSONObject recbooks2 = (JSONObject) json123.get("book");
		System.out.println("class_nm뽑음:" + recbooks2.get("class_nm"));
		// Object classNm=recbooks2.get("class_nm");
		catenamelist.add(recbooks2);

		return catenamelist;
	}


// 이선아 : 리뷰게시판
	@Override
	public List<ReviewDto> reviewList(int rowStart, int rowEnd) {
		List<ReviewDto> reviewList = searchmapper.reviewList(rowStart, rowEnd);
		return reviewList;
	}

	@Override
	public int reviewCount() {

		return searchmapper.reviewCount();
	}

	@Override
	public int cartCount(String isbn, String userId) {
		// TODO Auto-generated method stub
		return searchmapper.cartCount(isbn, userId);
	}

	@Override
	public void cartUpdate(String isbn, int count, String userId) {
		searchmapper.cartUpdate(isbn, count, userId);

	}


	@Override
	public List<UserSelect> totalcount(String userId) {
		
		return searchmapper.totalcount(userId);
	}


	
}
