package com.tech.booksajo.search.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.mypage.vo.Myinfomation;
import com.tech.booksajo.search.vo.ReviewDto;
import com.tech.booksajo.search.vo.SearchDto;
import com.tech.booksajo.search.vo.ShopView;
import com.tech.booksajo.search.vo.UserSelect;
import com.tech.booksajo.search.vo.getcount;

@MapperScan
public interface SearchMapper {
	
	
	List<Map<String,Object>> getList();
	
	
	public List<Map<String,Object>>  list(int start,int end,String searcKeyword,String selNum);
	public void write(String bName,String bTitle, String bContent);
	public Map<String,Object> contentView(String sbid);
	public void upHit(String sbid);
	public void delete(String bid);
	public void modify(String bid, String bName,String bTitle, String bContent);
	public SearchDto replyView(String sbid);
	
//	reply
	public void reply(String bid, String bName,String bTitle, String bContent,String bgroup, String bstep,String bindent);
	
	
//	replyShape
	public void replyShape(String bgroup,String bstep);
	
	//totcnt
	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount0(String searchKeyword);


	//public List<Map<String,Object>> test();
	
	public Myinfomation userinfo();

	//장바구니에 추가해주는 동작
	public void upshoplist(String isbn13, int price, int sale, String thumbnail, String title, int count,String userId);

	//장바구니 리스트 불러오는 동작
	public ArrayList<ShopView> getshoplist(String userId);
	
	//장바구니에 다 합쳐진 카운트 가져오는 동작

	List<UserSelect> totalcount(String userId);
	
	
	//이선아 : 리뷰테이블 리스트 불러오는 동작
	public List<ReviewDto> reviewList(int rowStart, int rowEnd);
	public int reviewCount();
	
	public int cartCount(String isbn,String userId);
	
	public void cartUpdate(String isbn,int count,String userId);


}
