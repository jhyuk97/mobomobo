<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

.movieAwardListContainer {
	min-height: 1000px;
}

</style>


<div class="movieAwardListContainer">

	<img src="/resources/img/movieaward2.gif"> <br>

	<c:forEach items="${list }" var="award">
	
		${award.title }
		<img src="${award.image }"/>
	
	</c:forEach>

</div>





<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />

