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

<!--     <link rel="stylesheet" href="/resources/board/css/bootstrap-datepicker.css"> -->
<!--     <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css"> -->

<!--     <link rel="stylesheet" href="/resources/board/css/flaticon.css"> -->
<!--     <link rel="stylesheet" href="/resources/board/css/icomoon.css"> -->
   
    
    <link rel="stylesheet" href="/resources/board/css/style.css"> <!-- 게시판 css들 여기까지 -->
    
    <link href="/resources/css/main.css" rel="stylesheet" /> <!-- 검색창 css코드 -->

    
    <%@include file="/WEB-INF/views/mobo/layout/header.jsp" %> <!-- 이걸 꼭 맨 아래에 둬야 먹히더라구여 다른 방법 아시면 의견 부탁드림니다 -->
  
<style>
a { text-decoration:none; }
.box{

/**아래 내용들은 알아서 변경 **/
  width: 100%;
  height: 250px;
  color: #E62200;
  max-width: 1600px;
/*   padding-top: 30px; */
/*   padding-bottom: 30px; */
	position: relative;
	top : 70px;
  background: #fff;
  border-radius: 30px; 


/**이미지 위아래로 움직이는 효과 (이미 이미지 자체에 효과가 있긴 해서 필요 없음 빼면 됨)**/
/*   animation: up-down 1.4s infinite ease-in-out alternate; */
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


<script>
        $(document).ready(function () {
        	
        	
        	//민음사 모음
        	getBookInfo("7ab4fb38af1de0cf515ccc51bc417dd5",{
                query:"민음사",
                target:'publisher'
             },"#minuemsa");
        	getBookInfo("7ab4fb38af1de0cf515ccc51bc417dd5",{
                query:["김영하"],
                target:'authors'
             },"#kimyongha");
        	getBookInfo("7ab4fb38af1de0cf515ccc51bc417dd5",{
                query:"2021",
                target:'datetime'
             },"#newBook");
        	getBookInfo("7ab4fb38af1de0cf515ccc51bc417dd5",{
        		query:["정유정"],
                target:'authors'
             },"#hankang");
        	
        	
        	
        	
        	

        })
     
        function searchBook(page){
        	console.log("search")
        	
        	
        	
        	var title = $("#search").val()
        	console.log(title)
        	
        	searchBookInfo("7ab4fb38af1de0cf515ccc51bc417dd5",{
        		query:title,
                target:'title',
                page : page,
                size : 12
             }
        	
        	);
        	
        	
        }
        
        
        // 별점 가져오기
        function getStarRating(isbn,arrayRating){
        	$.ajax({
                url: "/mobo/book/bookrecom",
                type : "post",
                dataType:"json",
                data: {isbn:isbn},
                success : function(result){
                	console.log("성공!!!")
                	console.log(result);
                	
                	
                	for(var i = 0; i < arrayRating.length; i++){
                		
                		
                		arrayRating.get(i).append(result[i].AVG.toFixed(1))
                		
                	}
                	
                	
                }
            })
        }
        
        
        
        
        function searchBookInfo(key,data){
        	
        	 $(".category").remove()
        	 $("#searchCategory").children().remove()
             $("#searchCategory").append(`
             						<h2>${'${data.query}'}에 대한 검색목록</h2>			
            						 `)
        	//ajax로 데이터 불러오기
        	$.ajax({
                url: "https://dapi.kakao.com/v3/search/book",
                headers: {'Authorization': 'KakaoAK '+ key},
                type : "get",
                data:data,
                success : function(result){
                   	for(var i = 0; i< result.documents.length; i++){
                   	$("#searchCategory").append(`
                   			<div class="col-md-3">
				            <div class="blog-entry">
				            <a href="/mobo/book/detail?isbn=${'${result.documents[i].isbn }'}" class="block-20" style="background-image: url('${'${result.documents[i].thumbnail}'}');">
				              </a>
				              <div class="text p-4 d-block">
				                <div class="meta mb-3">
				                  <div><a href="/mobo/book/detail?isbn=${'${result.documents[i].isbn }'}">${'${result.documents[i].title }'}</a></div>
				                </div>
				                <h6 class="heading"><a href="/mobo/book/detail?isbn=${'${result.documents[i].isbn }'}">작가:${'${result.documents[i].authors }'} </a></h6>
				              </div>
				            </div>
				          </div>
                   			`)
                   	}
                    
                    console.log(result.meta.total_count)
                    console.log(data.page)
                    
                    var totalData = result.meta.total_count;	// 총 데이터수
                    var dataPerPage = data.size;				// 한 화면에 나타낼 데이터 수
                    var pageCount = 5;							// 한 화면에 나타낼 페이지 수
                    
                    var currentPage = data.page;				// 현재 페이지
                    
                    var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
                    var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
                    
                    console.log("전체 개수:"+totalData)
                    console.log("total페이지:"+totalPage)
                    console.log("curpage페이지:"+currentPage)
                    console.log("페이지그룹:"+pageGroup)
                    console.log("한화면에 나타낼 데이터수:"+dataPerPage)
                    
                    
                    
                    
                    
                    
                    var last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
                    console.log("last : " + last);
                    if(last > totalPage)
                        last = totalPage;
                    var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
                    var next = last+1;
                    var prev = first-1;
                    
                    console.log("last : " + last);
                    console.log("first : " + first);
                    console.log("next : " + next);
                    console.log("prev : " + prev);
                    
                    if (totalPage <= 1){
                    	first = last;
                    }
                    console.log("first : " + first);
                    
                    
                    
                   
                    		var pagingList = "";
                    	 	pagingList +=   '<div class="row mt-5">'
             				pagingList +=    '<div class="col text-center">'
             				pagingList +=      '<div class="block-27">'
             				pagingList +=        '<ul>'
             				
             				
             				
             				
             				
             				if(prev > 0){
             				pagingList +=          '<li><a onclick="clickPaging('+prev+')">&lt;</a></li>'
             				}
             				for(var i=first; i<=last; i++) {
             				pagingList +=          '<li id="selectNum' + i + '"><a onclick="searchBook('+ i +'); pagingNumberColor(' + i + ',' + totalPage + ');" class="pagingNumber">'+ i +'</a></li>' 
             				}
             				if(last < totalPage){
	             				pagingList +=          '<li><a onclick="clickPaging('+next+')">&gt;</a></li>'
             				}
             				
             				
             				
             				
             				
             				pagingList +=        '</ul>'
             				pagingList +=      '</div>'
             				pagingList +=    '</div>'
             				pagingList +=  '</div>'
             				
             				$('#paging').html(pagingList);
             				$('#paging li#selectNum'+currentPage).addClass('active')
                    
                    
                }
            });
        	
        	
        	 
        	 $("#search").focus();
        }
        function clickPaging(page){
        	console.log("클릭클릭")
    		
        	
    		
//     		 if($id == "next")    selectedPage = next;
//              if($id == "prev")    selectedPage = prev;
    		
             searchBook(page)
        }
        function pagingNumberColor(curpage, totalpage) {
        	  console.log("click!!!!!!!!!!!!!")
        	  $('#selectNum' + curpage).addClass('active');
        	  
        	  for(var i=1; i<=totalpage; i++) {
        		  if(i != curpage) {
        			  $('#selectNum' + i).removeClass('active');
        		  }
        	  }
          }
        
        // 민음사 카테고리
		function getBookInfo(key,data,gategory){
        	// 이미지 타이틀 태그
        	var arrayTitle =  $(gategory+" .meta > div > a");
        	var arrayImg =  $( gategory+" .blog-entry");
        	var arrayRating = $(gategory+" .heading > a");
        	//ajax로 데이터 불러오기
        	$.ajax({
                url: "https://dapi.kakao.com/v3/search/book",
                headers: {'Authorization': 'KakaoAK '+ key},
                type : "get",
                data:data,
                success : function(result){
               	 
                	// isbn 배열에 넣기 
                	var isbn = new Array();
                	for(var i = 0; i < arrayTitle.length; i++){
                		isbn.push(result.documents[i].isbn); 
                	}
                	console.log(isbn)
                	// 별점 가져오기
                	getStarRating(isbn,arrayRating)
                	
                   	for(var i = 0; i < arrayTitle.length; i++){

						var img = `
							<a href="/mobo/book/detail?isbn=${'${result.documents[i].isbn }'}" class="block-20" style="background-image: url('${'${result.documents[i].thumbnail}'}');">

						`
                   	
	                    arrayTitle.get(i).append(result.documents[i].title)

	                    $(img).prependTo(arrayImg.get(i));
                    	
                   }
                    
                   
                    
                }
            });
        }
</script>		
           
 <div class="container">
	<a href="/mobo/book/awardsList"><img src="/resources/img/bookaward2.gif" class="box"></a> <!-- div에 넣어서 해도 됨-->
 </div>




    <!-- 제목 --><!-- 여기를 복붙해서 모든 게시판에 각각 사용하기! 위에 css 추가 필수.... -->
      <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">책추천</h2>
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
                  <button type="button" class="btn-delete" id="delete">RESET</button>
                  <button type="button" class="btn-search" onclick='searchBook(1);'>SEARCH</button>
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
        <!-- 1번 카테고리 -->
        <div class="row category" id="minuemsa">
        <h2 class="mb-4">민음사 모음</h2> <!-- 꼭 div row 다음에 넣어주기 -->
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry">
					<!-- 이미지 들어가는 곳 -->
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="100">
				<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
         </div>
         
         
         <!-- 2번 카테고리 -->
        <div class="row category" id="kimyongha">
        <h2 class="mb-4">김영하 컬렉션</h2> <!-- 꼭 div row 다음에 넣어주기 -->
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry">
					<!-- 이미지 들어가는 곳 -->
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="100">
				<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
         </div>
          
        <!-- 3번 카테고리 -->
        <div class="row category" id="newBook">
        <h2 class="mb-4">2021 신작 도서</h2> <!-- 꼭 div row 다음에 넣어주기 -->
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry">
					<!-- 이미지 들어가는 곳 -->
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="100">
				<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
         </div>
          
          <!-- 3번 카테고리 -->
        <div class="row category" id="hankang">
        <h2 class="mb-4">정유정 컬렉션</h2> <!-- 꼭 div row 다음에 넣어주기 -->
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry">
					<!-- 이미지 들어가는 곳 -->
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="100">
				<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry" data-aos-delay="200">
              	<!-- 이미지 들어가는 곳 -->
              <div class="text p-4">
                <div class="meta mb-3">
                  <div><a href="#"></a></div>
                </div>
                <h3 class="heading"><a href="#">평점:</a></h3>
              </div>
            </div>
          </div>
         </div>
         
         
          <div class="row" id="searchCategory">
         
          </div>
          

      
      
      <div id="paging"></div>
      
      <div class="row mt-5">
                           
        
      
      
      
      
      
      
    </section>
    






<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>




























  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/resources/board/js/jquery.min.js"></script>
  <script src="/resources/board/js/jquery-migrate-3.0.1.min.js"></script>
<!--   <script src="/resources/board/js/popper.min.js"></script> -->
<!--   <script src="/resources/board/js/bootstrap.min.js"></script> -->
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