<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="bg-light">
	<div class="container pb-5">
		<div class="row">
			<div class="col-lg-5 mt-5">
				<c:forEach var="img" items="${Img }">
					<div>
						<img class="card-img img-fluid" src="/resources/board/images/BLUE1.jpg" alt="Card image cap" id="product-detail">
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-7 mt-5">
				<div class="card" style="height:100%;">
				<div class="card-body">
					<span>${market.nick }</span>
					<p>지역</p><hr>
					<h2>${market.mTitle }</h2>
					<span>${market.mCate }</span> <span><fmt:formatDate value="${market.mDate }" pattern="yy-MM-dd" /></span>
					<p>${market.mPrice }\</p>
					<p>${market.mContent }</p>
				</div>
				</div>
			</div>
			
			<div class="buttons">
				<button>수정</button>
				<button>삭제</button>
				<button>채팅</button>
			</div>
		</div>
	</div>
</section>


<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>