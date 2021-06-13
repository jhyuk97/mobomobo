<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>




<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>



<style>

table {
	border: 1px solid #ccc;
	width: 100%;
}
.context{
	padding: 15px;
	font-weight: lighter;
	}




</style>

<div class="container">
<br><br><br><br>
<h5 class="text-center">공지사항</h5><br><br>
<div class="clearfix"></div>

<hr><br>

<table class="noticeTable" >
	<tr>
	<th style="width: 33%;"><div class="context">제목:${detail.nTitle }</div></th>
	<th style="width: 33%;"><div class="context">조회수: ${detail.nViews }</div></th>
	<th style="width: 33%;"><div class="context">공지일자:<fmt:formatDate value="${detail.nDate }" pattern="yy-MM-dd hh:mm" /></div></th>
	</tr>
</table>
<br>
<div>${detail.nContent }</div>

<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/mobo/notice/list"><button class="btn btn-default">목록</button></a>
<%-- 	<c:if test="${id eq view.writerId }"> --%>
<%-- 	</c:if> --%>
</div><!-- 버튼 영역 end -->

<!-- 댓글 처리 -->
<hr>
<div>
	<!-- 댓글 리스트 -->
	<table class="table table-striped table-hover table-condensed">
	<thead>
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 50%;">댓글</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 5%;"></th>
	</tr>
	</thead>
	
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>	