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
    
    
    
	<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />
	
	
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
	
	
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$.ajax({
	            url: "https://dapi.kakao.com/v3/search/book",
	            headers: {'Authorization': 'KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5'},
	            type : "get",
	            data:{
	            	query:${isbn },
	                target:'isbn'
	            },
	            success : function(result){
	            	$(".block-3").prepend(`
										<a href="portfolio.html" class="image" style="background-image: url('${'${result.documents[0].thumbnail}'}'); width: 23%;" data-scrollax=" properties: { translateY: '-20%'}">
										 </a>
	            						`)
	            	$(".subheading").append(`<h2 class="mb-4">${'${result.documents[0].title}'}</h2>`)
	            	$("h4[class='subheading']").next().append(`<p>${'${result.documents[0].authors}'}</p>
	            	           `)
	            	           
	            	           
	            	 $("#info").append(`<p>${'${result.documents[0].authors}'}</p>`)
	            	 $("#info").append(`<p>${'${result.documents[0].contents}'}...</p>`)
	            }
		});
		
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
          </div>
        </div>
        <div class="row">
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <div class="text">
              <h4 class="subheading"></h4>
              <p id="p"></p>
              <h4>평점:${avg }</h3>
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
            </div>
          </div>
        </div>
        
        <hr>
        <div class="text" id="info">
        	<h4 class="subheading"></h4>
        </div>
        
        <hr>
        <div>
        <h2>별점 그래프</h2>
        
        </div>
        
        
        
        
        
        

	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> REPLY
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
				<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
				<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
				<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
		    </li>
		</ul>
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
<!--   <script src="/resources/board/js/jquery.timepicker.min.js"></script> -->
<!--   <script src="/resources/board/js/particles.min.js"></script> -->
<!--   <script src="/resources/board/js/particle.js"></script> -->
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
  </body>
</html>
    
    

    
    