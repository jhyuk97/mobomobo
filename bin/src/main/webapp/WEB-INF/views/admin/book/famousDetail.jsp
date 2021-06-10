<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
 
 	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

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
          <img src="/upload/${img.storedImg }" style="width: 300px;">
          
         	<table class="table" >
         		<tr><th>제목: </th><td>${detail.bestTitle }</td>
         			<th>작성일:</th><td><fmt:formatDate value="${detail.writeDate }" pattern="yyyy-MM-dd"/></td>
         		</tr>
         		<tr><th>책이름:</th><td>${detail.bookTitle }</td>
         			<th>작가</th><td>${detail.bookAuthor }</td>
         			<th colspan="2">출판일</th><td>${detail.publicationDate }</td>
         		</tr>
         		<tr><th colspan="7">명대사1</th></tr>
         		<tr><th colspan="7">${context[0]}</th></tr>
         		<tr><th colspan="7">명대사2</th></tr>
         		<tr><th colspan="7">${context[1]}</th></tr>
         		<tr><th colspan="7">명대사3</th></tr>
         		<tr><th colspan="7">${context[2]}</th></tr>
         		
         	</table>
         	<div class="card-header border-0">
			  	<input type="button" class="btn" value="목록" onclick="javascript:location.href='/admin/book/bookFamous'">
			  	<input type="button" class="btn btn-warning" onclick="deleteBookBest(${detail.bookBestno })" value="삭제">
			 </div>
           
            
            
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>