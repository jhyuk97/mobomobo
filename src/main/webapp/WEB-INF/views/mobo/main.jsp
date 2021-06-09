<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<style type="text/css">


.card-img-top {
	width : 293px;
	height : 400px;
}

</style>
   


    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active test0" style="height:500px;">
                <div class="container">
                    <div class="row p-5">
                     <img class="img-fluid" src="/resources/img/maindis2.gif" >
                    </div>
                </div>
            </div>
            <div class="carousel-item test1" style="height:500px;">
                <div class="container">
                    <div class="row p-5">
                       <img class="img-fluid" src="/resources/img/mainbook3.gif"  >
                    </div>
                </div>
            </div>
            <div class="carousel-item test2" style="height:500px;">
                <div class="container">
                    <div class="row p-5">
                       
                        <img class="img-fluid" src="/resources/img/mainmovie5.gif" >
                    </div>
                </div>
            </div>
            <div class="carousel-item test3" style="height:500px;">
                <div class="container">
                    <div class="row p-5">
                        
                            <img class="img-fluid" src="/resources/img/MCU1.gif" >
                        
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        
        
        
        
        
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    
    <!-- End Banner Hero -->
    
    
     <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">무부'S MOIVE</h1>
                    <p>
                        무부무부 유저들의 실시간 별점으로 알 수 있는 인기 영화
                    </p>
                </div>
            </div>
            <div class="row">
            
            <c:forEach items="${movieList }" var="movie" varStatus="status"> 
            
                <div class="col-12 col-md-4 mb-4" style="text-align:center">
                    <div class="card h-100">
                        <a href="/mobo/movie/movierecomDetail?key=${movie.key }&image=${movie.image}">
                            <img src="${movie.image }" class="card-img-top">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled justify-content-between">
                                <li id="movieStarRating${status.index }">
                                </li>
                            </ul>
                            <input type="hidden" value="${movie.starRating }" id="starrating${status.index }"/>
                            <a href="/mobo/movie/movierecomDetail?key=${movie.key }&image=${movie.image}" class="h2 text-decoration-none text-dark">${movie.title }</a>
                        </div>
                    </div>
                </div>
                
            </c:forEach>             
                
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
    
     <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">무부'S BOOK</h1>
                    <p>
                          무부무부 유저들의 실시간 별점으로 알 수 있는 인기 책
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="/resources/img/BOOK1.jpg" class="card-img-top" alt="...">
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
                             <!--     <li class="text-muted text-right">$240.00</li>-->
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">노르웨이의 숲</a>
                            <p class="card-text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt in culpa qui officia deserunt.
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="/resources/img/BOOK2.jpg" class="card-img-top" alt="...">
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
                              <!--    <li class="text-muted text-right">$480.00</li>-->
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">보건교사 안은영</a>
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
                            <img src="/resources/img/BOOK3.jpg" class="card-img-top" alt="...">
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
                             <!--  <li class="text-muted text-right">$360.00</li> -->  
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">프로젝트 헤일메리</a>
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
    
    


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">무부'S ITEMS</h1>
                <p>
                   무부무부 유저들이 사랑한 영화와 책들을 저렴한 가격에 만날 수 있는 곳
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="/resources/img/BLUE1.jpg" class="rounded-circle img-fluid border"></a>
                <h5 id="market" class="text-center mt-3 mb-3">기생충 블루레이</h5>
                <p class="text-center"><a class="btn btn-success">구매하기</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="/resources/img/BLUE2.jpg" class="rounded-circle img-fluid border"></a>
                <h2 id="market" class="h5 text-center mt-3 mb-3">괴물 대본집</h2>
                <p class="text-center"><a class="btn btn-success">구매하기</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="/resources/img/dvd1.jpg" class="rounded-circle img-fluid border"></a>
                <h2 id="market" class="h5 text-center mt-3 mb-3">윤희에게:풀슬립 한정판</h2>
                <p class="text-center"><a class="btn btn-success">구매하기</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->

   
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>


<script type="text/javascript">

$(document).ready(function(){
	
	movieStarRating();
	
})

function movieStarRating() {
	
	console.log('ddd')
	
	for(var i=0; i<3; i++) {
		
		var star = $("#starrating" + i).val();
		
		var html = "";
		
		if(star % 1 == 0) {

			for(var j=0; j<star; j++) {
				
				html += "<img src='/resources/img/star.png' style='width:30px; height:30px;' />"
			}
		
		} else {
			
			for(var j=0; j<star-0.5; j++) {
				
				html += "<img src='/resources/img/star.png' style='width:30px; height:30px;' />"
			}
			
			html += "<img src='/resources/img/halfStar.png' style='width:15px; height:30px;' />"
		}
		
		html += "<p class='text-muted' style='display:inline; padding-left:15px;'>" + star + "</p>"
		
		$("#movieStarRating" + i).html(html);
		
	}
}

</script>

  