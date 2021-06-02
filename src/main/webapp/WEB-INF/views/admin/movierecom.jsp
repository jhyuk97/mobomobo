<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
}

#closeBtn {
    display: block;
    position: absolute;
    top : 5px;
    right : 5px;
    cursor : pointer;
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
                
                 
                </tbody>
              </table>
            </div>
            
            
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
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
		
		<input type="text">
		<button type="button">검색</button>
		
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
	
	var con = confirm("페이지를 닫으면 저장되지 않습니다.");
	
	if(con) {
		$("#lightbox").hide();
	}
}


</script>
    
    