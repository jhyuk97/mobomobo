package mobomobo.util;

public class Paging {
	private int curPage;
	private int totalCount;
	private int listCount;
	private int totalPage;
	private int pageCount;
	private int startPage;
	private int endPage;
	private int startNo;	
	private int endNo;

	private String search; //검색어
	
	private String category;//카테고리

	public Paging() { }
	
	//총 게시글 수
	public Paging(int totalCount) {
		setTotalCount(totalCount);
		
		makePaging();
	}
	
	//총 게시글 수, 현재 페이지번호
	public Paging(int totalCount, int curPage) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		
		makePaging();
	}
	
	//총 게시글 수, 현재 페이지번호, 보여질 게시글 수
	public Paging(int totalCount, int curPage, int listCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);
		
		makePaging();
	}
	
	//총 게시글 수, 현재 페이지번호, 보여질 게시글 수, 보여질 페이지 수
	public Paging(int totalCount, int curPage, int listCount, int pageCount) {
		setTotalCount(totalCount);
		setCurPage(curPage);
		setListCount(listCount);
		setPageCount(pageCount);
		
		makePaging();
	}
	

	private void makePaging() {
		if( totalCount == 0 )	return; // 게시글 X		
		//기본값 설정
		if(curPage == 0)	setCurPage(1);//첫 페이지를 기본 페이지로 설정
		if(pageCount == 0)	setPageCount(10);//화면에 보여질 페이지 수 기본설정
		if(listCount == 0)	setListCount(15);//화면에 보여질 게시글 수 기본설정

		//총 페이지 수 
		totalPage = totalCount / listCount;
		if( totalCount % listCount > 0 )	totalPage++;

		if(totalPage < curPage)	curPage = totalPage;

		//시작번호와 끝번호
		startPage = ( (curPage-1)/pageCount ) * pageCount + 1;
		endPage = startPage + pageCount - 1;

		if( endPage > totalPage ) endPage = totalPage;

		//시작번호와 끝번호
		startNo = (curPage-1) * listCount + 1;
		endNo = curPage * listCount;
	}
	
	
	
	@Override
	public String toString() {
		return "Paging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount + ", totalPage="
				+ totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startNo=" + startNo + ", endNo=" + endNo + ", search=" + search + ", category=" + category + "]";
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
