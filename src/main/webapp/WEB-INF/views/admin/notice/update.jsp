<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		//form submit 수행하기
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>


<div class="container">

<h1>글수정 페이지</h1>
<hr>

<form action="/admin/notice/update" method="post">
	
	
	<input type="hidden" name="nNo" id="nNo" value="${detail.nNo}"/> 
       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">공지사항</h3>
            </div>
            
            <div class="table-responsive">
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                
                <table class="table table-bordered" >
				<tr>
				<td class="warning"></td><td style="width: 20%;">${detail.nNo }</td>
				<td class="warning">작성날짜</td><td style="width: 20%;"><fmt:formatDate value="${detail.nDate }" pattern="yy-MM-dd hh:mm"/></td>
				
				</tr>
				
				<tr>
				<td class="warning">제목</td><td colspan="3"><input type="text" value="${detail.nTitle }" id="nTitle" name="nTitle" style="width:100%;"></td>
				</tr>
				
				<tr>
				<td class="warning" colspan="4">내용</td>
				</tr>
				<tr>
				<td colspan="4" style="height: 200px;"><textarea cols="4" style="height: 511px; width:100%; margin-top: 0px; margin-bottom: 0px; resize:none;" name="nContent" >${detail.nContent }</textarea></td>
				
				</tr>
				</table>

                </ul>
              </nav>
             <br>
             
           </div>
          </div>
        </div>
      </div>
      </div>
      
<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/admin/notice/list"><button class="btn btn-default">목록</button></a>

		<button type="submit" id="btnUpdate" class="btn btn-primary">수정</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />

</div><!-- 버튼 영역 end -->   

	
</form>

</div>


      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>