<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Source+Code+Pro:700);


@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

*, *:before, *:after {
    -moz-box-sizing: border-box;
    margin: 0;
    padding: 0;
}

.myPageContainer {
	min-height: 1000px;
}


a, a:visited {
    outline: medium none;
    text-decoration: none;
    transition: all 0.4s ease 0s;
    -moz-transition: all 0.4s ease 0s;
    -webkit-transition: all 0.4s ease 0s;
}

.navmypage {
    margin: 7%;
    text-align: center;
}

.navmypage li {
    display: inline-block;
}

.navmypage li a {
    display: block;
    font-family: 'Jal_Onuel';
    padding: 5px 50px;
    text-transform: uppercase;
    text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
    color: #666666;   
}

.navmypage li a:hover, .nav li a:active {
    color: #ddccf5;
    text-decoration: none;
}

.navmypage li.fade a {
    color: transparent;
    text-shadow: 0 0 3px rgba(0, 0, 0, 0.4);
}  
  


</style>



<div class="myPageContainer">

	<ul role="navigation" class="navmypage">
	  <li><a title="INFO" onclick="infoView()">INFO</a></li>
	  <li><a title="WRITING" onclick="writingView()" >WRITING</a></li>  
	  <li><a title="COMMENT" >COMMENT</a></li>
	  <li><a title="BOOKMARK">BOOKMARK</a></li>  
	  <li><a title="COUPON">COUPON</a></li>
	</ul>

	<div id="userInfoBox">
	
	<h4>본인 확인을 위해 비밀번호를 입력해 주세요.</h4>
	<input type="password" id="userpw">
	<input type="button" value="확인" onclick="checkPw()"> <br>
	<span id="wrongSpan"></span>
	
	</div>



	<div class="myWritingBox">
	
		<c:forEach items="${myWriting }" var="writing">
		
			${writing.rnum }
			${writing.title }
			<fmt:formatDate value="${writing.wdate }" type="date" />
			${writing.hit }
			${writing.boardDiv }
		
		</c:forEach>
	
	</div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<script type="text/javascript">

$(".navmypage li").mouseover(function () {
    $(this).siblings().addClass("fade");
}).mouseout(function () {
    $(this).siblings().removeClass("fade");
});


function checkPw() {
	
	$.ajax({
		type : 'post'
		, url : '/mobo/mypage/checkPw'
		, data : {'pw' : $("#userpw").val()}
		, dataType : 'json'
		, success : function(data) {

			if(data) {
				
				var html = "";
				html += "인증에 성공하였습니다"
				
				$("#userInfoBox").html(html);
				
			} else {
				$("#userpw").val("");
				$("#wrongSpan").html("비밀번호가 일치하지 않습니다.");
				
			}
		}
	})
}

function infoView() {
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/infoView'
		, dataType : 'json'
		, success : function(data) {

			$("#userInfoBox").html("");
			
			var html = "";
			
			html += "<div>"
			if (data.userImg.storedName == 'basig.png') {
			html += "	<img src='/resources/img/basig.png'>"
			} else {
			html += "	<img src=''>"
			}
			html += "	<input type='button' value='기본 이미지'>"
			html += "	<input type='button' value='이미지 변경'>"
			html += "</div>"
			
			html += "<div>"
			html += "	<span> id </span> <span> " + data.userInfo.id + "</span> <br>"
			
			html += "	<span> 비밀번호 </span> <input type='text' id='userInfoPw'/> <br>"; 
			html += "	<span> 새 비밀번호 </span> <input type='text' id='userInfoNewPw' /> <br>"; 
			html += "	<span> 새 비밀번호 확인</span> <input type='text' id='userInfoNewPwCheck'/> <br>"; 
			
			html += "	<span> 닉네임 </span> <input type='text' id='userInfoId' value=" + data.userInfo.nick + " /> <br>"; 

			html += "	<span> 닉네임 </span> <input type='text' id='userInfoId' value=" + data.userInfo.nick + " /> "; 
			
			html += "</div>"
			
			$("#userInfoBox").html(html);
			
		}
	})
}

function writingView() {
		
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/writingView'
		, dataType : 'json'
		, success : function(data) {
			
			$("#userInfoBox").html("");
			
			var html = "";
			
			html += "<table>"
			html += "	<tr>"
			html += "		<th>번호</th>"
			html += "		<th>제목</th>"
			html += "		<th>작성일</th>"
			html += "		<th>조회수</th>"
			html += "		<th>게시판</th>"
			html += "		<th>삭제</th>"
			html += "	</tr>"
			
			for(var i=0; i<data.length; i++) {
				html += "<tr>"
				html += "	<td>" + data[i].rnum + "</td>"
				
				if(data[i].boardDiv == 3) {
					html += "	<td><a href='/mobo/market/" + data[i].boardNo + "'>" + data[i].title + "</a></td>"
				} else if (data[i].boardDiv == 4) {
					html += "	<td><a href=''>" + data[i].title + "</a></td>"					
				} else if (data[i].boardDiv == 5) {
					html += "	<td><a href=''>" + data[i].title + "</a></td>"					
				}
				
				html += "	<td>" + moment(data[i].wdate).format('YYYY-MM-DD') + "</td>"
				html += "	<td>" + data[i].hit + "</td>"
				
				if(data[i].boardDiv == 3) {
					html += "	<td>중고 마켓</td>"
				} else if (data[i].boardDiv == 4) {
					html += "	<td>영화 토론</td>"					
				} else if (data[i].boardDiv == 5) {
					html += "	<td>책 토론</td>"					
				}
				
				html += "<td> <input type='checkbox' /> </td>"
				
				html += "</tr>"
			}
			
			html+= "</table>"
			
			$("#userInfoBox").html(html);
		}
	})
}


</script>


<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />