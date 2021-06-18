<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="/resources/board2/css/style.css">
   
   <link rel="stylesheet" href="/resources/board/css/style.css">
   
	<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
   

<style type="text/css">


</style>
	
   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section">공지사항</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="table-wrap">
                  <table style="text-align: center;" class="table table-responsive-xl">
                    <thead>
                      <tr>
                         <th style="width: 10%; color:#000;">글번호</th>
                   		 <th style="width: 60%; color:#000;">제목</th>
                   		 <th style="width: 10%; color:#000;">작성자</th>
                   		 <th style="width: 10%; color:#000;">작성일</th>
                   		 <th style="width: 10%; color:#000;">조회수</th>
                      </tr>
                    </thead>
                    
                     <tbody>
                <c:forEach items="${list }" var="Notice">
                
                <tr>
                	<td class="notice">${Notice.nNo }</td>
                	<td style="font-size: 6px;"><a href="/mobo/notice/detail?nNo=${Notice.nNo }" class="notice">${Notice.nTitle }</a></td>
                	<td class="notice">관리자</td>
                	<td class="notice"><fmt:formatDate value="${Notice.nDate }" pattern="yy-MM-dd" /></td>
                	<td class="notice">${Notice.nViews }</td>
                </tr>
                 </c:forEach>
                </tbody>
                    
               </table>
           		 </div>
           		 
     <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><jsp:include page="/WEB-INF/views/mobo/layout/NoticePaging.jsp" /></li>
               
              </ul>
            </div>
          </div>
        </div>
             
            </div>
         </div>
      </div>
   </section>
   
   
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>

