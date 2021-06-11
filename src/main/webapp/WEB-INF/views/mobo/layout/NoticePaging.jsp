<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 		<div class="card-footer py-4"> -->
<%--        <span class="float-left">total : ${paging.totalCount }</span> --%>

<!--               <nav aria-label="..."> -->
<!--                 <ul class="pagination justify-content-center mb-0"> -->
                
                
<%--                   <c:if test="${paging.curPage le 1 }"> --%>
<!--                   <li class="page-item disabled"> -->
<!--                     <a class="page-link" href="" tabindex="-1"> -->
<!--                       <i class="fas fa-angle-left"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<%--                   </c:if> --%>
                  
<%--                   <c:if test="${paging.curPage ne 1 }"> --%>
<!--                   <li class="page-item"> -->
<%--                     <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage - 1 }" tabindex="-1"> --%>
<!--                       <i class="fas fa-angle-left"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<%--                   </c:if> --%>

<%--                   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i"> --%>
<%--                   <c:if test="${i eq paging.curPage }"> --%>
<!--                   <li class="page-item active"> -->
<%--                     <a class="page-link" href="/admin/notice/list?curPage=${i }">${i }</a> --%>
<!--                   </li> -->
<%--                   </c:if> --%>
<%--                   <c:if test="${i ne paging.curPage }"> --%>
<!--                   <li class="page-item"> -->
<%--                     <a class="page-link" href="/admin/notice/list?curPage=${i }">${i }</a> --%>
<!--                   </li> -->
<%--                   </c:if> --%>
<%--                   </c:forEach> --%>
                  
<%--                   <c:if test="${paging.curPage lt paging.totalPage }"> --%>
<!--                   <li class="page-item"> -->
<%--                     <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage + 1 }"> --%>
<!--                     <i class="fas fa-angle-right"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<%--                   </c:if> --%>

<%--                   <c:if test="${paging.curPage ge paging.totalPage }"> --%>
<!--                   <li class="page-item disabled"> -->
<%--                     <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage + 1 }"> --%>
<!--                     <i class="fas fa-angle-right"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<%--                   </c:if> --%>
                  
<!--                 </ul> -->
<!--               </nav> -->
<!--             </div> -->

<div class="paging text-center">
   <ul class="pagination">

      <%-- 처음 페이지 버튼 --%>
      <%-- 첫 페이지가 아닐 때 버튼 노출 --%>
      <c:if test="${paging.curPage ne 1 }">
         <li><a href="/mobo/notice/list"><span>&larr;</span></a></li>
      </c:if>

      <%-- 이전 페이지 버튼 --%>
      <%-- 첫 페이지면 금지 표시 --%>
      <c:if test="${paging.curPage ne 1 }">
         <li><a href="/mobo/notice/list?curPage=${paging.curPage-1 }"> <span>&laquo;</span></a></li>
      </c:if>
      <c:if test="${paging.curPage eq 1 }">
         <li class="disabled"><span>&laquo;</span></li>
      </c:if>

      <%-- 페이징 번호 표시 --%>
      <%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
         <c:if test="${paging.curPage eq page }">
            <li class="active"><a href="/mobo/notice/list?curPage=${page }">${page }</a></li>
         </c:if>
         <c:if test="${paging.curPage ne page }">
            <li><a href="/mobo/notice/list?curPage=${page }">${page }</a></li>
         </c:if>
      </c:forEach>

      <%-- 다음 페이지 버튼 --%>
      <%-- 마지막 페이지면 동작 안함 --%>
      <c:if test="${paging.curPage ne paging.totalPage }">
         <li><a href="/mobo/notice/list?curPage=${paging.curPage + 1 }"><span>&raquo;</span></a></li>
      </c:if>
      <c:if test="${paging.curPage eq paging.totalPage }">
         <li class="disabled"><span>&raquo;</span></li>
      </c:if>
      
   </ul>
</div>