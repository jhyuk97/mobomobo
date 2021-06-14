<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>
<c:if test="${not empty param.mCate }">
	<c:set var="category" value="&category=${param.mCate }"/>
</c:if>

<div class="text-center">
	<ul class="pagination pagination-lg justify-content-end">
			
		
		
		<!-- 이전 페이징 리스트로 가기 -->
		<c:choose>
		<c:when test="${paging.startPage > paging.pageCount }">
			<li><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/mobo/market?curPage=${paging.startPage - paging.pageCount }${category}${searchParam}">&laquo;</a></li>
		</c:when>
		<c:otherwise>
			<li class="disabled"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark">&laquo;</a></li>
		</c:otherwise>
		</c:choose>
		
		
		
		<!-- 이전 페이지로 가기 -->
		<c:if test="${paging.curPage ne 1 }">
		<li><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/mobo/market?curPage=${paging.curPage -1}${category}${searchParam}">&lt;</a></li>
		</c:if>	
	
		
		
		
		<!-- 페이징 리스트 -->
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:choose>
				<c:when test="${i eq paging.curPage }">
				<li class="page-item disabled"><a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="/mobo/market?curPage=${i }${category}${searchParam}">${i }</a></li>
				</c:when>
				<c:otherwise>
				<li class="page-item"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/mobo/market?curPage=${i }${category}${searchParam}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		

		<!-- 다음 페이지로 가기 -->
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/mobo/market?curPage=${paging.curPage + 1 }${category}${searchParam}">&gt;</a></li>
		</c:if>
		
		

		<!-- 다음 페이징 리스트로 가기 -->
		<c:choose>
			<c:when test="${paging.endPage ne paging.totalPage }">
			<li><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/mobo/market?curPage=${paging.startPage + paging.pageCount }${category}${searchParam}">&raquo;</a></li>
			</c:when>
			<c:otherwise>
			<li class="disabled"><a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
		
		
		
	</ul>
</div>