<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

.movieAwardListContainer {
	min-height: 1000px;
	width : 1200px;
	margin : 0 auto;
}

.awardWrap {
	display : flex;
	width : 1000px;
	flex-wrap:wrap;
	margin : 0 auto;
}

.awardMovie {
	width : 200px;
	display : flex;
	justify-content: center;
	flex-direction: column;
}

.center {
	text-align: center;
}

</style>


<div class="movieAwardListContainer">

	 <div class="center"><img src="/resources/img/movieaward2.gif"></div> <br>

	<div class="awardWrap">
	<c:forEach items="${list }" var="award">
		<div class="awardMovie">
			<div class="center"><img src="${award.image }"/></div>
			<div class="center">${award.title }</div>
		</div>
	</c:forEach>
	</div>

</div>





<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />

