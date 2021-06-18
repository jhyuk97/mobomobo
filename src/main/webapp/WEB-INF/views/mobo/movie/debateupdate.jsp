<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		$("form").submit();
	});
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>


<div class="container">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/mobo/movie/debateupdate" method="post" >
	<input type="hidden" name="dNo" value="${debatedetail.dNo }"/>
	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" id="writer" value="${sessionScope.nick }" readonly="readonly"
			class="form-control" />
	</div>

	<div class="form-group">
		<label for="dTitle">제목</label>
		<input type="text" id="dTitle" name="dTitle" class="form-control" value="${debatedetail.dTitle }"/>
		<input type="hidden" id="boardDiv" name="boardDiv" class="form-control" value = "4" />
	</div>
	
	<div class="form-group">
		<label for="dContent">본문</label>
		<textarea rows="10" style="width: 100%" id="dContent" name="dContent">${debatedetail.dContent }</textarea>
	</div>
	
	
	
</form>

	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite" type="submit">작성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
	
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "dContent", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

function submitContents(elClickedObj) {
	
	oEditors.getById["dContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}

</script>



<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>