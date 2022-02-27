package com.tech.booksajo.search.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.search.service.SearchService;
import com.tech.booksajo.search.vo.ReviewDto;
import com.tech.booksajo.search.vo.ReviewSearchVO;
import com.tech.booksajo.search.vo.ShopView;
import com.tech.booksajo.search.vo.Shoplist2;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class SearchController {
	
	@Autowired
	SearchService searchService;

	
	//SqlSession sqlsession;
	
/*	어토 와이어 두개서비스연결은 안되나보네 빈에러남
 * @Autowired
	boardService boardservice;*/

	
	@RequestMapping(value = "/search/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> sList(){
		return searchService.sList();
	}	
	
	//자바딴에서 왔따갔다할때 써줘야함.
	//@ResponseBody는 ajax롤 보낼때 써주고
	//ajax 받을때 @RequestParam 을 쓴다 그런데 매개변수에대가 써줘야함

	@RequestMapping("/search")
	public String search() {
		
		return "search";
	}
	
	
	@RequestMapping("/shoplist")
	public String shoplist(HttpServletRequest request, Model model ) {
		
		//버튼으로 받아오기
		String count=request.getParameter("count");
		String isbnscr=request.getParameter("isbnscr");
		//String count=request.getParameter("count");
		
		
		System.out.println("수량:"+count);
		System.out.println("isbn스크립트:"+isbnscr);
		
		
		//어디서 클릭을하냐에 따라. 리스트에서 가져오냐. 아니면 상세 페이지에서 가져오냐 경로가 달라서 안들어오네	
		String isbn=request.getParameter("isbn");

		
		String isbn13=isbn.substring(11,24);
		System.out.println("13자리:"+isbn13);
		
		System.out.println("isbnA:"+isbn);


		model.addAttribute("isbn13", isbn13);
		
		
		return "common/shoplist/shoplist";
	}

	
	@RequestMapping("/shoplist2")
	public String shoplist2(HttpServletRequest request, Model model) {
		
		//버튼으로 받아오기
		int count=Integer.parseInt(request.getParameter("count")); 
		String isbnscr=request.getParameter("isbnscr");
		String userId =request.getParameter("userId");
		//String count=request.getParameter("count");
		
		
		System.out.println("수량:"+count);
		System.out.println("isbn스크립트:"+isbnscr);
		System.out.println("유저아이디" + userId);
		//model.addAttribute("isbn13", isbn13);
		
		System.out.println("확인용================");
		//유저 아이디를 추가해야한다... 사람마다 장바구니 다 다를테니까.. 유저아이디도 들어가줘야함.
		if(searchService.cartCount(isbnscr,userId) > 0) {
			searchService.cartUpdate(isbnscr, count,userId);
		}else {
			ShopView shv=new ShopView();
			ArrayList<ShopView> shlist=searchService.shoplist(isbnscr, count,userId);
			model.addAttribute("shoplist", shlist);
		}
		
	
		//틀린이유 생성자 주입안해줌..
	
		
		return "common/shoplist/shoplist2";
	}	
	
	
	
	@RequestMapping("/shoplist3")
	public void shoplist3(@RequestBody Map<String,Object> map) {
		
		System.out.println("받아오냐========================");
		System.out.println(map.get("isbnscr"));
		System.out.println(map.get("count"));
		//버튼으로 받아오기
		int count= Integer.parseInt(map.get("count").toString()); 
		String isbnscr= map.get("isbnscr").toString();
		String userId= map.get("userId").toString();
		ShopView shv=new ShopView();		
		searchService.shoplist(isbnscr, count,userId);

	}	
	
	
		
		
		
	
	/*리스폰스 바디를 맵핑 위에다가 붙이면 에러남 못불러옴 함수 바루위에다가 붙여줘야함*/

	@RequestMapping("/search_detail")
	public String search_detail(HttpServletRequest request, Model model, ReviewSearchVO reviewSearchVo) {
	
		String isbn13=request.getParameter("isbn");
		System.out.println("isbn13:"+isbn13);
		
		
		//SearchMapper dao=sqlsession.getMapper(SearchMapper.class);
		//dao.
		
		//여기 자바안에서 도서나루 정보 끌어올수있도록 하자...
		
		//디테일 페이지에선 해당하는.. 1.카테고리분류 2.키워드 가져와서 담을수있게끔 해준다.
				
				//SearchMapper dao=sqlsession.getMapper(SearchMapper.class);
				//dao.keywordget(isbn13);
				
		
/*		ArrayList<Object> list=new ArrayList<Object>();
		
				try {
					list=searchService.keywordget(isbn13);
					
					System.out.println("리턴완료:"+list.get(0));


				
				
				} catch (Exception e) {
					
					e.printStackTrace();
				}*/
		model.addAttribute("isbn", isbn13);
		
		
		String isbn=request.getParameter("isbn");
		model.addAttribute("isbn", isbn);
		
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : "+strPage);
		if(strPage==null)
			strPage="1";
		
		int total=0;
		int page=Integer.parseInt(strPage);
		reviewSearchVo.setPage(page);
		
		total=searchService.reviewCount();
		reviewSearchVo.pageCalculate(total);
		
		int rowStart=reviewSearchVo.getRowStart();
		int rowEnd=reviewSearchVo.getRowEnd();
		
//		이선아 리뷰테이블 리스트
		List<ReviewDto> reviewList = searchService.reviewList(rowStart, rowEnd);
		System.out.println(reviewList.get(0).getRe_content());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("ReviewSearchVO",reviewSearchVo);

		
		
		return "search_detail";
	}

	
	
	
	
	
	@RequestMapping(value = "/test/search_keyword/", method = RequestMethod.POST  )
	@ResponseBody
	public JSONArray search_keyword(@RequestBody Map<String,Object> map) {
		
		
		System.out.println("==================================");
		
		

		String isbn13= map.get("isbn").toString();
		
		ArrayList<Object> list=new ArrayList<Object>();
		
		JSONArray jsonlist=new JSONArray();
				try {
					list= searchService.keywordget(isbn13);
					
					System.out.println("리턴완료:"+list.get(0));
					//System.out.println("제이슨객체로변환완료:"+(JSONObject)list.get(0));
					
					//제이슨타입으로 형변환해줍시더 언디파인으로 안뜨게 받을때

					
					for (int i=0; i < 5; i++) {//리스트에서 선두에 있는 가중치 높은 것 4개만 가져오기 너무 많으니까.
					    JSONObject jsonObj=(JSONObject)list.get(i);
					    System.out.println("선별키워드:"+(JSONObject)list.get(i));
					    //제이슨타입으로 변형해서 보내기 위는 그냥 오브젝트임.
					    jsonlist.add(jsonObj);
					}

				
				} catch (Exception e) {
					
					e.printStackTrace();
				}
								
		
		
		return jsonlist;
	}

	
	@RequestMapping(value = "/test/search_category/", method = RequestMethod.POST  )
	@ResponseBody
	public ArrayList<Object> search_category(@RequestBody Map<String,Object> map) {
		
		
		System.out.println("=========================search_category들어오나=========");
		
		

		String isbn13= map.get("isbn").toString();
		
		ArrayList<Object> list=new ArrayList<Object>();
		
		JSONArray jsonlist=new JSONArray();
		
		
		
				try {
					list= searchService.categoryName(isbn13);
					
					
					//System.out.println("제이슨객체로변환완료:"+(JSONObject)list.get(0));
					
					//제이슨타입으로 형변환해줍시더 언디파인으로 안뜨게 받을때
					
					System.out.println("리턴완료:"+list.get(0));
					
						
					//jsonlist.add(list);
					
/*					
					for (int i=0; i < 5; i++) {//리스트에서 선두에 있는 가중치 높은 것 4개만 가져오기 너무 많으니까.
					    JSONObject jsonObj=(JSONObject)list.get(i);
					    System.out.println("선별키워드:"+(JSONObject)list.get(i));
					    //제이슨타입으로 변형해서 보내기 위는 그냥 오브젝트임.
					    jsonlist.add(jsonObj);
					}
*/
				
				} catch (Exception e) {
					
					e.printStackTrace();
				}
								
		
		
		return list;
	}
	
	
	@RequestMapping(value="/search_table")
	public String search_table(HttpServletRequest request,Model model) {//HttpServletRequest는 스트링 밖에 못받고 제이슨 못받아와 한계가있음.
		System.out.println("서치테이블 맵핑 들어옴");
		String search=request.getParameter("searchInput");
		model.addAttribute("search", search);
		
		
		
		//isbn이라는 기준고유값을 이용해서 제이슨 자료를 얻고 그걸 담아서 그 결과를 쿼리에 인서트로 넣어줘야함.
//		SearchMapper dao=sqlsession.getMapper(SearchMapper.class);
		//dao.test();
		
		
		//카테고리 검색을 하려면 키워드도 도서나루 API에서 받아와야한다.
		/*url자체를 조건자체를 변경해서..카테고리 뭐 누르냐에따라 리스트 구현 자바스크립트 함수 각각 따로 실행할수있게 해놔야 카테고리별 리스트를 뿌릴수있다.*/
		
		
		
		return "search_table";
	}
	
/*	
	@RequestMapping(value = "/list")
	public List<Map<String,Object>> List(@RequestBody Map<String,Object> requestDto){
		return searchService.slist(requestDto);
	}
*/
	

	@RequestMapping("/write")
	public void write(@RequestBody Map<String,Object> requestDto) {
		String bName= (String) requestDto.get("bName");
		String bTitle = (String) requestDto.get("bTitle");
		String bContent= (String) requestDto.get("bContent");
		searchService.write(bName,bTitle,bContent);
	}
	
	@RequestMapping("/content_view/load/{bid}")
	public Map<String,Object> content_view(@PathVariable String bid) {
			return searchService.content_view(bid);
	}


}




















