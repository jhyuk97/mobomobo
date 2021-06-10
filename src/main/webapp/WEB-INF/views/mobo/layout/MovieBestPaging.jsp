<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="paging text-center">
<<<<<<< HEAD
   <ul class="pagination">

      <%-- 처음 페이지 버튼 --%>
      <%-- 첫 페이지가 아닐 때 버튼 노출 --%>
      <c:if test="${paging.curPage ne 1 }">
         <li><a href="/mobo/movie/moviebestboard"><span>&larr;</span></a></li>
      </c:if>
=======
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/mobo/movie/moviebestboard"><span>&larr;</span></a></li>
		</c:if>
>>>>>>> 483848d733ae47cc14cb4ef3ecea5966cea989e3





<<<<<<< HEAD
      <%-- 이전 페이지 버튼 --%>
      <%-- 첫 페이지면 금지 표시 --%>
      <c:if test="${paging.curPage ne 1 }">
         <li><a href="/mobo/movie/moviebestboard?curPage=${paging.curPage-1 }"> <span>&laquo;</span></a></li>
      </c:if>
      <c:if test="${paging.curPage eq 1 }">
         <li class="disabled"><span>&laquo;</span></li>
      </c:if>
=======
		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/mobo/movie/moviebestboard?curPage=${paging.curPage-1 }"> <span>&laquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="disabled"><span>&laquo;</span></li>
		</c:if>
>>>>>>> 483848d733ae47cc14cb4ef3ecea5966cea989e3





<<<<<<< HEAD
      <%-- 페이징 번호 표시 --%>
      <%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
         <c:if test="${paging.curPage eq page }">
            <li class="active"><a href="/mobo/movie/moviebestboard?curPage=${page }">${page }</a></li>
         </c:if>
         <c:if test="${paging.curPage ne page }">
            <li><a href="/mobo/movie/moviebestboard?curPage=${page }">${page }</a></li>
         </c:if>
      </c:forEach>
=======
		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
			<c:if test="${paging.curPage eq page }">
				<li class="active"><a href="/mobo/movie/moviebestboard?curPage=${page }">${page }</a></li>
			</c:if>
			<c:if test="${paging.curPage ne page }">
				<li><a href="/mobo/movie/moviebestboard?curPage=${page }">${page }</a></li>
			</c:if>
		</c:forEach>
>>>>>>> 483848d733ae47cc14cb4ef3ecea5966cea989e3





<<<<<<< HEAD
      <%-- 다음 페이지 버튼 --%>
      <%-- 마지막 페이지면 동작 안함 --%>
      <c:if test="${paging.curPage ne paging.totalPage }">
         <li><a href="/mobo/movie/moviebestboard?curPage=${paging.curPage+1 }"><span>&raquo;</span></a></li>
      </c:if>
      <c:if test="${paging.curPage eq paging.totalPage }">
         <li class="disabled"><span>&raquo;</span></li>
      </c:if>
      
      
      
      
      
   </ul>
=======
		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/mobo/movie/moviebestboard?curPage=${paging.curPage+1 }"><span>&raquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		
		
		
		
		
	</ul>
>>>>>>> 483848d733ae47cc14cb4ef3ecea5966cea989e3
</div>