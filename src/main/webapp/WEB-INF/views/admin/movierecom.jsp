<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>


<style type="text/css">

#lightbox {
  position: fixed;  
  width:100%;  
  height:100%;  
  background-color:rgba(0,0,0,0.7);  
  top:0;  
  left:0; 
  display:none;  
  z-index: 10;
}

#lightbox #writePopup {
  position:absolute;  
  top:50%;  
  left:50%;  
  transform:translate(-50%, -50%); 
  border:5px solid #eee; 
  width:500px;
  height:500px;
  background: white;      
  overflow: scroll;
}

#closeBtn {
    display: block;
    position: absolute;
    top : 5px;
    right : 5px;
    cursor : pointer;
}

.movieWrap {
	cursor : pointer;
	transition : 0.5s;
}

.movieWrap:hover {
	background: #ddd;
	
}

.writeBtn {
	float: right;
}

.movieWriteInfo {
	display : flex;
}

.marginbottom {
	margin-bottom : 10px;
}

.writeMovieInput {
	border: none;
}

.writeMovieInput:focus {
	outline: none;
}



</style>

       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
          
          
            <div class="card-header border-0">
              <h3 class="mb-0" style="display:inline-block">영화추천</h3>
              <div class="writeBtn">
              <input type="button" value="작성" onclick="openWritePopup()" class="btn btn-primary"/>
              </div>
            </div>
            
            
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">no</th>
                    <th scope="col">제목</th>
                    <th scope="col">분류</th>
                    <th scope="col">Key</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>               
                <tbody>
                <c:forEach items="${list }" var="movie">
                	<tr data-movieNo="${movie.movieNo }">
                		<td>${movie.movieNo }</td>
                		<td>${movie.title }</td>
                		
                		<c:if test="${movie.division == 'recom' }">
                		<td>무부 추천 영화</td>
                		</c:if>
                		<c:if test="${movie.division == 'academy' }">
                		<td>아카데미 상</td>
                		</c:if>
                		
                		<td>${movie.key }</td>
                		<td><button type="button" onclick="deleteMovie(${movie.movieNo})" class="btn btn-warning btn-sm">삭제</button></td>
                	</tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            
            
            <div class="card-footer py-4" style="text-align:center;">
              <nav aria-label="...">
                <ul class="pagination mb-0" style="justify-content:center;">
                
                <c:if test="${paging.getCurPage() != 1 }">
                  <li class="page-item disabled">
                    <a class="page-link" href="/admin/movierecom?curPage=${paging.getCurPage() - 1 }">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                 </c:if>
                  
                  <c:forEach var="i" begin="${paging.getStartPage() }" end="${paging.getEndPage()}" step="1" >
                  	<c:choose>
                  		<c:when test="${paging.getCurPage() == i }">
                  			<li class="page-item active"><a class="page-link" href="/admin/movierecom?curPage=${i }">${i }</a></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li class="page-item"><a class="page-link" href="/admin/movierecom?curPage=${i }">${i }</a></li>
                  		</c:otherwise>
                  	</c:choose>
                  </c:forEach>
                    
                 <c:if test="${paging.getCurPage() != paging.getTotalPage() }">   
                  <li class="page-item">
                    <a class="page-link" href="/admin/movierecom?curPage=${paging.getCurPage() + 1 }">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                 </c:if>
                  
                </ul>
              </nav>
            </div>
            
            
          </div>
        </div>
      </div>

      

    <div id="lightbox">
		<div id="writePopup">
		
		<div id="writePopupHead">
			<h2>추천영화 등록</h2>
			<a onclick="popupClose()" id="closeBtn"><img src="/resources/img/close.png" style="width:30px; height:30px;"/></a>
		</div>
		
		<input type="text" id="search" class="form-control" style="width:300px; display:inline-block;">
		<button type="button" onclick="popupMovieSearch()" class="btn btn-outline-primary">검색</button>
		
		<hr>
		
		<div id="movieList"></div>
		
		</div>
    </div>
      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
    
    
<script type="text/javascript">

$(document).ready(function() {
	
	
	
})

function openWritePopup() {
	
	$("#lightbox").show();
	
}

function popupClose() {
	
		$("#lightbox").hide();
}

function popupMovieSearch() {
	
	var search = $("#search").val();
	
	$.ajax({
		type : 'get'
		, url : '/admin/movierecomSearch'
		, data : {'search' : search}
		, dataType : 'json'
		, success : function(movie) {
			
			$("#movieList").html("");
			var html = "";			
			
			for(var i=0; i<movie.length; i++) {
				
				var title = movie[i].title;
				var key = movie[i].key;
				var image = movie[i].image;
				
				html += '<div onclick="choiceMovie(\'' + title + '\', ' + key + ', \'' + image + '\')" class="movieWrap">'
				if(movie[i].image != null) {
				html += "<img src='" + movie[i].image + "' style='width:70px; height:100px;'>"
				} else {
				html += "<img src='/resources/img/noImage.png' style='width:70px; height:100px;'>"
				}
				html += "<span>" + movie[i].key + " | </span>"
				html += "<span>" + movie[i].title + "</span>"
				html += "</div> <br> " 
			}
			
			$("#movieList").html(html);
		}
	})
}

function choiceMovie(title, key, image) {
	
	console.log(title);
	console.log(key);
	console.log(image);
	console.log(null);
	
	$("#movieList").html("");
	
	var html = "";
	
	html += "<div class='movieWriteInfo'>"
	
	html += "<div>"
	if(image != 'null') {
	html += "<img src='" + image + "' style='width:100px; height:130px;'>"
	} else {
	html += "<img src='/resources/img/noImage.png' style='width:100px; height:130px;'>"
	}
	html += "</div>"
	
	html += "<div style='margin-left : 20px;'>"
	html += "<form method='post'>"
	html += "<select name='division' class='marginbottom'>"
	html += "<option value='academy'>아카데미</option>"
	html += "<option value='recom'>무부추천</option>"
	html += "</select>"
	html += "<input type='text' name='title' value='"+ title +"' style='width:100%' readonly='readonly' class='marginbottom writeMovieInput'>"
	html += "<input type='text' name='key' value='"+ key +"' style='width:100%' readonly='readonly' class='marginbottom writeMovieInput'>"
	if(image != 'null') {
	html += "<input type='hidden' name='image' value='"+ image +"' style='width:100%'>"
	}
	html += "<input type='button' value='등록' class='btn btn-primary' onclick='doubleSubmit(this.form)'>"
	html += "</form>"
	html += "</div>"
	
	html += "</div>"
	
	$("#movieList").html(html);
}

function deleteMovie(movieNo) {

	$.ajax({
		type : 'get'
		, url : '/admin/movierecomDelete'
		, data : {'movieNo' : movieNo}
		, success : function() {
			$("[data-movieNo='"+movieNo+"']").remove();
		}
	})

}

var doubleSubmitFlag = false;

function doubleSubmit(form) {

	if(doubleSubmitFlag) {
		alert('등록 중 입니다.');
		return false;
	} else {
		doubleSubmitFlag = true;
		form.action="/admin/movierecomWrite"
		form.submit();
	}
}

</script>
    
    