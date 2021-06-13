<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src ="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/sign/css/signup.css"/>

<script type="text/javascript" src="/resources/sign/js/signup.js"> </script>

</head>
<body>

<form action="/mobo/sign/signUp" method="post" class="box">

	<h1>Sign Up</h1> <br><br>
	
	<label for="id">아이디</label><br>
	<input type="text" name="id" id="id" value="${param.id}"/>
	<input type="button" id="idbtn" value="중복확인" /><br>
	<span id="idMsg"></span><span id="idMsg_cor"></span><br><br>
	
	<label for="pw">비밀번호</label> <br>
	<input type="password" name="pw" id="pw" placeholder="분실 시 재발급됩니다"/> <br>
	<span id="pwMsg"></span> <br><br>
	
	<label for="cpw">비밀번호 확인</label> <br>
	<input type="password" name="cpw" id="cpw" /> <br>
	<span id="cpwMsg"></span> <br><br>
	
	<label for="nick">닉네임</label> <br>
	<input type="text" name="nick" id="nick" value="${param.nick}"/>
	<input type="button" id="nickbtn" value="중복확인" /> <br>
	<span id="nickMsg"></span><span id="nickMsg_cor"></span> <br><br>
	
	<label for="name">이름</label> <br>
	<input type="text" name="name" id="name" /> <br><br>
	<span id="namegenMsg"></span> <br><br>
	
	<label>연령대</label> <br>
		<select name="age" id="age" class="birth">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="40">40</option>
		<option value="50">50</option>
		<option value="0">other</option>

	</select><label> 대</label><br><br>
	
    <label for="search_addr_btn">주소</label><br>
    <input type="text" class="un" name="postnum" class="postnum" id="uAddress_zoneCode" readonly="readonly" />
    <input type="button" value="검색" name="addr_btn" id="search_addr_btn" /><br> 
    <input type="text" class="dff" name="addr" id="uAddress_addr" readonly="readonly" /><br><br>
    <label for="addrdetail">상세 주소</label><br>
    <input type="text" class="df" name="addrdetail" id="addrdetail" /> <br><br>

	<label for="email">이메일</label> <br>
	<input type="text" name="email" id="email" placeholder="ex) abcd1234@naver.com" value="${param.email}"/>
	<input type="button" id="mailbtn" value="인증"  /><br>
	<input type="text" name="atnum" id="atnum" placeholder="인증번호"/>
	<input type="button" id="atnbtn" value="확인" /> <br>
	<span id="emailMsg"></span> <span id="cor_num"></span> <span id="wro_num"></span> <br>
	

	
	
	<br>
	
	<a href="/mobo/main"><input type="button" id="main" value="main"/></a>
	 <input type="submit" id="submit" value="sign up"/>

</form>

</body>
</html>