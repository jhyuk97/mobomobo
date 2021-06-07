<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
 
 	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

 

       <script type="text/javascript">
       
       $(document).ready(function() {
			
			 $(document).on("click","#layoutRes h3 a",function(event){
				 console.log($(this).text());
				 // 출간일
				 var publicationDate = $(this).next().next().val()
				 
				 
				 
				 $("#bookTitle").val($(this).text());
				 $("#bookAuthor").val($(this).next().val());
				 $("#publicationDate").val(moment(publicationDate).format('YYYY-MM-DD'))
				 $("#bookSearch").val("");
				 $("#layoutRes").children().remove();
				 
				 $()
				 
				 
				 
				 
				 
				 
				 
				 
				 
			 })

			
			
			
			
    	
    	})
    	
    	
    	
       
			
		function searchBtn(){
			console.log("click!!")
			// 모달창 띄우기

			
			var key = '7ab4fb38af1de0cf515ccc51bc417dd5'
			var data = {
	        		query:$("#bookSearch").val(),
	                target:'title',
	                size : 5
	             }
			// ajax 검색
			getBookInfo(key,data)
			
			
			
		}
		function getBookInfo(key,data){
			$.ajax({
                url: "https://dapi.kakao.com/v3/search/book",
                headers: {'Authorization': 'KakaoAK '+ key},
                type : "get",
                data:data,
                success : function(result){
                	console.log(result)
                	
                	for(var i = 0; i< result.documents.length; i++){
                		var title = result.documents[i].title;
                		console.log(title)
                		
                		
                		var str = "";
                		str += '<div class="form-group form-group-lg">';
                		str += '<h3 class="col-sm-2"><a href="#">'+title+'</a>'
                		str += '<input id ="authors" type="hidden" value="'+ result.documents[i].authors +'"/>'
                		str += '<input id ="authors" type="hidden" value="'+ result.documents[i].datetime +'"/>'
                		str += '</h3>'
                		str += '</div>'
                	$("#layoutRes").append(str);
                	
                	}
                },
                error : function(){
                	
                	alert("검색어 넣어주세요")
                	
                }
			});
		}
       
		</script>
		
		
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h1 class="mb-0">작성</h1>
            </div>
            <form class="form-horizontal" role="form" action="/admin/book/famousWrite" method="post" enctype="multipart/form-data" >
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="bestTitle">명대사 제목</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="bestTitle" name="bestTitle" placeholder="명대사 제목">
			    </div>
			  </div>
			  
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="file">이미지</label>
			    <div class="col-sm-10">
			      <input type="file" id="file" name="file" >
			    </div>
			  </div>
			 <div class="card-header border-0">
              <h1 class="mb-0">작성</h1>
            </div>
			 <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="bookSearch">책 검색</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="bookSearch" placeholder="검색">
			    </div>
			  </div>
			  <div class="card-header border-0" id="searchBtn">
			  	<input type="button" class="btn btn-default" onclick="searchBtn();" value="검색">
			  </div>
			  
			  
			  
			  
			  
			  <div id="layoutRes"></div>
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="bookTitle">제목</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="bookTitle" name="bookTitle" placeholder="제목">
			    </div>
			  </div>
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="bookAuthor">작가</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="bookAuthor" name="bookAuthor" placeholder="작가">
			    </div>
			  </div>
			  
			   <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="publicationDate">출간일</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="publicationDate" name="publicationDate" placeholder="출간일">
			    </div>
			  </div>
			  
			  
			  
			   <div class="card-header border-0">
              <h1 class="mb-0">명대사 구절1</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea id="bestContext1" name="bestContext1" class="form-control" rows="20" cols="" placeholder="내용 / 문자를 사용하지 마세요!"></textarea>
			    </div>
			</div>
			<div class="card-header border-0">
              <h1 class="mb-0">명대사 구절2</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea id="bestContext2" name="bestContext2" class="form-control" rows="20" cols="" placeholder="내용 / 문자를 사용하지 마세요!"></textarea>
			    </div>
			</div>	
			<div class="card-header border-0">
              <h1 class="mb-0">명대사 구절3</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea id="bestContext3" name="bestContext3" class="form-control" rows="20" cols="" placeholder="내용 / 문자를 사용하지 마세요!"></textarea>
			    </div>
			</div>
			
			<div class="card-header border-0">
			  	<input type="submit" class="btn btn-default" value="작성">
			 </div>
			
							  
			</form>
            
         
            
            
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>