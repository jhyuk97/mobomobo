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
              <h3 class="mb-0">공지사항</h3>
            </div>
            <div class="table-responsive">
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                <table class="table table-bordered" >
				<tr>
				<td class="warning">게시물번호</td><td style="width: 20%;">${detail.nNo }</td>
				<td class="warning">작성날짜</td><td style="width: 20%;"><fmt:formatDate value="${detail.nDate }" pattern="yy-MM-dd hh:mm"/></td>
				
				</tr>
				
				<tr>
				<td class="warning">제목</td><td colspan="3">${detail.nTitle }</td>
				</tr>
				
				
				<tr>
				<td class="warning" colspan="4">내용</td>
				</tr>
				<tr>
				<td colspan="4" style="height: 200px;">${detail.nContent }</td>
				</tr>
				</table>

                </ul>
              </nav>
             <br>
             <!-- 버튼 영역 -->
<div class="text-center">
	<a href="/admin/notice/list"><button class="btn btn-default">목록</button></a>
<%-- 	<c:if test="${id eq Notice.writerId }"> --%>
		<a href="/admin/notice/update?nNo=${notice.nNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/admin/notice/delete?nNo=${notice.nNo }"><button class="btn btn-danger">삭제</button></a>
<%-- 	</c:if> --%>
</div><!-- 버튼 영역 end -->   
            </div>
          </div>
        </div>
      </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>