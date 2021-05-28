<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
<script type="text/javascript" >
	$(function(){
		$.ajax({
			method:"GET",
			url:"https://dapi.kakao.com/v3/search/book?target=title",
			data:{query = "미움받을 용기"},
			headers:{ Authoriztion: "KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5"},
		})
			.done(function(msg) {
				
				console.log(msg)
				$("#text1").append("<strong>"+msg.documents[0].title+"</strong>");
			})
	})



</script>






<div class="container" id="wrapper">

  <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">** 책시상</h1>
                    <p>
                        무부무부 유저들이 확인할 수 있는 시상 책정보
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="/resources/img/DRAMA.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                             <!--   <li class="text-muted text-right">$240.00</li> -->  
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">빈센조</a>
                            <p class="card-text" id="text1">
                               	송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기송중기
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="/resources/img/1917.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                              <!--  <li class="text-muted text-right">$480.00</li>-->
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">1917</a>
                            <p class="card-text">
                                Aenean gravida dignissim finibus. Nullam ipsum diam, posuere vitae pharetra sed, commodo ullamcorper.
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="/resources/img/therap.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                            <!--     <li class="text-muted text-right">$360.00</li>--> 
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">더 랍스터</a>
                            <p class="card-text">
                                Curabitur ac mi sit amet diam luctus porta. Phasellus pulvinar sagittis diam, et scelerisque ipsum lobortis nec.
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
<!-- ---------------------------------------------------------------------- -->









</div>



<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>