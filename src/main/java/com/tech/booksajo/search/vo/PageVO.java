package com.tech.booksajo.search.vo;

import org.springframework.stereotype.Component;

@Component
public class PageVO {
	   private Integer displayRowCount = 5;           // 출력할 데이터 개수
	    private Integer grpPageCnt=3;                   //// 페이지그룹에서 페이지갯수 수정*
	    private Integer rowStart;                       // 시작행번호
	    private Integer rowEnd;                         // 종료행 번호
	    private Integer totPage;                        // 전체 페이수
	    private Integer totRow = 0;                     // 전체 데이터 수
	    private Integer page;                           // 현재 페이지   //이거 페이지 바뀌면 나머지글 넘어감.
	    private Integer pageStart;                      // 시작페이지
	    private Integer pageEnd;                        // 종료페이지

	/*    최초의 리스트는 페이지 번호를 안달고 감. 
	    하지만 두번째 페이지부터는 2페이지를 누르면서 페이지 번호를 가져감
	    */
	    
	    /**
	     * 전체 데이터 개수(total)를 이용하여 페이지수 계산. 
	     */
	    public void pageCalculate(Integer total) {
	        getPage();
	        //total=전체 글의 갯수
	        totRow  = total;
	        totPage    = (int) ( total / displayRowCount );
	        
	        //이부분이 삼항연산자 부분. 보충해주는 부분 코드임.
	        if ( total % displayRowCount > 0 ) {
	            totPage++;
	        }

	        
	        //페이지안애 끝번호가 차지않을때 그냥 토탈 페이지로 취급해줘라는 ... 코드임.
	        pageStart = (page - (page - 1) % grpPageCnt) ;
	        pageEnd = pageStart + (grpPageCnt-1);
	        if (pageEnd > totPage) {
	            pageEnd = totPage;
	        }
	        
	        rowStart = ((page - 1) * displayRowCount) + 1 ;
	        rowEnd   = rowStart + displayRowCount - 1;
	    } 
	    

	    /**
	     * 현재 페이지 번호. 
	     */
	    public Integer getPage() {
	        if (page == null || page == 0) {
	            page = 1;
	        }
	        
	        return page;
	    }

	    public void setPage(Integer page) {
	        this.page = page;
	    }

	    public Integer getRowStart() {
	        return rowStart;
	    }

	    public void setRowStart(Integer rowStart) {
	        this.rowStart = rowStart;
	    }

	    public Integer getRowEnd() {
	        return rowEnd;
	    }

	    public void setRowEnd(Integer rowEnd) {
	        this.rowEnd = rowEnd;
	    }

	    public Integer getDisplayRowCount() {
	        return displayRowCount;
	    }

	    public void setDisplayRowCount(Integer displayRowCount) {
	        this.displayRowCount = displayRowCount;
	    }

	    public Integer getTotPage() {
	        return totPage;
	    }

	    public void setTotPage(Integer totPage) {
	        this.totPage = totPage;
	    }

	    public Integer getTotRow() {
	        return totRow;
	    }

	    public void setTotRow(Integer totRow) {
	        this.totRow = totRow;
	    }

	    public Integer getPageStart() {
	        return pageStart;
	    }

	    public void setPageStart(Integer pageStart) {
	        this.pageStart = pageStart;
	    }

	    public Integer getPageEnd() {
	        return pageEnd;
	    }

	    public void setPageEnd(Integer pageEnd) {
	        this.pageEnd = pageEnd;
	    }

}
