<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>


<script type="text/javascript" src ="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">


$(document).ready(function() {	
	
	var uidReg = /^[A-Za-z0-9]{6,}$/;
	var emailReg = /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i;
	var idFlag = "";
	var emFlag = "";
	
	//#id 검증
	$("#id").keyup(function() {
		if( !uidReg.test( $("#id").val())) {
			$("#idMsg_cor").html("");
			$("#idMsg").html("8자 이상 영문/숫자로 입력");
			$("#idbtn").attr('disabled', true);
			idFlag = "false";
		} else {
			$("#idMsg").html("");
			idFlag = "true";
			$("#idbtn").attr('disabled', false);
		}
	})
	
		//#email 검증
		$("#email").keyup(function() {
			if(!emailReg.test($("#email").val())) {
				$("#emailMsg").html("이메일 양식이 맞지 않습니다")
				emFlag = "false";
			} else {
				$("#emailMsg").html("");
				emFlag = "true";
				$("#mailbtn").attr('disabled', false);
			}
		});
		
		$("#submit").click(function() {
			if(emFlag == "false" || $("#email").val() == "") {
				alert('이메일을 확인해 주세요');
				return false;
			}
			
			if($("#name").val() == "") {
				alert('이름을 입력해 주세요');
				return false;
			}
			
			if($("#id").val() == "" || idFlag == "false") {
				alert('ID를 확인해주세요');
				return false;		
			}
			
			//form submit 수행하기
			$("form").submit();
			
		})
		
})

</script>


<br><br><br>
        <div class="container">
<form action="/mobo/sign/findpw" method="post" class="box">

	<h1>비밀번호 찾기</h1>
	
	<br><br>
	
	<label for="id">아이디</label>
	<input type="text" id="id" name="id" />
	<span id="idMsg"></span><span id="idMsg_cor"></span><br><br>
		
	<label for="name">이름</label>
	<input type="text" id="name" name="name" />
	<span id="namegenMsg"></span> <br><br>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="email" />
	<span id="emailMsg"></span> <span id="cor_num"></span> <span id="wro_num"></span> <br>
	
	<br>
	<input type="submit" id="submit" value="비밀번호 찾기" class="btn btn-outline-info"/>
	
	<br><br>
	<div style="border-top: 1px solid #A48654;">
		<span class="stick">혹시 아이디를 찾으시나요? │ </span>
		<a href="/mobo/sign/findid" class="link">아이디 찾기</a>
	</div>

</form>


</div>


<br><br><br>
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>

