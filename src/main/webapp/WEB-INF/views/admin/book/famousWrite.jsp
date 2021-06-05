<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
 

       <script type="text/javascript">
       
       $(document).ready(function() {
			
			 $(document).on("click","#layoutRes h3 a",function(event){
				 console.log($(this).text());
				 
				 $("bookTitle").val($(this).text());
				 
				 
				 
				 
				 
			 })

			
			
			
			
    	
    	})
       
			
		function searchBtn(){
			console.log("click!!")
			// 모달창 띄우기

			
			var key = '7ab4fb38af1de0cf515ccc51bc417dd5'
			var data = {
	        		query:$("#bookTitle").val(),
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
                		str += '<h3 class="col-sm-2"><a href="#">'+title+'</a></h3>';
                		str += '</div>'
                	$("#layoutRes").append(str);
                	
                	}
                },
                error : function(){
                	
                	alert("검색어 넣어주세요")
                	
                }
			});
		}
		
		function clickBookTitle(){
			console.log("!!!!!!!!!!");
			console.log($("#selector0"))
			
		}
      	
		
		
       
		</script>
		
		
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h1 class="mb-0">작성</h1>
            </div>
            <form class="form-horizontal" role="form" action="" method="post" >
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="title">제목</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="title" name="title" placeholder="제목">
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
			    <label class="col-sm-2 control-label" for="bookTitle">책 제목</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="bookTitle" placeholder="제목">
			    </div>
			  </div>
			  <div class="card-header border-0" id="searchBtn">
			  	<input type="button" class="btn btn-default" onclick="searchBtn();" value="검색">
			  </div>
			  
			  
			  
			  
			  
			  <div id="layoutRes"></div>
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  <div class="form-group form-group-lg">
			    <label class="col-sm-2 control-label" for="formGroupInputLarge">제목</label>
			    <div class="col-sm-10">
			      <input class="form-control" type="text" id="formGroupInputLarge" placeholder="제목">
			    </div>
			  </div>
			   <div class="card-header border-0">
              <h1 class="mb-0">명대사 구절1</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea class="form-control" rows="20" cols="" placeholder="제목"></textarea>
			    </div>
			</div>
			<div class="card-header border-0">
              <h1 class="mb-0">명대사 구절2</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea class="form-control" rows="20" cols="" placeholder="제목"></textarea>
			    </div>
			</div>	
			<div class="card-header border-0">
              <h1 class="mb-0">명대사 구절3</h1>
            </div>
            <div class="form-group form-group-lg">
			    <div class="col-sm-10">
			    <textarea class="form-control" rows="20" cols="" placeholder="제목"></textarea>
			    </div>
			</div>				  
			</form>
            		

            
            
         
            
            
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>