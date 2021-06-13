<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

       
     <script type="text/javascript">
	function deleteBookBest(bookBestno){
		
		
		console.log(bookBestno);
		location.href="/admin/book/delete?bookBestno="+bookBestno;
		
	}
 
 
</script>
       
       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h1 class="mb-0">책 명대사</h1>
              
              
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
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="list">
                <tr>
                    <td scope="col">${list.BOOKBESTNO }</td>
                    <td scope="col"><a href="/admin/book/famousDetail?bookBestno=${list.BOOKBESTNO }">${list.BESTTITLE }</a></td>
                    <td scope="col"><fmt:formatDate value="${list.WRITEDATE }" pattern="yyyy-MM-dd"/></td>
                    <td scope="col">${list.USERNO }</td>
                    <td scope="col"><button class="btn btn-warning btn-sm" onclick="deleteBookBest(${list.BOOKBESTNO})" >삭제</button></td>
                </tr>
                
                </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer py-4">
	            <input type="button" class="btn btn-default" onclick="javascript:location.href='/admin/book/famousWrite'" value="글작성">
            	<jsp:include page="/WEB-INF/views/util/bestmanagementpaging.jsp" />
            
            </div>
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>