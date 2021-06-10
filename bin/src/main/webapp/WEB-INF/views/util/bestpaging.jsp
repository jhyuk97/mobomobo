<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>

<!-- <div class="paging text-center"> -->
<!-- 	<ul class="pagination"> -->

 <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>


		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/mobo/book/bookFamous?curPage=${paging.curPage-1 }${searchParam }" class="page-link">
			        <i class="fa fa-angle-left"></i>
       				<span class="sr-only">Previous</span>
			 </a></li>
		</c:if>

		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
			<c:if test="${paging.curPage eq page }">
				<li class="active"><a href="/mobo/book/bookFamous?curPage=${page }${searchParam }" >
					${page }
				
				</a></li>
			</c:if>
			<c:if test="${paging.curPage ne page }">
				<li><a href="/mobo/book/bookFamous?curPage=${page }${searchParam }">
					${page }
				</a></li>
			</c:if>
		</c:forEach>

		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/mobo/book/bookFamous?curPage=${paging.curPage+1 }${searchParam }" class="page-link">
				<i class="fa fa-angle-right"></i>
       			<span class="sr-only">Next</span>
			</a></li>
		</c:if>


  </ul>
</div>
</div>
</div>
