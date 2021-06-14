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
				 var isbn = $(this).next().val().substring(0,10);
				 
				 
				 $("#bookTitle").val($(this).text());
				 $("#isbn").val(isbn);
				 $("#award").val('맨부커')
				 $("#bookSearch").val("");
				 $("#layoutRes").children().remove();
				 
				 
			 })
    	
    	})
			
		function searchBtn(){
    	   $("#layoutRes").children().remove();
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
                		str += '<input id ="authors" type="hidden" value="'+ result.documents[i].isbn +'"/>'
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
            <form class="form-horizontal" role="form" action="/admin/book/recomWrite" method="post"  >
			  
			
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
			    <label class="col-sm-2 control-label" for="isbn">isbn</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="isbn" name="isbn" placeholder="isbn">
			    </div>
			  </div>
			  
			   <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="award">시상식이름</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="award" name="award" placeholder="시상식이름">
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