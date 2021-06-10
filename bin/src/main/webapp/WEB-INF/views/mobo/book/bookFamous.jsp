<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 게시판 필수 css -->
    <meta charset="utf-8">
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
    

    <%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
  
<style>

/** 글자 밑줄 없애는 코드 **/

a { text-decoration:none; } 


</style>





    
      <section class="ftco-section ">
       <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">HIGHLIGHT</h2>
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p>
          </div>
        </div>
        
        <div class="container">
        <div class="row">
        
        
        
        <c:forEach items="${list }" var="item">
        
        
          <div class="col-md-3 ftco-animate">
            <div class="blog-entry">
            
            
              <a href="/mobo/book/famousDetail?bookBestno=${item.BOOKBESTNO }" class="block-20" style="background-image: url('/upload/${item.STOREDIMG }');">
              </a>
            
              <div class="text p-4 d-block">
                <div class="meta mb-3">
                  <div><a href="/mobo/book/famousDetail?bookBestno=${item.BOOKBESTNO }">${item.BESTTITLE }</a></div>
                </div>
                <h3 class="heading"><a href="/mobo/book/famousDetail?bookBestno=${item.BOOKBESTNO }">${item.BOOKTITLE }| ${item.BOOKAUTHOR }</a></h3>
              </div>
            </div>
          </div>
        </c:forEach>
          </div>
        
      
		<jsp:include page="/WEB-INF/views/util/bestpaging.jsp" />

		 



      </div>
    </section>
    






<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>








  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
    
  </body>
</html>