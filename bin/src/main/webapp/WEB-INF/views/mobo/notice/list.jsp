<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	

    <title>MOBOMOBO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="/resources/board2/css/style.css">
   
	<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
   
   
   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section">공지사항</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="table-wrap">
                  <table class="table table-responsive-xl">
                    <thead>
                      <tr>
                         <th>글번호</th>
                   		 <th>제목</th>
                   		 <th>작성자</th>
                   		 <th>작성일</th>
                   		 <th>조회수</th>
                      </tr>
                    </thead>
                    
                     <tbody>
                <c:forEach items="${list }" var="Notice">
                <tr>
                	<td class="nNo">${Notice.nNo }</td>
                	<td class="nTitle"><a href="/mobo/notice/detail?nNo=${Notice.nNo }">${Notice.nTitle }</a></td>
                	<td class="admin">관리자</td>
                	<td class="nDate"><fmt:formatDate value="${Notice.nDate }" pattern="yy-MM-dd" /></td>
                	<td class="Hit">${Notice.nViews }</td>
                </tr>
                 </c:forEach>
                </tbody>
                    
               </table>
           		 </div>
           		 <div class="card-footer py-4">
            	 <span class="float-left">total : ${paging.totalCount }</span>
              
                  
                <nav>
                <ul class="pagination justify-content-center mb-0">
                
                  <c:if test="${paging.curPage le 1 }">
                  <li class="page-item disabled">
                    <a class="page-link" href="" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                    </a>
                  </li>
                  </c:if>
                  <c:if test="${paging.curPage ne 1 }">
                  <li class="page-item">
                    <a class="page-link" href="/mobo/notice/list?curPage=${paging.curPage - 1 }" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                    </a>
                  </li>
                  </c:if>

                  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
                  <c:if test="${i eq paging.curPage }">
                  <li class="page-item active">
                    <a class="page-link" href="/mobo/notice/list?curPage=${i }">${i }</a>
                  </li>
                  </c:if>
                  <c:if test="${i ne paging.curPage }">
                  <li class="page-item">
                    <a class="page-link" href="/mobo/notice/list?curPage=${i }">${i }</a>
                  </li>
                  </c:if>
                  </c:forEach>
                  
                  <c:if test="${paging.curPage lt paging.totalPage }">
                  <li class="page-item">
                    <a class="page-link" href="/mobo/notice/list?curPage=${paging.curPage + 1 }">
                    <i class="fas fa-angle-right"></i>
                    </a>
                  </li>
                  </c:if>

                  <c:if test="${paging.curPage ge paging.totalPage }">
                  <li class="page-item disabled">
                    <a class="page-link" href="/mobo/notice/list?curPage=${paging.curPage + 1 }">
                    <i class="fas fa-angle-right"></i>
                    </a>
                  </li>
                  </c:if>
                  
                  </ul>
                  </nav>
                  
               </div>
            </div>
         </div>
      </div>
   </section>
   
   
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>

   </body>
</html>