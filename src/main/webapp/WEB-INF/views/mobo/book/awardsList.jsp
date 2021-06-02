<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1 ">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/board/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/board/css/animate.css">
    
    <link rel="stylesheet" href="/resources/board/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/board/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/board/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/board/css/aos.css">
    

    <link rel="stylesheet" href="/resources/board/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/board/css/bootstrap-datepicker.css">
<!--     <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css"> -->

    <link rel="stylesheet" href="/resources/board/css/flaticon.css">
    <link rel="stylesheet" href="/resources/board/css/icomoon.css">
   
    
    <link rel="stylesheet" href="/resources/board/css/style.css"> <!-- 게시판 css들 여기까지 -->
    
    <link href="/resources/css/main.css" rel="stylesheet" /> <!-- 검색창 css코드 -->

    
    <%@include file="/WEB-INF/views/mobo/layout/header.jsp" %> <!-- 이걸 꼭 맨 아래에 둬야 먹히더라구여 다른 방법 아시면 의견 부탁드림니다 -->
  
<style>

a { text-decoration:none; }


</style>
<script type="text/javascript">


	function getBookInfo(isbn,avg){
		$.ajax({
            url: "https://dapi.kakao.com/v3/search/book",
            headers: {'Authorization': 'KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5'},
            type : "get",
            data:{
            	query:isbn,
                target:'isbn'
            },
            success : function(result){
            	console.log("성공!!!")
            	
            	$("#awards").append(
							`
							<div class="col-md-3">
					            <div class="blog-entry">
					            <a href="/mobo/book/detail?isbn=${'${result.documents[0].isbn }'}&&avg=${'${avg }'}" class="block-20" style="background-image: url('${'${result.documents[0].thumbnail}'}');">
					              </a>
					              <div class="text p-4 d-block">
					                <div class="meta mb-3">
					                  <div><a href="/mobo/book/detail?isbn=${'${result.documents[0].isbn }'}&&avg=${'${avg }'}">${'${result.documents[0].title }'}</a></div>
					                </div>
					                <h3 class="heading"><a href="/mobo/book/detail?isbn=${'${result.documents[0].isbn }'}&&avg=${'${avg }'}">평점:${'${avg }'}</a></h3>
					              </div>
					            </div>
					          </div>
							`
            				)
            }
        })
        
        
		
		
		
		
		
		
		
		
	}
	$(document).ready(function(){
		
		$.ajax({
            url: "/mobo/book/awardsList",
            type : "post",
            dataType:"json",
            data: {},
            success : function(result){
            	console.log(result[0].ISBN)
            	
            	// api에서 정보 가져오기
            	for(var i = 0; i<result.length;i++){
            		getBookInfo(result[i].ISBN, result[i].AVG);
            	}
            	
            	
            }
        })
       
       
        
       
		
		
		
		
		
	});


</script>


    <!-- 제목 --><!-- 여기를 복붙해서 모든 게시판에 각각 사용하기! 위에 css 추가 필수.... -->
      <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">BOOK</h2>
            <p id="p">당신의 인생 책, 무부무부에서 만나보세요</p>
          </div>
        
        
        
        
        <!-- 검색창 -->
      <div class="s010">
      <form>
        <div class="inner-form">
          <div class="basic-search">
          
            <div class="input-field">
              <input id="search" type="text" placeholder="영화를 무부하세요" />
              <div class="icon-wrap">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
              </div>
            </div>
            </div>
            <div class="advance-search">
              <div class="row third">
              <div class="input-field">
                <div class="result-count">
                  </div>
                <div class="group-btn">
                  <button class="btn-delete" id="delete">RESET</button>
                  <button class="btn-search">SEARCH</button>
                </div>
              </div>
            </div>
          </div>
   	 </div>
   			 
    </form> <!-- 검색 폼 태그 -->
    </div> <!-- 검색창 div 태그 -->
    </div> <!-- 제목부터 검색까지 묶어주는 div 태그 -->
        
        
        <!-- 맨 위에 section 로 전체를 다 묶어놨어염. 검색창 css는 main.css 입니다. 거기에 s010이라 검색하시면 그라데이션 태그가 하나 있어여. 
        그라데이션 색은 거기서 색상 코드 입력해서 수정하시면 돼요. -->
       
        
        <div class="container">
        <div class="row" id="awards">
        <h2 class="mb-4">맨부커 시상식</h2> <!-- 꼭 div row 다음에 넣어주기 -->
        
         </div>
         
       
      </div> <!-- <div class="container"> -->
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
<!--   <script src="/resources/board/js/jquery.timepicker.min.js"></script> -->
<!--   <script src="/resources/board/js/particles.min.js"></script> -->
<!--   <script src="/resources/board/js/particle.js"></script> -->
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
  </body>
</html>