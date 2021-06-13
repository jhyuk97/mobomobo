<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<div>
<form id="writeForm" style="margin:0px auto; width:1320px;" action="/mobo/market/update" method="POST" enctype="multipart/form-data">
<p>${market.mNo }</p>
<input type="hidden" name="mNo" value="${market.mNo }"/>
	<div>
		<div>
			<p>제목 <input type="text" name="mTitle" id="mTitle" value="${market.mTitle }"/></p>
		</div>
		
		<div>
			<p>카테고리 <select id="mCate" name="mCate"><option value="영화">영화</option><option value="책">책</option></select></p>
		</div>
		
		<div>
			<p>가격<input type="text" name="mPrice" id="mPrice" value="${market.mPrice }"/></p>
			<p>본문 <textarea style="width:100%" id="content" name="mContent">${market.mContent }</textarea></p>
		</div>
		
		<div>
			<p>이미지<input type="file" multiple="multiple" accept=".jpg, .png" name="file"/></p>
		</div>
		
		<div>
			<button id="submit">등록</button>
			<button id="cancel">취소</button>
		</div>
	
	</div>
</form>

</div>

<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

function submitContents(elClickedObj) {
	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}

</script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#mCate").val('${market.mCate}').prop("selected",true);


	$("#submit").click(function(){
		submitContents($("#submit"));
		$("form").submit();
	})
	
})
</script>