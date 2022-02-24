package com.tech.booksajo.search.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.tech.booksajo.mypage.vo.Myinfomation;
import com.tech.booksajo.search.vo.SearchDto;
import com.tech.booksajo.search.vo.SearchView;
import com.tech.booksajo.search.vo.ShopView;

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
	public void upshoplist(String isbn13, int price, int sale, String thumbnail, String title, int count);

	//장바구니 리스트 불러오는 동작
	public ArrayList<ShopView> getshoplist();
}
