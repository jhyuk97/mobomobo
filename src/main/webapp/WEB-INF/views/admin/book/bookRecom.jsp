<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

       
     <script type="text/javascript">
	function deleteBookBest(isbn){
		
		
		console.log(isbn);
		location.href="/admin/book/recomDelete?isbn="+isbn;
		
	}
 
 
</script>
       
       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h1 class="mb-0">책 추천</h1>
              
              
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">isbn</th>

                    <th scope="col">제목</th>
                    <th scope="col">상</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="list">
                <tr>
                    <td scope="col">${list.isbn }</td>
                    <td scope="col"><a href="#">${list.bookTitle}</a></td>
                    
                    <td scope="col">${list.award }</td>
                    <td scope="col"><button class="btn btn-warning btn-sm" onclick="deleteBookBest(${list.isbn })" >삭제</button></td>
                </tr>
                
                </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer py-4">
	            <input type="button" class="btn btn-default" onclick="javascript:location.href='/admin/book/recomWrite'" value="글작성">
            	<jsp:include page="/WEB-INF/views/util/bestmanagementpaging.jsp" />
            
            </div>
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>