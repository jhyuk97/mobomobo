<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>


<style type="text/css">

/* 라이트 박스 스타일 */
#lightbox {
  position: fixed;  /* 위치 고정 */
  width:100%;  /* 너비 */
  height:100%;  /* 높이 */
  background-color:rgba(0,0,0,0.7);  /* 배경색 */
  top:0;  /* 시작 위치 - 위쪽 끝 */
  left:0; /* 시작 위치 - 왼쪽 끝 */
  display:none;  /* 화면에서 감추기 */
  z-index: 10;
}

#lightbox #writePopup {
  position:absolute;  /* top, left에 의해 위치 지정 */
  top:50%;  /* 위쪽에서 50% 부터 */
  left:50%;  /* 왼쪽에서 50% 부터 */
  transform:translate(-50%, -50%);  /* 요소를 화면 중앙에 표시하기 위해 이동 */
  border:5px solid #eee; /* 이미지 테두리 */ 
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

</style>

       
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
          
          
            <div class="card-header border-0">
              <h3 class="mb-0">영화추천</h3>
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
                    <th scope="col"></th>
                  </tr>
                </thead>               
                <tbody>
                <c:forEach items="${list }" var="movie">
                	<tr>
                		<td>${movie.movieNo }</td>
                		<td>${movie.title }</td>
                		<c:if test="${movie.division == 'recom' }">
                		<td>무부 추천 영화</td>
                		</c:if>
                		<c:if test="${movie.division == 'academy' }">
                		<td>아카데미 상</td>
                		</c:if>
                		<td>${movie.key }</td>
                		<td><button type="button">삭제</button></td>
                </c:forEach>
                </tbody>
              </table>
            </div>
            
            
            <div class="card-footer py-4" style="text-align:center;">
              <nav aria-label="...">
                <ul class="pagination mb-0" style="justify-content:center;">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  
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
                    
                  <li class="page-item">
                    <a class="page-link" href="#">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
            
            
          </div>
        </div>
      </div>

      <input type="button" value="작성" onclick="openWritePopup()"/>

    <div id="lightbox">
		<div id="writePopup">
		
		<h2>추천영화 등록</h2>
		<a onclick="popupClose()" id="closeBtn"><img src="/resources/img/close.png" style="width:30px; height:30px;"/></a>
		
		<input type="text" id="search">
		<button type="button" onclick="popupMovieSearch()">검색</button>
		
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
	
	if(image != 'null') {
	html += "<img src='" + image + "' style='width:70px; height:100px;'>"
	} else {
	html += "<img src='/resources/img/noImage.png' style='width:70px; height:100px;'>"
	}
	html += "<form action='/admin/movierecomWrite' method='post'>"
	html += "<select name='division'>"
	html += "<option value='academy'>아카데미</option>"
	html += "<option value='recom'>무부추천</option>"
	html += "</select>"
	html += "<input type='text' name='title' value='"+ title +"' style='width:100%'>"
	html += "<input type='text' name='key' value='"+ key +"' style='width:100%'>"
	if(image != 'null') {
	html += "<input type='hidden' name='image' value='"+ image +"' style='width:100%'>"
	}
	html += "<input type='submit' value='작성'>"
	html += "</form>"
	
	$("#movieList").html(html);
}
</script>
    
    