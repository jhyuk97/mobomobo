<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>



<div class="container">

<br>

<h1 class="display-4">ID 찾기 </h1>

  <div class="row" style="border: 1px solid black;">
  
    <div class="col col-lg-2">
      <span>사용자의 id 는 </span>
    </div>
    <div class="col col-lg-2">
      <span>${id }</span>
    </div>

  </div>
  
  <div class="table-responsive">
    

<div>
    <table class="table align-items-center">
        <thead class="thead-light">
            <tr>
                <th scope="col" class="sort" data-sort="name">Project</th>
                <th scope="col" class="sort" data-sort="budget">Budget</th>
                <th scope="col" class="sort" data-sort="status">Status</th>
                <th scope="col">Users</th>
                <th scope="col" class="sort" data-sort="completion">Completion</th>
                <th scope="col"></th>
            </tr>
        </thead>
	</table>
	</div>
  
  <br>
</div>


<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>