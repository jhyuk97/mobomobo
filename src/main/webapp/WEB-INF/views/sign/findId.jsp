<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>


	
<script type="text/javascript" src ="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	
	$("#name").focus();
});
</script>

<script type="text/javascript">

$(document).ready(function() {	
	
	var emailReg = /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i;
	var emFlag = "";
	
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
			
			//form submit 수행하기
			$("form").submit();
			
		})
		
})

</script>



<br><br><br>
        <div class="container">
<h1>아이디 찾기</h1>
<hr>

<form action="/mobo/sign/findid" method="post" class="box">

<br>

	<label for="name" >이름 :&nbsp;&nbsp;&nbsp;</label>
	<input type="text" id="name" name="name" placeholder="회원가입시 사용한 이름을 입력하세요" style="width: 300px;"/>
	<br><br>
		
	<label for="email">이메일 : </label>
	<input type="text" id="email" name="email" placeholder="회원가입시 사용한 이메일을 입력하세요" style="width: 300px;"/><br>
	<span id="emailMsg"></span>
	
	<br>

	<input type="submit" id="submit" value="아이디 찾기" class="btn btn-outline-info">

	<br>
	<br>
	<div style="border-top: 1px solid #A48654;">
		<span class="stick">혹시 비밀번호를 찾으시나요? │ </span>
		<a href="/mobo/sign/findpw" class="link">비밀번호 재 발급하기</a>
	</div>

</form>



	

</div>


<br><br><br>
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>