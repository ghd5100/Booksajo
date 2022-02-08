package com.tech.booksajo.main.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.booksajo.main.mapper.mainMapper;
import com.tech.booksajo.main.vo.MainDto;
import com.tech.booksajo.main.vo.PageVO;

@Controller
public class mainController {
	
//	mainService service;

	@Autowired
	private SqlSession sqlSession;
	
//	@RequestMapping(value = "/main/api/getList", method = RequestMethod.GET  )
//	@ResponseBody
//	public List<Map<String,Object>> getList(){
//		return service.getList();
//	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("~~Index Controller~~");
		mainMapper dao = sqlSession.getMapper(mainMapper.class);
//		List<Map<String, Object>> list = dao.getData();
		
		List<MainDto> list = dao.getData();
		
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping(value = "/bestList", method = RequestMethod.GET)
	public String best(HttpServletRequest request, PageVO pageVO, Model model) throws Exception {
		System.out.println("~~Best Controller~~");
		mainMapper dao = sqlSession.getMapper(mainMapper.class);;
		
		String strPage = request.getParameter("page");
		
		if(strPage == null) strPage = "1";
		
		int page = Integer.parseInt(strPage);
		
		pageVO.setPage(page);
		int total = 200;
		pageVO.pageCalculate(total);
		
		int rowStart = pageVO.getRowStart();
		int rowEnd = pageVO.getRowEnd();
		
//		System.out.println(rowStart);
//		System.out.println(rowEnd);
//		List<MainDto> list = dao.getAllData(rowStart, rowEnd);
		
		ArrayList<HashMap<String, String>> dataList = getBestIsbn(page);
		
//		model.addAttribute("list", list);
		model.addAttribute("page", pageVO);
		model.addAttribute("totRowCnt", total);
		model.addAttribute("dataList", dataList);
		
		return "bestList";
	}
	
	final static String serviceKey = "http://data4library.kr/api/loanItemSrch?authKey=72e70652c089ddede639f01b2e237eebaf6f5ec4bbd2b6ceee0bc852b0ee32b2";
	public ArrayList<HashMap<String, String>> getBestIsbn(int page) throws Exception {
//		String key = "72e70652c089ddede639f01b2e237eebaf6f5ec4bbd2b6ceee0bc852b0ee32b2";
//		String connect = "http://data4library.kr/api/loanItemSrch?authKey=72e70652c089ddede639f01b2e237eebaf6f5ec4bbd2b6ceee0bc852b0ee32b2";
		
//		http://data4library.kr/api/itemSrch?type=ALL&libCode=[도서관코드]&authKey=[발급받은키]&pageNo=1&pageSize=10
		
		String urlStr = serviceKey + "&pageNo=" + page + "&pageSize=8&format=json";
		
		URL url = new URL(urlStr);
		
		BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream()));
		ArrayList<HashMap<String, String>> li = new ArrayList<HashMap<String, String>>();
		try {
			String jstr = bf.readLine();
			System.out.println("jstr : " + jstr);
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObj = (JSONObject) jsonParser.parse(jstr);
			
			JSONObject responseObj = (JSONObject) jsonObj.get("response");
			
			JSONArray jarr = (JSONArray) responseObj.get("docs");
			
			for (Object obj: jarr) {
				JSONObject jObj = (JSONObject) obj;
				JSONObject doc = (JSONObject) jObj.get("doc");
				
				String isbn = (String) doc.get("isbn13");
				String bookImage = (String) doc.get("bookImageURL");
				String authors = (String) doc.get("authors");
				String publisher = (String) doc.get("publisher");
				String bookName = (String) doc.get("bookname");
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("isbn", isbn);
				map.put("bookImage", bookImage);
				map.put("authors", authors);
				map.put("publisher", publisher);
				map.put("bookName", bookName);
				li.add(map);
			}
			
		} catch (Exception e) {

		}
		return li;
	}
}
