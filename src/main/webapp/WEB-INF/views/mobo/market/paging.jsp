<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>
<c:if test="${not empty param.category }">
	<c:set var="category" value="&category=${param.category }"/>
</c:if>

<div class="paging text-center">
	<ul class="pagination">
		
		<!-- 첫페이지로 -->
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/mobo/market"><span>&larr;</span></a></li>
		</c:if>	
		
		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/mobo/market?curPage=${paging.curPage-1 }${category}${searchParam}"> <span>&laquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="disabled"><span>&laquo;</span></li>
		</c:if>
		
	
		
		
		
		<!-- 페이징 리스트 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:choose>
				<c:when test="${i eq paging.curPage }">
				<li class="active"><a href="/mobo/market?curPage=${i }${category}${searchParam}">${i }</a></li>
				</c:when>
				<c:otherwise>
				<li ><a href="/mobo/market?curPage=${i }${category}${searchParam}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		

		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/mobo/market?curPage=${paging.curPage+1 }${category}${searchParam}"><span>&raquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		
		
		
	</ul>
</div>