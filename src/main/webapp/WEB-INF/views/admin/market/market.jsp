<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">중고마켓</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">no</th>
                    <th scope="col">제목</th>
                    <th scope="col">날짜</th>
                    <th scope="col">유저</th>
                    <th scope="col">삭제</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                
                <tbody>
                <c:forEach var="i" items="${mList }">
                	<tr>
                		<td>${i.mNo }</td>
                		<td><a href="/mobo/market/${i.mNo }">${i.mTitle }</a></td>
                		<td><fmt:formatDate value="${i.mDate }" pattern="yyyy-MM-dd"/> </td>
                		<td>${i.id }</td>
                		<td><a href="/admin/market/delete?mNo=${i.mNo }">삭제</a></td>
                		<td></td>
                	</tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination pagination-lg justify-content-end">
                  <li class="page-item disabled">
                    <a class="page-link" href="/admin/market?curPage=${paging.startPage - paging.pageCount }${category}${searchParam}" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  
                  <!-- 페이징 리스트 -->
				  <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:choose>
					<c:when test="${i eq paging.curPage }">
					<li class="page-item active"><a class="page-link" href="/admin/market?curPage=${i }${category}${searchParam}">${i }</a></li>
					</c:when>
					<c:otherwise>
					<li class="page-item"><a class="page-link" href="/admin/market?curPage=${i }${category}${searchParam}">${i }</a></li>
					</c:otherwise>
					</c:choose>
				  </c:forEach>
                  
                  
<!--                   <li class="page-item active"> -->
<!--                     <a class="page-link" href="#">1</a> -->
<!--                   </li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a> -->
<!--                   </li> -->
<!--                   <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                    <li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#">5</a></li> -->
                  <li class="page-item">
                    <a class="page-link" href="/admin/market?curPage=${paging.startPage + paging.pageCount }${category}${searchParam}">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
            
          </div>
        </div>
      </div>
      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>