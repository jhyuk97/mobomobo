<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  


       <%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/admin/movie/adminmoviebestwrite";
	});
	
});
</script>

       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">영화 명장면 게시판</h3>
            </div>

            <div class="table-responsive">
            
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">no</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">장면1</th>
                    <th scope="col">장면2</th>
                    <th scope="col">장면3</th>
                    <th scope="col"></th>
                    
                    
                  </tr>
                </thead>
          
                 <c:forEach items="${list}" var="moviebest">
                  <tr>
                  
                    <th scope="row">
                    
                      <div class="media align-items-center">
                       
                        <div class="media-body">
                          <span class="mb-0 text-sm">${moviebest.movieBestNo }</span>
                        </div>
                      </div>
                    </th>
                    <td>
                      ${moviebest.title }
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                       ${moviebest.maincontent }
                      </span>
                    </td>
                   
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="mr-2">${moviebest.subtitle1 }</span>
                        <div>
                          
                        </div>
                      </div>
                    </td>
                    
                     <td>
                      <div class="d-flex align-items-center">
                        <span class="mr-2">${moviebest.subtitle2 }</span>
                        <div>
                          
                        </div>
                      </div>
                    </td>
                    
                     <td>
                      <div class="d-flex align-items-center">
                        <span class="mr-2">${moviebest.subtitle3 }</span>
                        <div>
                          
                        </div>
                      </div>
                    </td>
                 
                    <td class="text-right">
                    
                     <a href="/admin/movie/moviebestdelete?movieBestNo=${moviebest.movieBestNo }"><button class="btn btn-warning btn-sm" >삭제</button></a> 
                     
                    </td>
                  </tr>
                  </c:forEach> 
               
              </table>
            </div>
           

            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0"> 
                  <li class="page-item active">
                  <jsp:include page="/WEB-INF/views/admin/include/MovieBestPaging.jsp" />
                  </li>
                </ul>
              </nav>
              <button id="btnWrite"  class="btn btn-primary" type="button">작성</button>
            </div>
   	 	</div>
   	 	
        </div>
      </div>
          
       
            
      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
    
    
   