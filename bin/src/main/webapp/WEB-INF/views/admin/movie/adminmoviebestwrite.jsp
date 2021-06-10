<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  


       <%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>



<script type="text/javascript">
$(document).ready(function() {
	
	//작성 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/admin/movie/adminmoviebestlist";
	});
	
	//취소 버튼 누르면 이동 
	$("#btnOut").click(function() {
		location.href="/admin/movie/adminmoviebestlist";
	});
	
});
</script>






<style>

#button {
	float:center;
	text-align:center;
}


</style>




       <!-- Table -->
      <div class="row">
        <div class="col">
       
          <div class="card shadow">
        
            <div class="card-header border-0">
              <h2 class="mb-0">영화 명장면 작성</h2>
            </div>

			
	<form action="/admin/movie/adminmoviebestwrite" method="post" enctype="multipart/form-data">
	
	<div class="col-4">
	
    <div class="custom-file">
    <h3 class="mb-0">영화 포스터</h3>
        <input multiple="multiple" type="file" name="file" id="file">
    </div>
    </div>
    <br>
    <div class="col-4">
    <div class="form-group">
        <label for="title" class="form-control-label">영화 제목</label>
        <input class="form-control" type="text" placeholder="영화 제목" id="title" name="title">
    </div>
    </div>
    
    
    <div class="col-4">
    <div class="form-group">
        <label for="maincontent" class="form-control-label">영화 정보</label>
        <input class="form-control" type="text" placeholder="영화 정보" id="maincontent" name="maincontent">
    </div>
    </div>
    
   <div class="col-4">
	
    <div class="custom-file">
    <h3 class="mb-0">명장면1</h3>
        <input multiple="multiple" type="file" name="file" id="file">
    </div>
    </div>
    
    <br>
    
    <div class="col-4">
     <div id="main" class="form-group">
        <label for="subtitle1" class="form-control-label">소제목1</label>
        <input  class="form-control" type="text" placeholder="소제목1" id="subtitle1" name="subtitle1">
    </div>
    </div>
    <br>
    
    <div class="col-4">
     <div class="form-group">
    <label for="content1">내용1</label>
    <textarea class="form-control" id="content1" rows="3" name="content1"></textarea>
  </div>
    </div>
    <br>
    
   <div class="col-4">
	
    <div class="custom-file">
    <h3 class="mb-0">명장면2</h3>
        <input multiple="multiple" type="file" name="file" id="file">
    </div>
    </div>
    <br>
    
     <div class="col-4">
     <div class="form-group">
        <label for="subtitle2" class="form-control-label">소제목2</label>
        <input class="form-control" type="text" placeholder="소제목2" id="subtitle2" name="subtitle2">
    </div>
    </div>
    <br>
    
      <div class="col-4">
     <div class="form-group">
    <label for="content1">내용2</label>
    <textarea class="form-control" id="content2" rows="3" name="content2" ></textarea>
  </div>
    </div>
    <br>
    
   <div class="col-4">
	
    <div class="custom-file">
    <h3 class="mb-0">명장면3</h3>
        <input multiple="multiple" type="file" name="file" id="file">
    </div>
    </div>
    <br>
     <div class="col-4">
     <div class="form-group">
        <label for="subtitle3" class="form-control-label">소제목3</label>
        <input class="form-control" type="text" placeholder="소제목3" id="subtitle3"  name="subtitle3">
    </div>
    </div>
    <br>
    
      <div class="col-4">
     <div class="form-group">
    <label for="content1">내용3</label>
    <textarea class="form-control" id="content3" rows="3" name="content3"></textarea>
  </div>
    </div>
    <br>
    
    
    <div id="button">
    <button type="submit" id="btnWrite" class="btn btn-primary">등록</button>
    <button type="button" id="btnOut" class="btn btn-danger">취소</button>
    </div>
</form>

			
			
		
		
		
		</div> <!-- card shaodw end -->
        </div>
      </div><!-- row end -->
          
       
            
      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
    
    
   