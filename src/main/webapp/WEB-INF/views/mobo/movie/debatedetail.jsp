<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

</style>
<script type="text/javascript">
$(document).ready(function (){

	$("button").on("click",function(){
		console.log("클릭")
		console.log($(this).attr("id"))
		
		var urlData = "";
		var dataSet = "";
		
		
		
		if($(this).attr("id") === $("#btnDebateBestLike").attr("id")){
		console.log("클릭")
		// 북마크설정
		urlData = '/mobo/movie/debatelike';
		dataSet = {
				'dNo':${Debate.dNo}
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
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">HIGHLIGHT</h2> <!--각자 게시판 영어 제목이 와야함-->
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p><!--각자 게시판 내용이 와야함 필요없음 제외 가능-->
          </div>
        </div>
        
	<br><br>
	<h2 class="heading-section">TALK</h2>
	<hr>
	<div>
	<p>${Debate.dTitle } </p>
	<div style="position: relative; top:-53px;"><button style="margin:0 10px; float: right;" id="write" class="btn btn-filled" onclick='location.href="/mobo/movie/update";'>수정</button>
	<button style="float: right;" id="hot" class="btn btn-filled" onclick='location.href="/mobo/movie/delete";'>삭제</button></div>
	<hr>
	<span>${Debate.nick }</span>
	<span style="float:right; position: relative; left: 200px;"><fmt:formatDate value="${Debate.dDate }" pattern="yy-MM-dd" /></span>
	<hr>
	<div>${Debate.dContent }</div>
	<div style="text-align: center;" class="button2"> 
	<c:if test="${not empty login }">
  	<button style="width:110px; height:62px; font-size:15px;" id="btnDebateBestLike" class="bubbly-button" ><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;<span id="bestLike">${likeCnt }</span>
 	</button> 
	</c:if>
 	<button id="list" style="float: right; margin-top:50px; margin-bottom:50px; width:110px; height:62px; border:0px; font-size:15px;" class="btn btn-filled">목록</button>
  	</div>
	
	
	
	
	</div>
	
	

	<div class="card-header bg-replay">
           <i class="fa fa-comment fa"></i> 댓글
   </div>
   
   
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
</section>
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>
