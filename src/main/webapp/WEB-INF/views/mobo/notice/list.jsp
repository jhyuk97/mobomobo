<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
     <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/board/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/board/css/animate.css">
    
    <link rel="stylesheet" href="/resources/board/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/board/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/board/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/board/css/aos.css">

    <link rel="stylesheet" href="/resources/board/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/board/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/board/css/jquery.timepicker.css">


    
    <link rel="stylesheet" href="/resources/board/css/flaticon.css">
    <link rel="stylesheet" href="/resources/board/css/icomoon.css">

    
   <link rel="stylesheet" href="/resources/board/css/style.css">
    
    
    <!-- 본래 코드 -->

   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="/resources/board2/css/style.css">
   

   
	<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
   
  <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">NOTICE</h2>
            <p id="p">무부무부 유저라면, 꼭 봐주세요!</p>
          </div>
        </div>
 			
 			  <div class="container">
         
         <div class="row">
            <div class="col-md-12">
               <div>
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



<script src="/resources/board/js/jquery.min.js"></script>
  <script src="/resources/board/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/board/js/popper.min.js"></script>
  <script src="/resources/board/js/bootstrap.min.js"></script>
  <script src="/resources/board/js/jquery.easing.1.3.js"></script>
  <script src="/resources/board/js/jquery.waypoints.min.js"></script>
  <script src="/resources/board/js/jquery.stellar.min.js"></script>
  <script src="/resources/board/js/owl.carousel.min.js"></script>
  <script src="/resources/board/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/board/js/aos.js"></script>
  <script src="/resources/board/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/board/js/bootstrap-datepicker.js"></script>
  <script src="/resources/board/js/jquery.timepicker.min.js"></script>
  <script src="/resources/board/js/particles.min.js"></script>
  <script src="/resources/board/js/particle.js"></script>
  <script src="/resources/board/js/scrollax.min.js"></script>
  <script src="/resources/board/js/main.js"></script>
    
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>

