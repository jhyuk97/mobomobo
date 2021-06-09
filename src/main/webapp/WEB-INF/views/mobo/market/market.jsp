<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty param.category }">
	<c:set var="category" value="category=${param.category }"/>
</c:if>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 게시판 필수 css -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/board/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/board/css/animate.css">
    
    <link rel="stylesheet" href="/resources/board/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/board/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/board/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/board/css/aos.css">

    <link rel="stylesheet" href="/resources/board/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/board/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css">


    
    <link rel="stylesheet" href="/resources/board/css/flaticon.css">
    <link rel="stylesheet" href="/resources/board/css/icomoon.css">

    
    <link rel="stylesheet" href="/resources/board/css/style.css">
    

    <%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
    
    
    <script type="text/javascript">
$(document).ready(function() {
	
	var category = '<c:out value="${category}"/>';
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/mobo/market?<c:out value="${category}"/>&search="+$("#search").val();
		
	});
})
</script>
  
<style>

/** 글자 밑줄 없애는 코드 **/

a { text-decoration:none; } 


</style>





    
      <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">MARKET</h2>
            <p id="p">당신이 찾던 영화와 책, 무부무부에서 만나보세요</p>
          </div>
        </div>
        
      <div class="container py-5">
        <div class="row"><!-- 측면 카테고리 -->
            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
<!--                 <ul class="list-unstyled templatemo-accordion"> -->
<!--                     <li class="pb-3"> -->
<!--                         <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#"> -->
<!--                             All -->
<!--                             <i class="fa fa-fw fa-chevron-circle-down mt-1"></i> -->
<!--                         </a> -->
<!--                         <ul class="collapse show list-unstyled pl-3"> -->
<!--                             <li><a class="text-decoration-none" href="#">Movie</a></li> -->
<!--                             <li><a class="text-decoration-none" href="#">Book</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     <li class="pb-3"> -->
<!--                         <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#"> -->
<!--                             Movie -->
<!--                             <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i> -->
<!--                         </a> -->
<!--                         <ul id="collapseTwo" class="collapse list-unstyled pl-3"> -->
<!--                             <li><a class="text-decoration-none" href="#">Sport</a></li> -->
<!--                             <li><a class="text-decoration-none" href="#">Luxury</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     <li class="pb-3"> -->
<!--                         <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#"> -->
<!--                             Book -->
<!--                             <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i> -->
<!--                         </a> -->
<!--                         <ul id="collapseThree" class="collapse list-unstyled pl-3"> -->
<!--                             <li><a class="text-decoration-none" href="#">Bag</a></li> -->
<!--                             <li><a class="text-decoration-none" href="#">Sweather</a></li> -->
<!--                             <li><a class="text-decoration-none" href="#">Sunglass</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                 </ul> -->
            </div>

            <div class="col-lg-9">
                <div class="row"><!-- 상단 성별, 순서별 -->
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="/mobo/market?category=영화">Movie</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="/mobo/market?category=책">Book</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex">
                        	<input type="text" class="form-control" id="search" value="${param.search }" /><button id="btnSearch" class="btn">검색</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                
                <c:forEach items="${mList }" var="mList">
                    <div class="col-md-4"><!-- 품목 단위 -->
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0"><!-- 섬네일 -->
                            	<c:if test="${not empty mList.storedImg }">
                                <img class="card-img rounded-0 img-fluid" src="/emp/${mList.storedImg.get(0)}">
                                </c:if>
                                <c:if test="${empty mList.storedImg }">
                                <img class="card-img rounded-0 img-fluid" src="/resources/board/images/BLUE1.jpg">
                                </c:if>
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li><!-- 북마크 -->
                                        <li><a class="btn btn-success text-white mt-2" href="/mobo/market/${mList.mNo }"><i class="far fa-eye"></i></a></li><!-- 상세보기 -->
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body"><!-- 상품정보 -->
                                <a href="/mobo/market/${mList.mNo }" class="h3 text-decoration-none">${mList.mTitle }</a><!-- 제목 -->
                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                    <li>${mList.mCate }</li><!-- 카테고리 -->
                                    <li class="pt-2">
                                        <span><fmt:formatDate value="${mList.mDate }" pattern="yy-MM-dd" /></span><!-- 작성일 -->
                                    </li>
                                </ul>
                                <p class="text-center mb-0">${mList.mPrice }\</p>
                            </div>
                        </div>
                    </div>

				</c:forEach>
                </div>
                
                
                
<!--                 <div div="row">페이징 -->
<!--                     <ul class="pagination pagination-lg justify-content-end"> -->
<!--                         <li class="page-item disabled"> -->
<!--                             <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1">1</a> -->
<!--                         </li> -->
<!--                         <li class="page-item"> -->
<!--                             <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a> -->
<!--                         </li> -->
<!--                         <li class="page-item"> -->
<!--                             <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
					<a href="/mobo/market/write"><button>글쓰기</button></a>
					<a href="/mobo/market/chat"><button>채팅리스트 가기</button></a>
					<%@include file="/WEB-INF/views/mobo/market/paging.jsp" %>

            </div>

        </div>
      </div>
      
      
    </section>
    





<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>








  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/resources/board/js/jquery.min.js"></script>
  <script src="/resources/board/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/board/js/popper.min.js"></script>
  <script src="/resources/board/js/bootstrap.min.js"></script>
  <script src="/resources/board/js/jquery.easing.1.3.js"></script>
  <script src="/resources/board/js/jquery.waypoints.min.js"></script>
  <script src="/resources/board/js/jquery.stellar.min.js"></script>
  <script src="/resources/board/js/owl.carousel.min.js"></script>
  <script src="/resources/board/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/board/js/aos.js"></script>
  <script src="/resources/board/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/board/js/bootstrap-datepicker.js"></script>
  <script src="/resources/board/js/jquery.timepicker.min.js"></script>
  <script src="/resources/board/js/particles.min.js"></script>
  <script src="/resources/board/js/particle.js"></script>
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
  </body>
</html>