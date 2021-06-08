<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#plz{

 	position : absolute; 
 	bottom: 0;
 	height: 60px; 
 	margin-top: -50px; 
 	right: 0;


}


</style>

<script type="text/javascript">
function deleteUser(userno) {

if( confirm("유저를	 삭제하시겠습니까?") ) {
	$.ajax({
		type: "post"
		, url: "/admin/userDelete"
		, dataType: "json"
		, data: {
			userno: userno
		}
		, success: function(data){ // 오류
			
			
			if(data.success) {
				
				
				$("[data-userno='"+userno+"']").remove();
				
				alert("유저를 삭제 하였습니다 ");
				
			} else {
				alert("유저 삭제가 실패하였습니다");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
	
	} 
	
	else{
		return false;
	}
}

</script>

<script type="text/javascript">
$(document).ready(function() {

	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/usermanagement?search="+$("#search").val();
	});
	
})
</script>

<script type="text/javascript">
function updateUser() {

	var rtn;
	
	rtn = confirm('변경 하시겠습니까?');
	
	if(rtn){
		document.getElementById('from').submit();
	}else{
		return false;
	}
	
	
}
</script>
     
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0" style="position: relative;">
            
	         <h1 class="mb-0" >회원관리</h1>
			<br>
			<div>
	         <div id="plz">
			 	<button type="button" class="btn btn-outline-primary" style="float: right;" id="btnSearch" >검색</button>
   				<input type="text" class="form-control" style="float: right; 	width: 200px;" id="search" value="${param.search }" placeholder="회원이름으로 검색하세요">
			</div>
			<br>
			</div>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">회원번호</th>
                    <th scope="col">회원이름</th>
                    <th scope="col">가입일</th>
                    <th scope="col">연령대</th>
                    <th scope="col">등급(마스터만 변경가능)</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="userInfo">
                <tr data-userno="${userInfo.userno}">
                	<td>${userInfo.userno }</td>
                	<td>${userInfo.name }</td>
                	<td><fmt:formatDate value="${userInfo.joindate }" pattern="yy-MM-dd" /></td>
                	<td>${userInfo.age }</td>
                	<td>
                	<!-- 유저 등급 변경하기 -->
                	<c:choose>
                	<c:when test="${id == 'master123'}"> 
                	
                	<form action="/admin/userUpdate" method="post" name="from">
                		<select class="form-control form-control-sm" name="grade" id="grade" class="grade"> <!-- 선택 시 form으로 묶어서 전송 or josn으로 바로바로  -->
							<option  value="${userInfo.grade}">${userInfo.grade }</option>
							
							<!-- 유저의 상태에 따라 선택지 다르게 보여줌 -->
							<c:choose>
							
							<c:when test="${userInfo.grade == 'user'}">
								<option value="admin">admin</option>							
							</c:when>
							
							<c:otherwise>
								<option value="user">user</option>						
							</c:otherwise>
							
							</c:choose>

						</select>
						<input type="hidden" id="userno" name="userno" value="${userInfo.userno}">
						<button class="btn btn-success btn-sm" onclick="updateUser();">변경</button>
					</form>
					
					</c:when>
					
                		<c:otherwise> 
							${userInfo.grade }
 						</c:otherwise>
 					
					</c:choose> 
						
					</td>
                	<td>
                		<button class="btn btn-warning btn-sm" onclick="deleteUser(${userInfo.userno });" >삭제</button>
                	</td>
                </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer py-4">
              <nav aria-label="...">
                <span class="pull-left">totalUser : ${paging.totalCount }</span>
                <ul class="pagination justify-content-end mb-0">
				<jsp:include page="/WEB-INF/views/util/usermanagementpaging.jsp" />
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>