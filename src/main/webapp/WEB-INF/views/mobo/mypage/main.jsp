<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

.myPageContainer {
	min-height: 1000px;
}

</style>


<div class="myPageContainer">

	<div class="userImgBox">
		<img src="/resources/img/${userImg.storedName }">
		<input type="button" value="기본이미지">
		<input type="button" value="이미지 변경">
	</div>
	
	
	
	<div class="userInfoBox">
		${userInfo.id } <br>
		${userInfo.nick } <br>
		${userInfo.name } <br>
		${userInfo.email } <br>
		${userInfo.postnum } <br>
		${userInfo.addr } <br>
		${userInfo.addrdetail } <br>
		<fmt:formatDate value="${userInfo.joindate }" type="date" /> <br>
		${userInfo.age } <br>
		${userInfo.grade } <br>
		
		<input type="button" value="회원정보 수정" />
		<input type="button" value="회원 탈퇴" />
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

<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />




















<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />