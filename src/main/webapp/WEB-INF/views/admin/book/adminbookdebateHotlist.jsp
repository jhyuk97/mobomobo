
		<%@ page language="java" contentType="text/html; charset=UTF-8"
			    pageEncoding="UTF-8"%>

			<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

			<%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>

			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<script type="text/javascript">
			function deleteMDebate(dNo) {

			if( confirm("게시글을 삭제하시겠습니까?") ) {
				$.ajax({
					type:"post"
					, url:"/admin/MDebateDelete"
					, dataType: "json"
					, data: {
						dNo: dNo
					}
					, success: function(data){ 
						
						
						if(data.success) {
							
							
							$("[data-dNo='"+dNo+"']").remove();
							
							alert("게시글을 삭제 하였습니다 ");
							
						} else {
							alert("게시글 삭제가 실패하였습니다");
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


			<style type="text/css">

			#btnWrite {

				float: right;
			}

			.nNo {

				width: 10%;
				text-align: center;
			}

			.nTitle {

				width: 40%;
				text-align: center;
			}

			.dTitle {

				width: 40%;
				text-align: center;
			}

			.admin {

				width: 10%;
				text-align: center;
			}

			.nDate {

				width: 15%;
				text-align: center;
			}

			.dDate {

				width: 15%;
				text-align: center;
			}

			</style>
			       

			       <!-- Table -->
			      <div class="row">
			        <div class="col">
			          <div class="card shadow">
			            <div class="card-header border-0">
			              <h3 class="mb-0">책토론 HOT 게시판</h3>
			            </div>
			            <div class="table-responsive">
			              <table class="table align-items-center table-flush">
			                <thead class="thead-light">
			                  <tr>
			                    <th scope="col" class="dNo">글번호</th>
			                    <th scope="col" class="dTitle">제목</th>
			                    <th scope="col" class="admin">작성자</th>
			                    <th scope="col" class="dDate">작성일</th>
			                    <th scope="col">삭제</th>
			                  </tr>
			                </thead>
			                <tbody>
			                <c:forEach items="${list }" var="Debate">
			                <tr data-dNo="${Debate.dNo }">
			                
			<%--                     <td class="notice">${Debate.DNO }</td> --%>
			<%--                 	<td class="notice">${Debate.CNT }</td> --%>
			<%--                 	<td style="font-size: 6px;"><a href="/mobo/movie/debatedetail?dNo=${Debate.DNO }" class="notice">${Debate.DTITLE }</a></td> --%>
			<%--                 	<td class="notice">${Debate.NICK }</td> --%>
			<%--                 	<td class="notice"><fmt:formatDate value="${Debate.DDATE }" pattern="yy-MM-dd" /></td> --%>
			<%--                 	<td class="notice">${Debate.HIT }</td> --%>
			                	
			                	<td class="nNo">${Debate.DNO }</td>
			                	<td class="nTitle">${Debate.DTITLE }</td>
			                	<td class="admin">${Debate.NICK }</td>
			                	<td class="nDate"><fmt:formatDate value="${Debate.DDATE }" pattern="yy-MM-dd" /></td>
			                	<td><button class="btn btn-warning btn-sm" onclick="deleteMDebate(${Debate.dNo})" >삭제</button></td>
			                	
			                </tr>
			                 </c:forEach>
			                </tbody>
			              </table>
			            </div>
			            <div class="card-footer py-4">
			<%--               <span class="float-left">total : ${paging.totalCount }</span> --%>

			              <nav aria-label="...">
			                <ul class="pagination justify-content-center mb-0">
			                
			                
			                  <c:if test="${paging.curPage le 1 }">
			                  <li class="page-item disabled">
			                    <a class="page-link" href="" tabindex="-1">
			                      <i class="fas fa-angle-left"></i>
			                    </a>
			                  </li>
			                  </c:if>
			                  <c:if test="${paging.curPage ne 1 }">
			                  <li class="page-item">
			                    <a class="page-link" href="/admin/mdebate/list?curPage=${paging.curPage - 1 }" tabindex="-1">
			                      <i class="fas fa-angle-left"></i>
			                    </a>
			                  </li>
			                  </c:if>

			                  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
			                  <c:if test="${i eq paging.curPage }">
			                  <li class="page-item active">
			                    <a class="page-link" href="/admin/mdebate/list?curPage=${i }">${i }</a>
			                  </li>
			                  </c:if>
			                  <c:if test="${i ne paging.curPage }">
			                  <li class="page-item">
			                    <a class="page-link" href="/admin/mdebate/list?curPage=${i }">${i }</a>
			                  </li>
			                  </c:if>
			                  </c:forEach>
			                  
			                  
			                  <c:if test="${paging.curPage lt paging.totalPage }">
			                  <li class="page-item">
			                    <a class="page-link" href="/admin/mdebate/list?curPage=${paging.curPage + 1 }">
			                    <i class="fas fa-angle-right"></i>
			                    </a>
			                  </li>
			                  </c:if>

			                  <c:if test="${paging.curPage ge paging.totalPage }">
			                  <li class="page-item disabled">
			                    <a class="page-link" href="/admin/mdebate/list?curPage=${paging.curPage + 1 }">
			                    <i class="fas fa-angle-right"></i>
			                    </a>
			                  </li>
			                  </c:if>
			                  
			                  
			                </ul>
			              </nav>
			            </div>
			          </div>
			        </div>
			      </div>


			      
			    <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
		