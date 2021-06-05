<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>

<!-- <div class="paging text-center"> -->
<!-- 	<ul class="pagination"> -->

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-end">

		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/admin/book/bookFamous?curPage=1${searchParam }" class="page-link"><span>&larr;</span></a></li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
			<li class="page-item"><a href="/admin/book/bookFamous?curPage=${paging.curPage-1 }${searchParam }" class="page-link">
			        <i class="fa fa-angle-left"></i>
       				<span class="sr-only">Previous</span>
			 </a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="page-item disabled"><a class="page-link">
			    <i class="fa fa-angle-left"></i>
       			<span class="sr-only">Previous</span>
			</a></li>
		</c:if>

		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
			<c:if test="${paging.curPage eq page }">
				<li class="page-item active"><a href="/admin/book/bookFamous?curPage=${page }${searchParam }" class="page-link">
					${page }
				
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne page }">
				<li class="page-item"><a href="/admin/book/bookFamous?curPage=${page }${searchParam }" class="page-link">
					${page }
				</a></li>
			</c:if>
		</c:forEach>

		<c:if test="${paging.curPage ne paging.totalPage }">
			<li class="page-item"><a href="/admin/book/bookFamous?curPage=${paging.curPage+1 }${searchParam }" class="page-link">
				<i class="fa fa-angle-right"></i>
       			<span class="sr-only">Next</span>
			</a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		

		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/book/bookFamous?curPage=${paging.totalPage }${searchParam }"><span>&rarr;</span></a></li>
		</c:if>


  </ul>
</nav>		

