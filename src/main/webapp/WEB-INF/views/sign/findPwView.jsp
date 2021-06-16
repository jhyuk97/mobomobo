<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#logingo").click(function() {
		location.href="/mobo/sign/login";
	});

});
</script>

	<link rel="stylesheet" type="text/css" href="/resources/sign/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/sign/css/main.css">


<div class="container">

<br><br>

<h1 style="color: #525f7f">PW 재발급 </h1>
<hr>
<br>

  



<c:choose>
	<c:when test="${result eq 123 }">
	
	<div class="alert alert-primary" role="alert">
    <strong>Success!</strong> 새로운 비밀번호가 해당 이메일로 전송되었습니다.
	</div>
	

		
				<div>
					<div class="wrap-login100-form-btn" style="width: 200px;">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="logingo" >Login</button>
					</div>
				</div>
				
			</c:when>
	<c:otherwise>
	<div class="alert alert-warning" role="alert">
    <strong>No Find!</strong> 입력하신 정보에 일치하는 정보가 없습니다.
	</div>

		<br><br>
		
			<div style="border-top: 1px solid #A48654;">
				<a href="/mobo/sign/findpw" class="link">비밀번호 재 발급하기</a>
			</div>
				
	<br><br>
	</c:otherwise>
</c:choose>

  
  <br>
</div>

</div>


<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
