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

#userInfoBox {
	width:900px;
	margin : 0 auto;
}

.userInfoTable {
	margin : 0 auto;
}
  
.infoImg {
	width : 200px;
	height : 200px;
	border-radius: 50%;
	margin-bottom : 50px;
	border : 1px solid #000;
}

.userInfoImgBox {
	margin : 0 auto;
}


</style>



<div class="myPageContainer">

	<ul role="navigation" class="navmypage">
	  <li><a title="INFO" onclick="infoView()">INFO</a></li>
	  <li><a title="WRITING" onclick="writingView()" >WRITING</a></li>  
	  <li><a title="COMMENT" onclick="commentView()">COMMENT</a></li>
	  <li><a title="BOOKMARK" onclick="bookmarkView(1)">BOOKMARK</a></li>  
	  <li><a title="COUPON">COUPON</a></li>
	</ul>

	<div id="userInfoBox">
	
	<h4>본인 확인을 위해 비밀번호를 입력해 주세요.</h4>
	<input type="password" id="userpw">
	<input type="button" value="확인" onclick="checkPw()"> <br>
	<span id="wrongSpan"></span>
	
	</div>
	
	<!-- existing UserInfo -->
	<input type="hidden" id="hiddenUserPw" value="">
	<input type="hidden" id="hiddenUserNick" value="">
	<input type="hidden" id="hiddenUserName" value="">
	<input type="hidden" id="hiddenUserEmail" value="">
	<input type="hidden" id="hiddenUserPostNum" value="">
	<input type="hidden" id="hiddenUserAddr" value="">
	<input type="hidden" id="hiddenUserAddrDetail" value="">
	
	<!-- UserInfo Change Flag  -->
	<input type="hidden" id="nickFlag" value="false">
	<input type="hidden" id="emailFlag" value="false">
	<input type="hidden" id="certiNum" value="">
	
	<input type="hidden" id="pwFlag" value="false">
	
	
<!-- 	<table id="test">
	<thead>
		<tr>
			<th>번호</th>
			<th>댓글내용</th>
			<th>카테고리</th>
			<th>추천 수</th>
		</tr>
	</table>
 -->


</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"></script> -->
<!-- <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script> -->

<script type="text/javascript">

$(function(){
	
	$(document).on('keyup', '#userInfoPw', function() {
		
		if($('#hiddenUserPw').val() == $('#userInfoPw').val()) {
			console.log('ㅇㅇ');
			
			$("#userInfoNewPw").removeAttr("readonly");
			
			$("#userInfoNewPwCheck").removeAttr("readonly");
			
			$("#userInfoNewPw").attr('placeholder', '새 비밀번호를 입력해 주세요');
			
		} else {
			console.log('ㄴㄴ');
		}
	})
	
	var pwReg = /^[A-Za-z0-9]{8,}$/;
	
	$(document).on('keyup', '#userInfoNewPw', function() {
		
		if(pwReg.test($('#userInfoNewPw').val())) {
			console.log('ㅇㅇ');
			
			$("#userInfoNewPwCheck").attr('placeholder', '다시한번 입력해 주세요');
			
		} else {
			console.log('ㄴㄴ');
			
			$('#pwFlag').val(false);
		}
	}) 
	
	$(document).on('keyup', '#userInfoNewPwCheck', function() {
		
		if($('#userInfoNewPw').val() == $('#userInfoNewPwCheck').val()) {
			console.log('ㅇㅇ');
			
			$('#pwFlag').val(true);
			
		} else {
			console.log('ㄴㄴ');
			
			$('#pwFlag').val(false);
		}
	})
});



$(".navmypage li").mouseover(function () {
    $(this).siblings().addClass("fade");
}).mouseout(function () {
    $(this).siblings().removeClass("fade");
});

//마이페이지 들어갈때 비밀번호 검사
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

//유저 정보 조회
function infoView() {
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/infoView'
		, dataType : 'json'
		, success : function(data) {
			
			$("#hiddenUserPw").val(data.userInfo.pw);
			$("#hiddenUserNick").val(data.userInfo.nick);
			$("#hiddenUserName").val(data.userInfo.name);
			$("#hiddenUserEmail").val(data.userInfo.email);
			$("#hiddenUserPostNum").val(data.userInfo.postnum);
			$("#hiddenUserAddr").val(data.userInfo.addr);
			$("#hiddenUserAddrDetail").val(data.userInfo.addrdetail);

			$("#userInfoBox").html("");
			
			var html = "";
			
			html += "<div class='userInfoImgBox'>"
			if (data.userImg.storedName == 'basig.png') {
			html += "	<img src='/resources/img/basig.png' class='infoImg'>"
			} else {
			html += "	<img src='/emp/" + data.userImg.storedName + "' class='infoImg'>"
			}
			html += "	<br> <input type='button' value='기본 이미지' onclick='originImg()'>"
			html += "	<form id='form'>"
			html += "	<input type='file' name='imagefile' id='imagefile'>"
			html += "	</form>"
			html += "	<input type='button' value='수정' onclick='updateImg()'>"
			
			html += "</div> <hr>"
			
			html += "<table class='userInfoTable'>"
			html += "<tr>"
			html += "	<th style='width:200px;'> ID </th> <td> " + data.userInfo.id + "</td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 비밀번호 </th>  <td><input type='password' id='userInfoPw'/></td>"; 
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 새 비밀번호 </th> <td><input type='password' id='userInfoNewPw' readonly='readonly' /></td>"; 
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 새 비밀번호 확인</th> <td><input type='password' id='userInfoNewPwCheck' readonly='readonly'/></td>"; 
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 닉네임 </th> <td><input type='text' id='userInfoNick' value=" + data.userInfo.nick + " />"
			html += " 	<input type='button' value='중복 확인' onclick='nickOverlapCheck()'></td>"
			html += "<tr>"
			
			html += "<tr>"
			html += "	<th> 이름 </th> <td><input type='text' id='userInfoName' value=" + data.userInfo.name + " /></td>"; 
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 이메일 </th> <td><input type='text' id='userInfoEmail' value=" + data.userInfo.email + " />"
			html += "	<input type='button' value='인증' onclick='emailCertifiction()'/></td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> </th>"
			html += "	<td><input type='text' id='userInfoEmailCertification' readonly='readonly'/><input type='button' value='인증' onclick='certiCheck()'/></td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 주소 </th> <td><input type='text' id='userInfoPostNum' value=" + data.userInfo.postnum + " style='width:80px;' readonly='readonly'/>"
			html += " 	<input type='text' id='userInfoAddr' value='" + data.userInfo.addr + "' readonly='readonly' /> <input type='button' id='search_addr_btn' value='검색' onclick='kakaoAddress()'/> </td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> </th>"
			html += "	<td><input type='text' id='userInfoAddrDetail' value=" + data.userInfo.addrdetail + " /> </td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 가입일 </th> <td>" + moment(data.userInfo.joindate).format('YYYY-MM-DD') + "</td> <br>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 연령대 </th>"
			html += "	<td><select id='userInfoAge'>"
			html += "		<option value='10'>10</option>"
			html += "		<option value='20'>20</option>"
			html += "		<option value='30'>30</option>"
			html += "		<option value='40'>40</option>"
			html += "		<option value='50'>50</option>"
			html += "	</select> </td>"
			html += "</tr>"
			
			html += "<tr>"
			html += "	<th> 등급 </th> <td>" + data.userInfo.grade + "</td>"
			html += "</tr>"
			
			html += "</table>"
			
			html += "<input type='button' value='수정' onclick='userInfoUpdate()' />"
			
			
			$("#userInfoBox").html(html);
			
			$('#userInfoBox #userInfoAge').val(data.userInfo.age).prop("selected",true);
		}
	})
}

//글 목록 조회
function writingView() {
		
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/writingView'
		, dataType : 'json'
		, success : function(data) {
			
			$("#userInfoBox").html("");
			
			var html = "";
			html += "<table class='userInfoTable'>"
			html += "	<tr>"
			html += "		<th>번호</th>"
			html += "		<th>제목</th>"
			html += "		<th>작성일</th>"
			html += "		<th>조회수</th>"
			html += "		<th>게시판</th>"
			html += "		<th>추천수</th>"
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
				
				html += "<td>" + data[i].likeCnt + "</td>"
				html += "	<td> <input type='checkbox' name='ckBoxDelete' value='writing-" + data[i].boardDiv + "-" + data[i].boardNo + "'/> </td>"
				
				html += "</tr>"
			}
			
			html+= "</table>"
			
			html += "<input type='button' onclick='checkDelete()' value='삭제' />"
			
			$("#userInfoBox").html(html);
			
		}
	})
}

//댓글 목록 조회
function commentView() {
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/commentView'
		, dataType : 'json'
		, success : function(data) {
			
			$("#userInfoBox").html("");
			
			var html = "";
			
			html += "<table class='userInfoTable'>"
			html += "	<tr>"
			html += "		<th>번호</th>"
			html += "		<th>댓글내용</th>"
			html += "		<th>카테고리</th>"
			html += "		<th>작성일</th>"
			html += "		<th>추천 수</th>"
			html += "		<th>삭제</th>"
			html += "	</tr>"
			
			for(var i=0; i<data.length; i++) {
				html += "<tr>"
				html += "	<td>" + data[i].rnum + "</td>"
				if(data[i].commentDiv == 1) {
					html += "	<td><a href='/mobo/movie/moviedetail?movieBestNo=" + data[i].boardNo + "'>" + data[i].commentText + "</a></td>"
					html += "	<td>영화 명장면</td>"
				} else if (data[i].commentDiv == 2) {
					html += "	<td><a href='/mobo/book/famousDetail?bookBestno=" + data[i].boardNo + "'>" + data[i].commentText + "</a></td>"
					html += "	<td>책 명대사</td>"
				} else if (data[i].commentDiv == 4) {
					html += "	<td><a>" + data[i].commentText + "</a></td>"
					html += "	<td>영화 토론</td>"
				} else if (data[i].commentDiv == 5) {
					html += "	<td><a>" + data[i].commentText + "</a></td>"
					html += "	<td>책 토론</td>"
				}
				html += "	<td>" + moment(data[i].wdate).format('YYYY-MM-DD') + "</td>"

				html += "	<td>" + data[i].likeCnt + "</td>"
				html += "	<td> <input type='checkbox' name='ckBoxDelete' value='comment-" + data[i].commentDiv + "-" + data[i].commentNo + "'/> </td>"
				html += "</tr>"
			}
			
			html += "</table>"
			
			html += "<input type='button' onclick='checkDelete()' value='삭제' />"
			
			$("#userInfoBox").html(html);
		
		}
	})	
}

//북마크 목록 조회
function bookmarkView(curPage) {
	
	console.log(curPage)
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/bookmarkView'
		, dataType : 'json'
		, data : {'curPage' : curPage}
		, success : function(data) {
			
			console.log(data.paging.curPage);
			console.log(data.paging.startPage);
			console.log(data.paging.endPage);
			
			$("#userInfoBox").html("");
			
			var html = "";
			
			html += "<table class='userInfoTable'>"
			html += "	<tr>"
			html += "		<th>번호</th>"
			html += "		<th>제목</th>"
			html += "		<th>카테고리</th>"
			html += "		<th>삭제</th>"
			html += "	</tr>"
			
			for(var i=0; i<data.bookmark.length; i++) {
				html += "<tr>"
				html += "	<td>" + data.bookmark[i].rnum + "</td>"
				
				if(data.bookmark[i].category == 'movie') {
					html += "	<td><a href='/mobo/movie/movierecomDetail?key=" + data.bookmark[i].key  + "&image=" + data.bookmark[i].image + "'>" + data.bookmark[i].title + "</a></td>"
					html += "	<td>영화</td>"
							
				} else if(data.bookmark[i].category == 'moviebest') {
					html += "	<td><a href='/mobo/movie/moviedetail?movieBestNo=" + data.bookmark[i].key + "'>" + data.bookmark[i].title + "</a></td>"
					html += "	<td>영화 명장면</td>"
							
				} else if(data.bookmark[i].category == 'book') {
					html += "	<td><a href='/mobo/book/detail?isbn=" + data.bookmark[i].key +"'>" + data.bookmark[i].title + "</a></td>"
					html += "	<td>책</td>"
							
				} else if(data.bookmark[i].category == 'bookbest') {
					html += "	<td><a href='/mobo/book/famousDetail?bookBestno=" + data.bookmark[i].key + "'>" + data.bookmark[i].title + "</a></td>"
					html += "	<td>책 명대사</td>"
							
				} else if(data.bookmark[i].category == 'product') {
					html += "	<td><a href='/mobo/market/ " + data.bookmark[i].key + "'>" + data.bookmark[i].title + "</a></td>"
					html += "	<td>중고 마켓</td>"
				}
				
				html += "<td> <input type='checkbox' name='ckBoxDelete' value='bookmark-" + data.bookmark[i].category + "-" + data.bookmark[i].bookmarkno + "'/> </td>"
				
				html += "</tr>"
			}
			
			html += "</table>"
			
			html += "<input type='button' onclick='checkDelete()' value='삭제' />"
			
			html += "<div class='card-footer py-4'>"
			html += "<nav>"
			html += "<ul class='pagination justify-content-center mb-0'>"
			for(var i=data.paging.startPage; i<=data.paging.endPage; i++ ) {
				if(i == data.paging.curPage) {
					html += "<li class='page-item active'><a class='page-link' onclick='bookmarkView(" + i + ")' >" + i + "</a></li>"
				} else {
					html += "<li><a class='page-link' onclick='bookmarkView(" + i + ")' >" + i + "</a></li>"
				}
			}
			html += "</ul>"
			html += "</nav>"
			html += "</div>"

			
			
			$("#userInfoBox").html(html);
			
		}
			
	})
}

//프로필이미지 업데이트
function updateImg() {
	
	var formData = new FormData($("#userInfoBox #form")[0]);
	
	console.log(formData);
	
	$.ajax({
		type : 'post'
		, url : '/mobo/mypage/updateImg'
		, enctype : 'multipart/form-data'
		, data : formData
		, cache : false
		, contentType : false
		, processData : false
		, success : function() {
			infoView();
		}
	})
}

//기본 이미지로 변경
function originImg() {
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/originimg'
		, data : {}
		, success : function() {
			infoView();
		}
	})
}

//이메일 인증
function emailCertifiction() {
	
	var email = $("#userInfoEmail").val();
	
	var emailReg = /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i;

	if(emailReg.test(email)) {
		$.ajax({
			type : 'get'
			, url : '/mobo/sign/email'
			, data : {'email' : email}
			, dataType : 'json'
			, success : function(data) {
				alert('인증메일이 발송되었습니다.');
				
				$("#certiNum").val(data);
				
				$("#userInfoBox #userInfoEmailCertification").removeAttr("readonly");
				
				$("#userInfoEmailCertification").focus();

			}
		})
	} else {
		alert('이메일 양식이 맞지 않습니다.');
	}
}

//인증번호 체크
function certiCheck() {
	
	if($("#userInfoEmailCertification").val() == $("#certiNum").val()) {
		alert('이메일 인증 성공');
		
		$("#emailFlag").val(true);
	} else {
		alert('인증번호가 다릅니다.');
	}
}

//주소 검색
function kakaoAddress() {
	new daum.Postcode({
		oncomplete : function(data) {
			$("#userInfoPostNum").val(data.zonecode)
			$("#userInfoAddr").val(data.address)
			$("#userInfoAddrDetail").focus();
		}
	}).open();
	
	$('#userInfoAddrDetail').focus();
}

//체크박스 항목 삭제
function checkDelete() {
	
	var array = new Array();
	$('input:checkbox[name=ckBoxDelete]:checked').each(function() {
		array.push(this.value);
	})
	
	var flag = "";
	for(var i=0; i<array.length; i++) {
		flag = array[i].split("-")[0];
	}
	
	$.ajax({
		type : 'get'
		, url : '/mobo/mypage/deleteCheckBox'
		, data : {'array' : array}
		, success : function() {
			
			if(flag == 'writing') {
				writingView()
			} else if (flag == 'comment') {
				commentView()
			} else if (flag == 'bookmark') {
				bookmarkView(1);
			}
				
		}
	})
}

//닉네임 중복 체크
function nickOverlapCheck() {
	
	var nick = $("#userInfoNick").val();
	
	var nickFlag = $("#nickFlag").val();
	
	$.ajax({
		type : 'post'
		, url : '/mobo/sign/nickcheck'
		, data : {'nick' : nick}
		, success : function(data) {
			if(data == 1) {
				alert('중복된 닉네임 입니다.')
			} else {
				alert('사용가능한 닉네임 입니다.')
				$("#nickFlag").val(true);
			}
		}
	})
	
}

function userInfoUpdate() {
	
	if($('#hiddenUserEmail').val() != $('#userInfoEmail').val() || $("#emailFlag").val() == false) {
		alert ('이메일 확인');
		return false;
	}
	
	if($('#hiddenUserNick').val() != $('#userInfoNick').val() || $('#nickFlag').val() == false) {
		alert('닉네임 확인');
		return false;
	}
	
	if($('#userInfoNewPw').val() != "" && $('#pwFlag').val() == false) {
		alert('비밀번호 확인');
		return false;
	}
	
	if($('#userInfoName').val() == "") {
		alert('이름 확인');
		return false;
	}
	
	if($('#userInfoAddrDetail').val() == "") {
		alert('주소 확인');
		return false;
	}
		
		var pw = $("#userInfoNewPw").val();
		var nick = $("#userInfoNick").val();
		var name = $("#userInfoName").val();
		var email = $("#userInfoEmail").val();
		var postnum = $("#userInfoPostNum").val();
		var addr = $("#userInfoAddr").val();
		var addrdetail = $("#userInfoAddrDetail").val();
		var age = $("#userInfoAge option:selected").val();
	
		$.ajax({
			type : 'get'
			, url : '/mobo/mypage/userInfoUpdate'
			, data : {'pw' : pw
				, 'nick' : nick
				, 'name' : name
				, 'email' : email
				, 'postnum' : postnum
				, 'addr' : addr
				, 'addrdetail' : addrdetail
				, 'age' : age}
			, success : function() {
				alert('수정이 완료되었습니다.');
				infoView();
			}
		})

}

</script>


<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />