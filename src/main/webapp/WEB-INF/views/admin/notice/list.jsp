<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function(){
		
		$(location).attr("href", "/admin/notice/write");
		
	});
	
});

</script>

<style type="text/css">

#btnWrite {

	float: right;
}

.nNo {

	width: 10%;
	text-align: center;
}

.nTitle {

	width: 40%;
	text-align: center;
}

.admin {

	width: 10%;
	text-align: center;
}

.nDate {

	width: 15%;
	text-align: center;
}

</style>
       

       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
<button type="button" id="btnWrite" class="btn btn-default btn-sm">작성하기</button>
              <h3 class="mb-0">공지사항</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col" class="nNo">글번호</th>
                    <th scope="col" class="nTitle">제목</th>
                    <th scope="col" class="admin">작성자</th>
                    <th scope="col" class="nDate">작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="Notice">
                <tr>
                	<td class="nNo">${Notice.nNo }</td>
                	<td class="nTitle"><a href="/admin/notice/detail?nNo=${Notice.nNo }">${Notice.nTitle }</a></td>
                	<td class="admin">관리자</td>
                	<td class="nDate"><fmt:formatDate value="${Notice.nDate }" pattern="yy-MM-dd" /></td>
                	
                </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer py-4">
              <span class="float-left">total : ${paging.totalCount }</span>

              <nav aria-label="...">
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
                    <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage - 1 }" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                    </a>
                  </li>
                  </c:if>

                  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
                  <c:if test="${i eq paging.curPage }">
                  <li class="page-item active">
                    <a class="page-link" href="/admin/notice/list?curPage=${i }">${i }</a>
                  </li>
                  </c:if>
                  <c:if test="${i ne paging.curPage }">
                  <li class="page-item">
                    <a class="page-link" href="/admin/notice/list?curPage=${i }">${i }</a>
                  </li>
                  </c:if>
                  </c:forEach>
                  
                  
                  <c:if test="${paging.curPage lt paging.totalPage }">
                  <li class="page-item">
                    <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage + 1 }">
                    <i class="fas fa-angle-right"></i>
                    </a>
                  </li>
                  </c:if>

                  <c:if test="${paging.curPage ge paging.totalPage }">
                  <li class="page-item disabled">
                    <a class="page-link" href="/admin/notice/list?curPage=${paging.curPage + 1 }">
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


      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>