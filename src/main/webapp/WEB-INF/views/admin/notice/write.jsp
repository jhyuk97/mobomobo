<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>


<div class="container">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/admin/notice/write" method="post" >

	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" id="writer" value="관리자" readonly="readonly"
			class="form-control" />
	</div>

	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="nTitle" name="nTitle" class="form-control" />
	</div>
	
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" style="width: 100%" id="nContent" name="nContent"></textarea>
	</div>
	
	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite" type="submit">작성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
	
</form>

</div>

<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>