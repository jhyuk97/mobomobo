<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<style type="text/css">
.rembutton{
  border-radius: 5px;
  padding: 10px 15px;
  font-size: 22px;
  text-decoration: none;
  margin: 20px;
  color: #fff;
  display: inline-block;
  outline: 0;
  border: 0;
  background-color: #c2b0f2;

}


.rembutton:focus {
   outline: none;
}

.rembutton:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}
</style>
<br><br>
<section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">MARKET</h2> <!--각자 게시판 영어 제목이 와야함-->
            <p id="p">가지고있는 물품을 팔아보세요</p><!--각자 게시판 내용이 와야함 필요없음 제외 가능-->
          </div>
        </div>

<div class="container">
<form id="writeForm" style="margin:0px auto;" action="/mobo/market/write" method="POST" enctype="multipart/form-data">
	<div>
		<div>
			<p>제목 <input type="text" class="form-control" name="mTitle" id="mTitle"/></p>
		</div>
		
		<div>
			<p>카테고리 <select id="mCate" class="form-control" name="mCate">
						<option value="영화">영화</option>
						<option value="책">책</option>
						<option value="대본집">대본집</option>
					  </select></p>
		</div>
		
		<div>
			<p>가격<input type="text" class="form-control" name="mPrice" id="mPrice"/></p>
			<p>본문 <textarea style="width:100%" id="content" name="mContent"></textarea></p>
		</div>
		
		<div style="border:1px solid #c4c4c4; margin:10px 0; padding:5px; background:#f5f6f6;">
			<div>
			<p><input id="imgfile" name="imgfile" type="file" value="사진추가" multiple="multiple" accept=".jpg, .png" name="file" maxlength="10"/>
			</p>
			</div>
			<div id="ImgPreview" style="margin:10px"></div>
		</div>
		
		<div>
			<button id="submit" class="rembutton">등록</button>
			<button type="button" id="cancel" class="rembutton">취소</button>
		</div>
	
	</div>
</form>

</div>
</section>
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

var fileArr = new Array();

$(document).ready(function(){	
	$("#cancel").click(function(){
		window.history.go(-1);
	});
	
	
	$("#submit").click(function(){
		submitContents($("#submit"));
		
		var form = $('form')[0];
		var formData = new FormData(form);
		formData.append("file", fileArr);
		
		$("form").submit();
	})
	
})


function ImagePreview(input){
	$("#ImgPreview").html('');
   const container = document.getElementById("ImgPreview");
   
   container.style.height="150px";
   $("#ImgPreview").css("overflow-y", "scroll")
   
   if(input.files){
      
      const fArr = Array.from(input.files)
      const length = fileArr.length
      const $Div = document.createElement("div")
      
      console.log('fArr')
      console.log(fArr)
      
      fArr.forEach((file, index) => {
       	 fileArr.push(file)
    	  
       	 console.log('fileArr')
       	 console.log(fileArr)
    	  
    	 const reader = new FileReader()
         
         const $check = document.createElement("input")
         $check.setAttribute("type", "checkbox")
         $check.setAttribute("id", ("check"+(length+index)))
         $check.style.position="relative";
         $check.style.zIndex="1";
         
         const $imgDiv = document.createElement("div")
         $imgDiv.setAttribute("id", ("imgDiv"+(length+index)))
         
         const $label = document.createElement("label")
         const $img = document.createElement("img")
         $label.setAttribute("for", ("check"+(length+index)))
         $label.style.position="relative";
         $label.style.top="-15px";


            $img.classList.add("image")
            
            
            $label.appendChild($img)
            
            $imgDiv.appendChild($check)
            $imgDiv.appendChild($label)
            reader.onload = e => {
                $img.src = e.target.result
                $img.style.width = "100%";
                $img.style.height = "100%";
                
                $imgDiv.style.width = "200px";
                $imgDiv.style.float = "left";
            }
            
            $Div.appendChild($imgDiv)
            reader.readAsDataURL(file)
      })
      
      container.appendChild($Div)
      
      $("#imgCancel").css("visibility", "inline");
   }

}


const Image = document.getElementById("imgfile")

Image.addEventListener("change", e => {
   ImagePreview(e.target)
})



</script>