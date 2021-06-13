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

	<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() { 
	
	if(${isMovieBestLike }) {
		$("#btnMovieBestLike").find("i").addClass("fa").removeClass("far")
	} else { //추천 취소 성공
		$("#btnMovieBestLike").find("i").addClass("far").removeClass("fa")
	}
	
	$("#btnMovieBestLike").click(function() {
		
		$.ajax({
			type: "GET"
			, url: "/mobo/movie/like"
			, data: { "movieBestNo": '${view.movieBestNo }' }
			, dataType: "json"
			, success: function( data ) {
				console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnMovieBestLike").find("i").addClass("fa").removeClass("far")
				} else { //추천 취소 성공
					$("#btnMovieBestLike").find("i").addClass("far").removeClass("fa")
				}
				
// 				if( data.result ) { //추천 성공
// 					$("#btnMovieBestLike")
// 					.removeClass("bubbly-button")
// 					.addClass("bubbly-button")
// 					.html('추천');
					
				
// 				} else { //추천 취소 성공
// 					$("#btnMovieBestLike")
// 					.removeClass("bubbly-button")
// 					.addClass("bubbly-button")
// 					.html('추천');
					
				
// 				}                                                                                                               
	
				//추천수 적용
// 				$("#btnMovieBestLike").html(data.cnt);
				$("#bestLike").html(data.cnt);
			}
			, error: function() {
				console.log("실패"); 
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end
	
	// 댓글 입력
	$("#btnmoviebestcomment").click(function() {
		
		$form = $("<form>").attr({
			action: "/mobo/movie/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"movieBestNo",
				value:"${view.movieBestNo }"
			})
		).append(
			$("<textarea>")
				.attr("name", "commentText")
				.css("display", "none")
				.text($("#exampleFormControlTextarea1").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end
	
});


//댓글 좋아요 버튼 클릭
function moviebestComment( commentNo ) {

	console.log('function moviebestComment called', commentNo)
	
	$.ajax({
		type: "GET"
		, url: "/mobo/movie/like/comment"
		, data: { "movieBestNo": '${view.movieBestNo }' , "commentNo": commentNo}
		, dataType: "json"
		, success: function( data ) {
			console.log("성공");

			if( data.result ) { //추천 성공
				$("[data-commentno='"+commentNo+"']").find("i")
				.removeClass("far")
				.addClass("fa")
		
			} else { //추천 취소 성공
				$("[data-commentno='"+commentNo+"']").find("i")
				.removeClass("fa")
				.addClass("far")
			}

			//추천수 적용
			$("[data-commentno='"+commentNo+"']").find(".bestCommentLike").html(data.cnt)
		}
		, error: function() {
			console.log("실패"); 
		}
	}); //ajax end
	
} //function moviebestComment end

function deleteComment(commentNo) {
	
	$.ajax({
		type: "post"
		, url: "/mobo/movie/comment/delete"
		, dataType: "json"
		, data: {
			commentNo: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}






</script>	   

	
<style>

.button1{
	float:left;
}


.button2 {
	text-align: center;
	
}

#mainlist{
	float: right;
	
}



#deleteComment{
	float:right;
	text-align: right;
	padding: 10px 15px;
}

#btnmoviebestcomment{
	float:right;
	text-align: right;
}

#attention {
color: #bcbcbc;
	
}

.btn {
  padding: 0.66em 2.25em;
  text-decoration: none;
  position: relative;
  display: inline-block;
}
.btn:after {
  content: "";
  display: block;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0.125em;
  left: 0.125em;
  border-bottom: 0.125em solid;
  border-right: 0.125em solid;
}
.btn:active {
  transform: translate(0.125em, 0.125em);
}
.btn:active:after {
  transform: translate(-0.125em, -0.125em);
}

.btn-filled {
  background-color: #ddccf5;
  color: #fff;
  transition: background-color 0.2s ease-out;
}
.btn-filled:after {
  border-color: #ddccf5;
  transition: border-color 0.2s ease-out;
}
.btn-filled:hover {
  background-color: #ddccf5;
}
.btn-filled:hover:after {
  border-color: #ddccf5;
}

.btn-outline {
  color: #ddccf5;
  box-shadow: inset 0 0 0 0.125em currentcolor;
  transition: color 0.2s ease-out;
}
.btn-outline:after {
  border-color: currentcolor;
}
.btn-outline:hover {
  color: #ddccf5;
}

.btn-outline-fill {
  color: #ddccf5;
  box-shadow: inset 0 0 0 0.125em #e4457d;
  background-color: transparent;
  transition: color 0.2s ease-out, box-shadow 0.2s ease-out, background-color 0.2s ease-out;
}
.btn-outline-fill:after {
  border-color: #ddccf5;
}
.btn-outline-fill:hover {
  color: #fff;
  background-color: #ddccf5;
  box-shadow: inset 0 0 0 0.125em transparent;
}
.btn-outline-fill:hover:after {
  border-color: #ddccf5;
}


.bubbly-button {
  font-family: "Helvetica", "Arial", sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 50px; 
  margin-bottom: 50px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #c2b0f2;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(218, 183, 234, 1);
}
.bubbly-button:focus {
  outline: 0;
}
.bubbly-button:before, .bubbly-button:after {
  position: absolute;
  content: "";
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 20%, #c2b0f2 20%, transparent 30%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 10%, #c2b0f2 15%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 10%, #c2b0f2 15%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button:active {
  transform: scale(0.9);
  background-color: #dab7ea;
  box-shadow: 0 2px 25px rgba(218, 183, 234, 1);
}
.bubbly-button.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}



.rembutton{
  border-radius: 5px;
  padding: 10px 15px;
  font-size: 22px;
  text-decoration: none;
  margin: 20px;
  color: #fff;
  position: relative;
  display: inline-block;
  outline: 0;
  border: 0;
  float: right;

}


.rembutton:focus {
	outline: none;
}

.rembutton:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}

.purple {
  background-color: #b3b7ef;
  box-shadow: 0px 5px 0px 0px #dddff8;
}

.purple:hover {
  background-color: #dddff8;
}


</style>

 


    
    <!-- 본문 -->
    <section class="ftco-section"> <!-- 이 section 안에 넣어놔야 전체적인 디자인이 맞음 -->
      <div class="container">
        <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">Highlight</span>
            <h2 class="mb-4">${view.title }</h2>
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p>
          </div>
        </div>
        
        <c:forEach items="${list }" var="image" varStatus="status">
        	<c:if test="${image.storedName != null && status.index == 0 }">
        		<c:set var="image1" value="${image.storedName}" />
        	</c:if>
        	<c:if test="${image.storedName != null && status.index == 1 }">
        		<c:set var="image2" value="${image.storedName}" />
        	</c:if>
        	<c:if test="${image.storedName != null && status.index == 2 }">
        		<c:set var="image3" value="${image.storedName}" />
        	</c:if>
        </c:forEach>
        
        
        
        <div class="row">
        
      
        
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
          
          <c:choose>
              <c:when test="${view.title == '타오르는 여인의 초상' }">
               <a href="#" class="image" style="background-image: url('/resources/board/images/moviedetail1.jpg'); " data-scrollax=" properties: { translateY: '-20%'}">
              </a>
              </c:when>
              <c:otherwise>
               <a href="#" class="image" style="background-image: url('/getimg/${image1}');" data-scrollax=" properties: { translateY: '-20%'}"> 
              </a>
            
              </c:otherwise>
             </c:choose>
           
            <div class="text">
              <h4 class="subheading">#HIGHLIGHT 1</h4>
              <h2 id="title" class="heading">${view.subtitle1 }</h2> <!-- 마찬가지로 header에 title 코드 있음 -->
              <p id="p">
              ${view.content1 }</p>
            </div>
			
          </div>

          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <c:choose>
              <c:when test="${view.title == '타오르는 여인의 초상' }">
            <a href="#" class="image image-2 order-2" style="background-image: url('/resources/board/images/moviedetail2.jpg');" data-scrollax=" properties: { translateY: '-20%'}">
            </a>
           	</c:when>
              <c:otherwise>
               <a href="#" class="image image-2 order-2" style="background-image: url('/getimg/${image2}');" data-scrollax=" properties: { translateY: '-20%'}" >
              </a>
              </c:otherwise>
             </c:choose>

            <div class="text order-1">
              <h4 class="subheading">#HIGHLIGHT 2</h4>
              <h2 id="title" class="heading">${view.subtitle2 }</h2>
              <p id="p">${view.content2 } </p>

            </div>
          </div>
          
          
           
           
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
          <c:choose>
          <c:when test="${view.title == '타오르는 여인의 초상' }">
            <a href="#" class="image" style="background-image: url('/resources/board/images/moviedetail3.gif'); " data-scrollax=" properties: { translateY: '-20%'}"></a>
           </c:when>
              <c:otherwise>
              <a href="#" class="image" style="background-image: url('/getimg/${image3}');" data-scrollax=" properties: { translateY: '-20%'}">
              </a>
              </c:otherwise>
             </c:choose>
           
            <div class="text">
              <h4 class="subheading">#HIGHLIGHT 3</h4>
              <h2 id="title" class="heading">${view.subtitle3 }</h2>
              <p id="p">${view.content3 }
              </p>
            
            </div>
          </div>
      
        </div><!-- row 끝 -->
        
     <div class="button1">   
    <button class="bubbly-button">북마크</button>    
    </div>
    
    <div class="button2">   
  <button id="btnMovieBestLike" class="bubbly-button" ><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;<span id="bestLike">${cntMovieBestLike }</span> 
 </button> 
  </div>

	
	
	<!-- 비로그인 -->
	<c:if test="${not login }">
	
	<button id="mainlist" class="btn btn-filled" onclick='location.href="/mobo/movie/moviebestboard";'>목록</button>
	<button id="join" class="btn btn-outline-fill" onclick='location.href="/mobo/signup/form";'>회원가입</button>
	<button id="login" class="btn btn-outline-fill" onclick='location.href="/mobo/sign/login";'>로그인</button>
	
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${login }">
	
	<p id="attention">본 영화와 관련 없는 댓글은 관리자에 의하여 무통보 삭제될 수 있습니다</p>
	  
	<!-- 댓글 -->

	<div class="card-header bg-replay">
	        <i class="fa fa-comment fa"></i> 댓글
	</div>
	<!-- 댓글 리스트 -->
	
	
	<c:forEach items="${movieBestCommentList }" var="movieBestCommentList">
		<ul class="list-group list-group-flush" data-commentno="${movieBestCommentList.commentNo}">
		    <li class="list-group-item">
				<div class="form-inline mb-2">
					<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>&nbsp;&nbsp;&nbsp;<b>${movieBestCommentList.nick }</b>
					&nbsp;&nbsp;&nbsp;
					
					<fmt:formatDate value="${movieBestCommentList.commentDate }" pattern="yyyy-MM-dd"/>
					
				</div>
			
				<div>
				${movieBestCommentList.commentText }
				</div>
			
				<div>
				
				<c:if test="${sessionScope.nick ne movieBestCommentList.nick }">
				<button class="btnMovieBestCommentLike rembutton purple" onclick="moviebestComment(${movieBestCommentList.commentNo });"  >
				<i class="far fa-thumbs-up" aria-hidden="true"></i>
				&nbsp;&nbsp;
				<span class="bestCommentLike">${movieBestCommentList.commentcnt }</span>
				</button>
				</c:if>
	 			</div>
	 			
	 			
				<c:if test="${sessionScope.nick eq movieBestCommentList.nick }">
			    <button type="submit" id="deleteComment" class="btn bg-replay mt-3" onclick="deleteComment(${movieBestCommentList.commentNo });">삭제</button>
			    </c:if>
			
		    </li>
		</ul>
		</c:forEach>
	
	        
	
	<div class="form">
	<div class="card-body bg-replay">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
				<input type="text" class="form-control ml-2" name="id" placeholder="아이디" id="moviebestcommentid" value="${id }" readonly="readonly">
				<input type="text" class="form-control ml-2" name="nick" placeholder="닉네임" id="moviebestcommentnick" value="${nick }" readonly="readonly">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" name="commentText" rows="3"></textarea>
			<button type="button" id="btnmoviebestcomment" class="btn bg-replay mt-3" >댓글 등록</button>
		    </li>
		</ul>
	</div>
	</div>
	

	</c:if>
	
	
	<br>
	
	
</div>


	</section>
	
	
	
	<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
	

    
    
    
    
    
    
    
    
    
    
   
   <script type="text/javascript">

	var animateButton = function(e) {

		  e.preventDefault;
		  //reset animation
		  e.target.classList.remove('animate');
		  
		  e.target.classList.add('animate');
		  setTimeout(function(){
		    e.target.classList.remove('animate');
		  },700);
		};

		var bubblyButtons = document.getElementsByClassName("bubbly-button");

		for (var i = 0; i < bubblyButtons.length; i++) {
		  bubblyButtons[i].addEventListener('click', animateButton, false);
		}

		
</script>
    
   



    

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
  
  <script src="/resources/board/js/particles.min.js"></script>
  <script src="/resources/board/js/particle.js"></script>
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
  </body>
</html>
    
    

    
    