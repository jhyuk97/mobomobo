<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
    
    
    
    

   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="/resources/board2/css/style.css">
   
   <link rel="stylesheet" href="/resources/board/css/style.css">
   
	<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
   
<style type="text/css">

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

#write {
	 float: right;
}

#hot {
	 float: left;
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

.deleteComment {
	float: right;
	text-align: right;
	padding: 10px 15px;
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

<script type="text/javascript">
$(document).ready(function (){
	
	listComment();
	
	$("#btnDebateBestLike").on("click",function(){
		console.log("클릭")
		console.log($(this).attr("id"))
		
		var urlData = "";
		var dataSet = "";
				
		
		if($(this).attr("id") === $("#btnDebateBestLike").attr("id")){
		console.log("클릭")
		// 게시글 추천
		urlData = '/mobo/book/debatelike';
		dataSet = {
				'dNo' : '${Debate.dNo}'
		}
		ajaxConn(urlData,dataSet);
			
		} else if($(this) === $("#btnDebateBestLike")){
		console.log("클릭")
			
		} 
		
	})//$("button").on("click",function(){end
	
	
})
	
	function ajaxConn(urlData,dataSet){
	
			console.log(urlData)
			console.log(dataSet)
		$.ajax({
			type : 'get'
			, url : urlData
			, dataType : 'json'
			, data : dataSet
			, success : function(result){
				
				console.log(result)
				
				$("#bestLike").text(result);
				
				
			}
			, error : function(){
				alert("실패")
			}
				
			
		})
		
		
}

</script>

		<section class="ftco-section ">
		<div class="container">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">${Debate.dTitle }</h2> <!--각자 게시판 영어 제목이 와야함-->
            <p id="p">당신의 인생 도서를 얘기해보세요!</p><!--각자 게시판 내용이 와야함 필요없음 제외 가능-->
          </div>
        </div>
        
	
	  <div class="row">
		<c:if test="${Debate.userno eq userno }">
			<div style="position: relative; top:-53px;"><button style="margin:0 10px; float: right;" id="write" class="btn btn-filled" onclick='location.href="/mobo/book/debateupdate?dNo=${Debate.dNo}";'>수정</button>
			<button style="float: right;" id="hot" class="btn btn-filled" onclick='location.href="/mobo/book/debatedelete?dNo=${Debate.dNo}";'>삭제</button></div>
		</c:if>
	
	<hr>
	
	<div>
		<div style="display:inline-block; margin-right : 50px; margin-bottom:16px;">${Debate.nick }</div>
		<div style="display:inline-block"><fmt:formatDate value="${Debate.dDate }" pattern="yy-MM-dd" /></div>
	</div>
	
	<hr>
	
	<div style="height: 500px;">${Debate.dContent }</div>
	<div style="text-align: center;" class="button2"> 
	<c:if test="${not empty login }">
  		<button style="width:110px; height:62px; font-size:15px;" id="btnDebateBestLike" class="bubbly-button" ><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;<span id="bestLike">${likeCnt }</span>
 		</button> 
	</c:if>
 		<button id="list" style="float: right; margin-top:50px; margin-bottom:50px; width:110px; height:62px; border:0px; font-size:15px;" class="btn btn-filled" onclick='location.href="/mobo/book/debate";'>목록</button>
  	</div>
	
	</div>
	
	<!-- 로그인 상태 -->

	<div class="card-header bg-replay">
           <i class="fa fa-comment fa"></i> 댓글
   </div>
   
   <div id="commentlist"></div>
   
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
         <button type="button" id="btnmoviebestcomment" class="btn bg-replay mt-3" onclick="writeComment();" style="float: right;">댓글 등록</button>
          </li>
      </ul>
   </div>
   </div>
</div>   
   
   
</section>
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>

  <script src="/resources/board2/js/popper.js"></script>

<!--   <script src="/resources/board2/js/main.js"></script> -->
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
  
<script type="text/javascript">
	function writeComment() {
		
		$.ajax( {
			type : 'get'
			, url : '/mobo/book/commentwrite'
			, data : {'dNo' : '${Debate.dNo}'
					, 'dcContent' : $("#exampleFormControlTextarea1").val()
			}
			, async : false
			, success : function() {
				console.log("성공")
				
				listComment();
			}
			, error : function() {
				console.log("실패")
			}
			
			});
	};
	
	function listComment() {
		
		console.log("확인")
		
		$.ajax( {
			type : 'get'
				, url : '/mobo/book/commentlist'
				, data : {'dNo' : '${Debate.dNo}'}
				, dataType : 'json'
				, success : function(comment) {
					console.log("여기 맞나?!?!?!?")
					console.log(comment)
					
					$("#commentlist").html();
					
					var html = "";
					
						
					for( var i=0; i<comment.length; i++) {
						html += "<ul class='list-group list-group-flush' data-dcNo='"+comment[i].dcNo+"'>"
						html +=	"	<li class='list-group-item'>"
						html +=	"		<div class='form-inline mb-2'>"
						html += "			<i class='fa fa-user-circle fa-2x' style='margin-right:10px;'></i>";
						html += 			comment[i].nick + " " + moment(comment[i].dcDate).format('YYYY-MM-DD')  +"</div> <br>"
						html += 			comment[i].dcContent + "<br>"
						
						if( ${sessionScope.userno} != comment[i].userno ) {
						
						html += 			'<button class="btnMovieBestCommentLike rembutton purple" onclick="likeComment('+comment[i].dcNo+');"  >'

						if(comment[i].hotState == 0) {
							html += '				<i class="far fa-thumbs-up" aria-hidden="true"></i>'
							} else {
							html += '				<i class="fa fa-thumbs-up" aria-hidden="true"></i>'
							}
							html += "				<span>" + comment[i].hotCnt + "</span>"
							html += '			</button>'
						}
//	 					html += "			<span> 추천여부 : " + comment[i].hotState + "</span> <br>"
						
						if( ${sessionScope.userno} == comment[i].userno ) {
							html += "			<input type='button' class='btn bg-replay mt-3 deleteComment' onclick='deleteComment(" + comment[i].dcNo + ")' value='삭제' />"
						}
						html += "			</div></li></ul>"
					}
					
					$("#commentlist").html(html);
				}
		})
	}

	function deleteComment(dcNo) {
		
		$.ajax( {
			type : 'get'
			, url : '/mobo/book/commentdelete'
			, data : {'dNo' : '${Debate.dNo}'
					,'dcNo' : dcNo
			}
			, success : function() {
				console.log("성공")
				
				listComment();
			}
			, error : function() {
				console.log("실패")
			}
			
			})
	}			
	
	function likeComment(dcNo) {
		console.log("likeComment " + dcNo)
		
		$.ajax( {
			type : 'get'
			, url : '/mobo/book/commentlike'
			, data : {'dNo' : '${Debate.dNo}'
					,'dcNo' : dcNo
			}
			, success : function() {
				console.log("성공")
				
				listComment();
			}
			, error : function() {
				console.log("실패")
			}
			
			})
	}
	
	var animateButton = function(e) {

		  e.preventDefault;
		  //reset animation
		  e.target.classList.remove('animate');
		  
		  e.target.classList.add('animate');
		  setTimeout(function(){
		    e.target.classList.remove('animate');
		  },700);
		};

// 		var bubblyButtons = document.getElementsByClassName("bubbly-button");

		for (var i = 0; i < bubblyButtons.length; i++) {
		  bubblyButtons[i].addEventListener('click', animateButton, false);
		}


</script>
  
  
  
  
  
  
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
  
