<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/board/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/board/css/animate.css">
    
    <link rel="stylesheet" href="/resources/board/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/board/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/board/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/board/css/aos.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/resources/board/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/board/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css">


    <link rel="stylesheet" href="/resources/board/css/flaticon.css">
    <link rel="stylesheet" href="/resources/board/css/icomoon.css">

    <link rel="stylesheet" href="/resources/board/css/style.css"> <!-- 이 css가 메인임 -->
    <link rel="stylesheet" href="/resources/css/starRating.css"> 
    <link rel="stylesheet" href="/resources/css/button.css"> 

    
    
    
	<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />
	<!-- 	chart.js CDN 설정 -->
	<script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
	<!-- 별점 마우스 호버 -->
	<script type="text/javascript">
	//별 선택 위치 변수
	var idx = -1;
	$(document).ready(function() {
		
		//별 클릭 이벤트
		$(".star").click(function() {
			//클릭된 별이 몇 번째 칸인지 알아내기
			idx = $(this).index();
			
			//모두 투명하게 만들기
			$(".star").removeClass("on")
			
			//클릭이 된 곳까지 채워진 별로 만들기
			for(var i=0; i<=idx; i++) {
				$(".star").eq(i).addClass("on");
			}
			
			//선택한 별점 숫자를 클릭위치값으로 고정
			showStarValue(idx);
			
			$("#star").val( $("#grade").text() );
			$("form").submit();
			
		})
		
		//마우스를 올리면 별 채워지기
		var hover_idx = -1;
		$(".star").mouseover(function() {
			//클릭된 별이 몇 번째 칸인지 알아내기
			hover_idx = $(this).index();
			
			//모두 투명하게 만들기
			$(".star").removeClass("on")
			
			//클릭이 된 곳까지 채워진 별로 만들기
			for(var i=0; i<=hover_idx; i++) {
				$(".star").eq(i).addClass("on");
			}
			
			//선택한 별점 숫자를 마우스움직임에 따라 변경
			showStarValue(hover_idx);
			
		})
		
		//마우스를 떼면 클릭된 값으로 초기화시키기
		$(".star").mouseout(function() {
			
			//별점 숫자를 클릭된 값으로 초기화
			showStarValue(idx);
			
			//모두 투명하게 만들기
			$(".star").removeClass("on")
			
			//클릭이 된 곳까지 채워진 별로 만들기
			for(var i=0; i<=idx; i++) {
				$(".star").eq(i).addClass("on");
			}
			
		})
	})
	
	//별 선택 값을 숫자로 보여주는 함수
	function showStarValue(val) {
		if( val < 0) {
			val = 0;
		} else {
			val = (val+1)/2;
		}
		
		$(".star-value").html(val);
	}
	</script>
	<!-- 작가별 책 데이터 가져오기 -->
	<script type="text/javascript">
	
	function getBookInfoByAuthors(authors, index){
		$.ajax({
            url: "https://dapi.kakao.com/v3/search/book",
            headers: {'Authorization': 'KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5'},
            type : "get",
            data:{
            	query:authors,
                target:'authors'
            },
            success : function(result){
            	console.log("성공!!")
            	console.log(result)
            	
            	$("#authors").append( 
							`
							<div class="col-md-3">
					            <div class="blog-entry">
					            <a href="/mobo/book/detail?isbn=${'${result.documents[index].isbn }'}" class="block-20" style="background-image: url('${'${result.documents[index].thumbnail}'}');">
					              </a>
					              <div class="text p-4 d-block">
					                <div class="meta mb-3">
					                  <div><a href="/mobo/book/detail?isbn=${'${result.documents[index].isbn }'}">${'${result.documents[index].title }'}</a></div>
					                </div>
					                
					              </div>
					            </div>
					          </div>
							`
            				)
            	
            	
            	
            	
            }
		});
	}
	function getBookDetailInfo(){
		$.ajax({
            url: "https://dapi.kakao.com/v3/search/book",
            headers: {'Authorization': 'KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5'},
            type : "get",
            data:{
            	query:"${isbn }",
                target:'isbn'
            },
            success : function(result){
            	$(".block-3").prepend(`
									<a href="portfolio.html" class="image" style="background-image: url('${'${result.documents[0].thumbnail}'}'); width: 23%;" data-scrollax=" properties: { translateY: '-20%'}">
									 </a>
            						`)
            	$(".subheading").append(`<h2 class="mb-4">${'${result.documents[0].title}'}</h2>`)
            	$(".subheading").append(`<input type="hidden" value="${'${result.documents[0].title}'}" id="title"/>`)
            	$("h4[class='subheading']").next().append(`<p>${'${result.documents[0].authors}'}</p>
            	           `)
            	           
            	           
            	$("#info").append(`<p>${'${result.documents[0].authors}'}</p>`)
            	$("#info").append(`<p>${'${result.documents[0].contents}'}...</p>`)
            	
            	for(var i = 0; i< 4; i++){
            		//
	            	getBookInfoByAuthors(result.documents[0].authors,i)
            	}
            	 
            }
	}); 
	}
	function getAgeDistribution(){
		$.ajax({
			type : 'get'
			, url : '/mobo/book/ageDistribtion'
			, dataType : 'json'
			, data : {
						'isbn' : "${isbn }"
					 }
			, success : function(result){
				
				console.log(result.AGE)

				
				for(var i = 0; i < result.length; i++){
					console.log(result[i])
				}
				
					getChart(result)
			}
			
		})
	}
	
	$(document).ready(function(){
		// 책 디테일 정보 가져오기
		getBookDetailInfo()
		// 책 연령대별 평균별점 가져오기
		getAgeDistribution()
		
		// 북마크 추가 삭제
		$("#bookMark").click(function() {
			console.log("click!!")
			
			$.ajax({
            url: "/mobo/book/bookMark",
            type : "post",
            dataType:"json",
            data:{ "key":"${isbn }" },
            success : function(result){
            	console.log("인서트성공!!")
            	console.log(result)
            	if(result){
 	           		console.log("북마크 삭제")
 	           		$("#bookMarkView").children().remove();
 	           		$("#bookMarkView").append(`
 	           				<img class="pull-right"src="/resources/img/gray_hart.png" style="width: 15%; position: relative; bottom: 120px;" class="pull-left">
 	           				`)
            		
            	}else{
 	           		console.log("북마크 삽입")
 	           		$("#bookMarkView").children().remove();
 	           		$("#bookMarkView").append(`
 	           				<img class="pull-right"src="/resources/img/pink_hart.png" style="width: 15%; position: relative; bottom: 120px;" class="pull-left">
 	           				`)
			            	}
			            	
			            }
						
					})
					
				})//$("#bookMark").click(function() end
	
			// 별점 입력 수정
			$("#starBtn").click(function() {
					var starRating = $("#starValue").html();
					$.ajax({
						type : 'get'
						, url : '/mobo/book/starRatingInsert'
						, data : {'starRating' : starRating
									, 'isbn' : "${isbn }"
									, 'title' : $("#title").val()
								 }
						
					})
			}) //$("#starBtn").click(function() end
		
						
			
		
		
		
		
	}) 

	</script>
	
	
	
	
	
	
	
	   
<!-- p 태그에 id=p 가 있는데 header 가면 제가 #p 해놓은 거 있어요 그거 수정하시면 바뀝니다 
만약 책 게시판을 바꾸시려면 다른 아이디나 클래스로 바꿔서 글꼴 바꾸심 돼요.-->
    
    <!-- 본문 -->
    <section class="ftco-section"> <!-- 이 section 안에 넣어놔야 전체적인 디자인이 맞음 -->
      <div class="container">
        <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">맨부커 상</span>
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p>
            <div id="bookMarkView">
            <c:if test="${not empty login }">
            	<c:if test="${!bookMark }">
             		<img class="pull-right"src="/resources/img/gray_hart.png" style="width: 15%; position: relative; bottom: 120px;" class="pull-left">
            	</c:if>
            	<c:if test="${bookMark }">
             		<img class="pull-right"src="/resources/img/pink_hart.png" style="width: 15%; position: relative; bottom: 120px;" class="pull-left">
            	</c:if>
            </c:if>
            </div>
          </div>
        </div>
        <div class="row" style="max-width: 110%;">
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <div class="text">
            <c:if test="${not empty login }">
              <div class="pull-right button1">
              <input class="bubbly-button" type="button" value="북마크" id="bookMark"/></div>
            </c:if>
              <h4 class="subheading"></h4>
              <p id="p"></p>
             	<img src="/resources/img/pinkStar.png" style="width: 6.3%; " class="pull-left">
              <h4>평점:<fmt:formatNumber value="${avg.AVG }" pattern=".0"/></h3>
              <br>
              <c:if test="${not empty userno }">
              <div class="star-box" >
				<span class="star star_left"></span><!-- 
				 --><span class="star star_right"></span><!-- 
				 --><span class="star star_left"></span><!-- 
				 --><span class="star star_right"></span><!-- 
				 --><span class="star star_left"></span><!-- 
				 --><span class="star star_right"></span><!-- 
				 --><span class="star star_left"></span><!-- 
				 --><span class="star star_right"></span><!-- 
				 --><span class="star star_left"></span><!-- 
				 --><span class="star star_right"></span>
				 
			</div>
            <div class="star-value" id="starValue">0</div>
	
				<button type="button" id="starBtn">별점 입력</button>
            
              </c:if>
            
            
            </div>
          </div>
        </div>
        
        <hr>
        <br>
        <div class="text" id="info">
        	<h4 class="subheading"></h4>
        </div>
        <br>
        <hr>
        <br>
        <div>
        <h2>별점 그래프</h2>
			
			<canvas id="myChart" width="400" height="400"></canvas>
<script>
function getChart(result){
	var ctx = document.getElementById('myChart').getContext('2d');
	var labelsData = {}
	
	
		
	
	
	
	var config = {
	    type: 'bar',
	    data: {
	        labels: [
				
	        	],
	        datasets: [{
	            label: '# of Votes',
	            data: [
	            	
	            ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	responsive: false,
	    	plugins: {
	    	    legend: {
	    		display : false
	    		}
	    	},
	    	
	        scales: {
	            y: {
	                beginAtZero: true,
	                max: 5
	                
	            }
	        }
	    }
	}
	
	
	// 데이터 넣기
	for(var i = 0; i < result.length; i++){
		config.data.labels[i] = result[i].AGE
		config.data.datasets[0].data[i] = result[i].AVG
	}
	console.log(config.data.datasets[0].data)
	
	
	
	
	//차트 그리기
	var myChart = new Chart(ctx, config);
	
	
	
	
	
	
}

</script>
			
			
			
        </div>
        <br>
        <hr>
        <br>
        <div class="row"id="authors">
        <h2>이 작가의 다른 작품</h2>
        
        
        </div>
        <br>
        

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
<!--   <script src="/resources/board/js/jquery.timepicker.min.js"></script> -->
<!--   <script src="/resources/board/js/particles.min.js"></script> -->
<!--   <script src="/resources/board/js/particle.js"></script> -->
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
<!--   </body> -->
<!-- </html> -->
    
    

    
    