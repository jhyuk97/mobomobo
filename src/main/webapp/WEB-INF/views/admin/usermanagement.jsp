<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

       
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
                <tr>
                	<td>1</td>
                	<td>master</td>
                	<td>123</td>
                	<td>10</td>
                	<td>
                		<select name="grade" id="grade" class="grade">
							<option value="admin">admin</option>
							<option value="user">user</option>
						</select>
					</td>
                	<td>
                		<button class="btn btn-default btn-xs" onclick="#">삭제</button>
                	</td>
                </tr>
                 
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

      
    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>