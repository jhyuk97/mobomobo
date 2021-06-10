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
    <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/board/css/flaticon.css">
    <link rel="stylesheet" href="/resources/board/css/icomoon.css">
   
    
    <link rel="stylesheet" href="/resources/board/css/style.css"> <!-- 게시판 css들 여기까지 -->
    
    <link href="/resources/css/main.css" rel="stylesheet" /> <!-- 검색창 css코드 -->

    
    <%@include file="/WEB-INF/views/mobo/layout/header.jsp" %> <!-- 이걸 꼭 맨 아래에 둬야 먹히더라구여 다른 방법 아시면 의견 부탁드림니다 -->
  
<style>

a { text-decoration:none; }

.pagingNumber {
	cursor: pointer;
}

.col-md-4 {
	width : 25%;
}

.box{

/**아래 내용들은 알아서 변경 **/
  width: 100%;
  height: 350px;
  float: center;
  color: #E62200;
  max-width: 350px;
  padding-top: 30px;
  background: #fff;
  border-radius: 30px; 


/**이미지 위아래로 움직이는 효과 (이미 이미지 자체에 효과가 있긴 해서 필요 없음 빼면 됨)**/
  animation: up-down 1.4s infinite ease-in-out alternate;
}

@keyframes up-down{
  from{
    transform: translatey(0px);
  }
  to{
    transform: translatey(-20px);
  }
}



</style>



    


    <!-- 제목 --><!-- 여기를 복붙해서 모든 게시판에 각각 사용하기! 위에 css 추가 필수.... -->
      <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">MOVIE</h2>
            
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p>
            <a href="/mobo/movie/awardList"><img src="/resources/img/movieaward1.gif" class="box" ></a>
          </div>
        
        
        
        
        <!-- 검색창 -->
     
      <div class="s010">
       <form>
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
            
              <input id="search" type="text" name="search" placeholder="영화를 무부하세요" />
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
                  <button class="btn-search" id="searchBtn" type="button" onclick="movieList(1); movieListPaging();">SEARCH</button>
                </div>
              </div>
            </div>
          </div>
   	 </div>
   	
   	</form>
    </div> <!-- 검색창 div 태그 -->
    </div> <!-- 제목부터 검색까지 묶어주는 div 태그 -->
        
        
        <!-- 맨 위에 section 로 전체를 다 묶어놨어염. 검색창 css는 main.css 입니다. 거기에 s010이라 검색하시면 그라데이션 태그가 하나 있어여. 
        그라데이션 색은 거기서 색상 코드 입력해서 수정하시면 돼요. -->
        
        
        
        <div class="container">
        <div id="movieBox">
        <div class="row">
        
        <h2 class="mb-4">무부 추천영화</h2> <!-- 꼭 div row 다음에 넣어주기 -->
         <c:forEach items="${map.list3 }" var="list3" begin="0" end="4">
           <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              <a href="/mobo/movie/movierecomDetail?key=${list3.key }&image=${list3.image}" class="block-20" style="background-image: url('${list3.image}'); background-size:contain; height:250px;">
              </a>
              <div class="text p-4">
                <div class="meta mb-3" style="text-align: center;">
                 <div><a href="/mobo/movie/movierecomDetail?key=${list3.key }&image=${list3.image}">${list3.title }</a></div>
                </div>
<%--                 <h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=${list3.key }&=image${list3.image}">감독 | 개봉연도 | 장르 | 출연</a></h3> --%>
              </div>
            </div>
           </div> 
          </c:forEach>
        

          
          <h2 class="mb-4">지브리 추천영화</h2>
           <c:forEach items="${map.list4 }" var="list4" begin="0" end="4">
           <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              <a href="/mobo/movie/movierecomDetail?key=${list4.key }&image=${list4.image}" class="block-20" style="background-image: url('${list4.image}'); background-size:contain; height:250px;">
              </a>
              <div class="text p-4">
                <div class="meta mb-3" style="text-align: center;">
                 <div><a href="/mobo/movie/movierecomDetail?key=${list4.key }&image=${list4.image}">${list4.title }</a></div>
                </div>
<%--                 <h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=${list1.key }&=image${list1.image}">감독 | 개봉연도 | 장르 | 출연</a></h3> --%>
              </div>
            </div>
          </div> 
           </c:forEach>
          

          
           <h2 class="mb-4">잭 스나이더 감독 작품</h2>
           <c:forEach items="${map.list1 }" var="list1" begin="0" end="4">
           <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              <a href="/mobo/movie/movierecomDetail?key=${list1.key }&image=${list1.image}" class="block-20" style="background-image: url('${list1.image}'); background-size:contain; height:250px;">
              </a>
              <div class="text p-4">
                <div class="meta mb-3" style="text-align: center;">
                 <div><a href="/mobo/movie/movierecomDetail?key=${list1.key }&image=${list1.image}">${list1.title }</a></div>
                </div>
<%--                 <h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=${list1.key }&=image${list1.image}">감독 | 개봉연도 | 장르 | 출연</a></h3> --%>
              </div>
            </div>
          </div> 
           </c:forEach>
           
           <h2 class="mb-4">클린트 이스트우드 감독 작품</h2>
           <c:forEach items="${map.list2 }" var="list2" begin="0" end="4">
           <div class="col-md-4 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              <a href="/mobo/movie/movierecomDetail?key=${list2.key }&image=${list2.image}" class="block-20" style="background-image: url('${list2.image}'); background-size:contain; height:250px;)">
              </a>
              <div class="text p-4">
                <div class="meta mb-3" style="text-align: center;">
                 <div><a href="/mobo/movie/movierecomDetail?key=${list2.key }&image=${list2.image}">${list2.title }</a></div>
                </div>
<%--                 <h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=${list2.key }&image=${list2.image}">감독 | 개봉연도 | 장르 | 출연</a></h3> --%>
              </div>
            </div>
          </div> 
           </c:forEach>
          
          
          
          
        </div>
      </div>
      
      <div id="paging"></div>
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
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
  
  <script type="text/javascript">
  
  function movieList(curpage) {
	  
	  var search = $('#search').val();
	  
	  $.ajax({
		  type: 'get'
		  , url: '/mobo/movie/movierecomList'
		  , data: {'search' : search
			  	, 'curpage' : curpage}
		  , dataType: 'json'
		  , success: function(data) {
			  
			  $("#movieBox").html("");
			  
			  var searchList = "";
			  
			  searchList += '<div class="row">';
			  searchList += '<h2 class="mb-4">검색결과</h2>';

			  for(var i=0; i<data.length; i++) {
				  
				  console.log(data[i].title);
			        
				  searchList += '<div class="col-md-4">'
				  searchList += '<div class="blog-entry">'
				  if(data[i].image != null) {
				  searchList += '<a href="/mobo/movie/movierecomDetail?key=' + data[i].key + '&image=' + data[i].image + '" class="block-20" style="background-image: url(' + data[i].image + '); background-size:contain; height:250px">'
				  } else { 
				  searchList += '<a href="/mobo/movie/movierecomDetail?key=' + data[i].key + '&image=' + data[i].image + '" class="block-20" style="background-image: url(/resources/img/noImage.png); background-size:contain; height:250px">'
				  }
				  searchList += '</a>'
				  searchList += '<div class="text p-4 d-block">'
				  searchList += '<div class="meta mb-3">'
				  searchList += '<div><a href="/mobo/movie/movierecomDetail?key=' + data[i].key + '&image=' + data[i].image + '">' + data[i].title + '</a></div>'
				  searchList += '</div>'
				  
				  if(data[i].directors != null ) {
				  searchList += '<h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=' + data[i].key + '&image=' + data[i].image + '">' + data[i].directors + ' | ' + data[i].genres + '</a></h3>'
				  } else {
				  searchList += '<h3 class="heading"><a href="/mobo/movie/movierecomDetail?key=' + data[i].key + '&image=' + data[i].image + '"> 정보 없음 | ' + data[i].genres + '</a></h3>'
				  }
				  
				  searchList += '</div>' 
				  searchList += '</div>' 
				  searchList += '</div>' 
				  
				  }
				  
				  searchList += '</div>' 
				  
				  $('#movieBox').html(searchList);
		 	 }
	  })
  }
  
  function movieListPaging() {
	  
	  var search = $('#search').val();
	  
	  $('#paging').html("");
	  
	  $.ajax({
		  type: 'get'
		  , url: '/mobo/movie/movierecomListPaging'
		  , data: {'search' : search}
		  , dataType: 'json'
		  , success: function(data) {
  		
			if(data > 1) {
		  		var pagingList = "";
		  		
			    pagingList +=   '<div class="row mt-5">'
				pagingList +=    '<div class="col text-center">'
				pagingList +=      '<div class="block-27">'
				pagingList +=        '<ul>'
				pagingList +=          '<li><a href="#">&lt;</a></li>'
				for(var i=1; i<=data; i++) {
					if(i == 1) {
				pagingList +=          '<li id="selectNum' + i + '" class="active"><a onclick="movieList(' + i + '); pagingNumberColor(' + i + ',' + data + ')" class="pagingNumber">'+ i +'</a></li>' 
					} else {
				pagingList +=          '<li id="selectNum' + i + '"><a onclick="movieList(' + i + '); pagingNumberColor(' + i + ',' + data + ')" class="pagingNumber">'+ i +'</a></li>' 
					}
				}
				pagingList +=          '<li><a href="#">&gt;</a></li>'
				pagingList +=        '</ul>'
				pagingList +=      '</div>'
				pagingList +=    '</div>'
				pagingList +=  '</div>'
			
				$('#paging').html(pagingList);
			}
		  }
	  })			
  }
  
  function pagingNumberColor(curpage, totalpage) {
	  
	  $('#selectNum' + curpage).addClass('active');
	  
	  for(var i=1; i<=totalpage; i++) {
		  if(i != curpage) {
			  $('#selectNum' + i).removeClass('active');
		  }
	  }
  }
  
  
  </script>
