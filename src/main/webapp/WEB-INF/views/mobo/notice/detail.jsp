<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

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


<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>



<style>

table {
	border: 1px solid #ccc;
	width: 100%;
}
.context{
	padding: 15px;
	font-weight: lighter;
	}
	
.text-success {
	color : #a172e3 !important;
}

.text-light {
	color : #e8dcf8 !important;
}


</style>


  <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">${detail.nTitle }</h2>
            <p id="p">무부무부 유저라면, 꼭 봐주세요!</p>
          </div>
        </div>





<div class="container">


<table class="noticeTable" >
	<tr>
	<th style="width: 33%;"><div class="context">제목:${detail.nTitle }</div></th>
	<th style="width: 33%;"><div class="context">조회수: ${detail.nViews }</div></th>
	<th style="width: 33%;"><div class="context">공지일자:<fmt:formatDate value="${detail.nDate }" pattern="yy-MM-dd hh:mm" /></div></th>
	</tr>
</table>
<br>
<div style="height: 500px;">${detail.nContent }</div>


<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/mobo/notice/list"><button class="btn btn-default">목록</button></a>
<%-- 	<c:if test="${id eq view.writerId }"> --%>
<%-- 	</c:if> --%>
</div><!-- 버튼 영역 end -->

</div> <!-- 컨테이너 -->
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
	
	
	
	
	
