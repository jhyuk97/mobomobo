<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

/* .ni-fat-remove{ */
/* 	color: #FFF; */
/* 	background-color: #8ebebc; */
/* 	border: 0; */
/* 	outline: 0; */
/* } */

/* .ni-fat-remove :hover{ */
/* 	background-color: #9ececc; */
/* } */

</style>

<script type="text/javascript">

function deleteUser(userno) {
	$.ajax({
		type: "post"
		, url: "/admin/userDelete"
		, dataType: "json"
		, data: {
			userno: userno
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-userno='"+userno+"']").remove();
				
			} else {
				alert("유저 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

</script>
     
       <!-- Table -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">회원관리</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">회원번호</th>
                    <th scope="col">회원이름</th>
                    <th scope="col">가입일</th>
                    <th scope="col">연령대</th>
                    <th scope="col">등급</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="userInfo">
                <tr>
                	<td>${userInfo.userno }</td>
                	<td>${userInfo.name }</td>
                	<td><fmt:formatDate value="${userInfo.joindate }" pattern="yy-MM-dd" /></td>
                	<td>${userInfo.age }</td>
                	<td>
                	<!-- 유저 등급 변경하기 -->
                	<form>
                		<select name="grade" id="grade" class="grade"> <!-- 선택 시 form으로 묶어서 전송 or josn으로 바로바로  -->
							<option value="${userInfo.grade}">${userInfo.grade }</option>
							
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
						<button onclick="deleteComment(${comment.commentNo });">변경</button>
					</form>
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
                <ul class="pagination justify-content-end mb-0">
                <span class="pull-left">totalUser : ${paging.totalCount }  </span>
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

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>