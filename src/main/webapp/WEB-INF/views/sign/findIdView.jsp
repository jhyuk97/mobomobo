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

<br>

<h1 class="display-4">ID 찾기 </h1>

<br>

  
  <div class="table-responsive">
    


<c:choose>
	<c:when test="${id eq null }">
	
		<h1 style="text-align: center;"> 해당하는 정보가 없습니다</h1>
		<br><br>
		
				<div>
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="logingo" >Login</button>
					</div>
				</div>
				
			</c:when>
	<c:otherwise>
    <table class="table align-items-center">
        <thead class="thead-light">
            <tr>
                <th scope="col" class="sort" data-sort="name">사용자의 id 는</th>
                <th scope="col" class="sort" data-sort="budget">${id }</th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
        </thead>
	</table>
	
				<div>
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="submit" id="logingo" >Login</button>
					</div>
				</div>
	<br><br>
	</c:otherwise>
</c:choose>

  
  <br>
</div>

</div>

<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>