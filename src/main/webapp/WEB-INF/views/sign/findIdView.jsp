<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#logingo").click(function() {
		location.href="/mobo/sign/login";
	});
	
	$("#findidgo").click(function() {
		location.href="/mobo/sign/findid";
	});
	

});
</script>


	<link rel="stylesheet" type="text/css" href="/resources/sign/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/sign/css/main.css">

<div class="container">

<br>

<h1 style="color: #525f7f">ID 찾기 </h1>
<hr>
<br>

  
  <div class="table-responsive">
    


<c:choose>
	<c:when test="${id eq null }">
	
	<div class="alert alert-warning" role="alert">
	    <strong>No Find!</strong> 입력하신 정보에 일치하는 정보가 없습니다.
	</div>
		
		

				<div>
					<div class="wrap-login100-form-btn" style="width: 200px;">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="logingo" >Login</button>
					</div>
					<br>
					<div class="wrap-login100-form-btn" style="width: 200px;">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="findidgo" >아이디 찾기</button>
					</div>
				</div>

				
			</c:when>
	<c:otherwise>
	
	<div class="alert alert-primary" role="alert">
    <strong>사용자의 id 는</strong> ${id } 입니다.
	</div>

				<div>
					<div class="wrap-login100-form-btn" style="width: 200px;">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="logingo" >Login</button>
					</div>
				</div>
				
				<br><br>
				
	<div style="border-top: 1px solid #A48654;">
		<span class="stick">혹시 비밀번호를 찾으시나요? │ </span>
		<a href="/mobo/sign/findpw" class="link" style="font-family: 'Jal_Onuel';
    font-size: 18px !important; font-weight: 300 !important;">비밀번호 재 발급하기</a>
	</div>
	
	<br><br>
	</c:otherwise>
</c:choose>

  
  <br>
</div>

</div>

<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>