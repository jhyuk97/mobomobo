<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<div>
<form id="writeForm" style="margin:0px auto; width:1320px;" action="/mobo/market/write" method="POST" enctype="multipart/form-data">
	<div>
		<div>
			<p>제목 <input type="text" name="mTitle" id="mTitle"/></p>
		</div>
		
		<div>
			<p>카테고리 <select id="mCate" name="mCate">
						<option value="영화">영화</option>
						<option value="책">책</option>
						<option value="대본집">대본집</option>
					  </select></p>
		</div>
		
		<div>
			<p>가격<input type="text" name="mPrice" id="mPrice"/></p>
			<p>본문 <textarea style="width:100%" id="content" name="mContent"></textarea></p>
		</div>
		
		<div>
			<p>이미지<input id="imgfile" type="file" multiple="multiple" accept=".jpg, .png" name="file" maxlength="10"/></p>
			<div id="ImgPreview"></div>
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
	$("#submit").click(function(){
		submitContents($("#submit"));
		$("form").submit();
	})
	
})


function ImagePreview(input){
	const container = document.getElementById("ImgPreview");
	
	if(input.files){
		
		const fileArr = Array.from(input.files)
		
		const $Div = document.createElement("div")
		
		fileArr.forEach((file, index) => {
			const reader = new FileReader()
			
			const $imgDiv = document.createElement("div")   
            const $img = document.createElement("img")
            $img.classList.add("image")
            const $label = document.createElement("label")
            $label.classList.add("image-label")
            $label.textContent = file.name
            
            $imgDiv.appendChild($img)
            $imgDiv.appendChild($label)
            reader.onload = e => {
                $img.src = e.target.result
                
                $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
                $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
            }
            
            $Div.appendChild($imgDiv)
            reader.readAsDataURL(file)
		})
		
		container.appendChild($Div)
	}
}


const Image = document.getElementById("imgfile")

Image.addEventListener("change", e => {
	ImagePreview(e.target)
})

</script>