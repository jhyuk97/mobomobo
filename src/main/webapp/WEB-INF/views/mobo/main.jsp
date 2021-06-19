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
    
    	  <div class="row bookData">
            
            <c:forEach items="${bookList }" var="book" varStatus="status"> 
                        <input id="bookIsbn${status.index }" value="${book.isbn }" type="hidden">
                        <input id="bookRating${status.index }" value="${book.starRating }" type="hidden">
            </c:forEach>             
                
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
        <c:if test="${marketList.size() > 0 }">
        	<c:forEach items="${marketList }" var="market">
        		<div class="col-12 col-md-4 p-5 mt-3">
                	<a href="/mobo/market/${market.mNo }"><img style="width:344px; height:475px;" src="/emp/${market.storedImg.get(0) }" class="rounded-circle img-fluid border"></a>
                	<h5 id="market" class="text-center mt-3 mb-3">${market.mTitle }</h5>
            	</div>
        	</c:forEach>
		</c:if>
        </div>
    </section>
    <!-- End Categories of The Month -->

   
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>


<script type="text/javascript">

$(document).ready(function(){
	
	movieStarRating();
	bookStarRating();
	
})
function bookStarRating(){
	console.log($("#bookIsbn"+0).val())
	for(var i=0;i<3;i++){
		(function(i){
			
	var rating = $("#bookRating"+i).val()
		
		$(".bookData").append(`
    			<div class="col-12 col-md-4 mb-4" style="text-align:center">
                <div class="card h-100 img${'${i}'}">
                    <div class="card-body">
                        <ul class="list-unstyled justify-content-between">
                            <li id="bookStarRating${'${i}'}">
                            <p>평점: ${'${rating}'}</p>
                            </li>
                            <input type="hidden" value="${'${rating}'}" id="bstarrating${'${i}'}"/>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    			`)
		
	var isbn = $("#bookIsbn"+i).val()
		
	$.ajax({
            url: "https://dapi.kakao.com/v3/search/book",
            headers: {'Authorization': 'KakaoAK 7ab4fb38af1de0cf515ccc51bc417dd5'},
            type : "get",
            data:{
            	query:isbn,
                target:'isbn'
            },
            success : function(result){
            	console.log(result.documents[0].title)
            	console.log(i)
            	console.log($(".img"+i))

            	$(".img"+i).prepend(`
                    <a href="/mobo/book/detail?isbn=${'${result.documents[0].isbn.substring(0,10)}'}">
                    <img src="${'${result.documents[0].thumbnail}'}" class="card-img-top">
                    </a>
            			`)
            	console.log($(".img"+i+" .card-body"));
            	$(".img"+i+" .card-body").append(`
            			<a href="/mobo/book/detail?isbn=${'${result.documents[0].isbn.substring(0,10)}'}" class="h2 text-decoration-none text-dark">${'${result.documents[0].title}'}</a>	
            			`)
            			
            			
            	var star = $("#bstarrating"+i).val();
            	console.log(star)
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
        		
        		$("#bookStarRating" + i).html(html);
        		
            	
            	
            	
            },
            error: function(){
    			alert("실패");
    		}
	})//$.ajax({ end
	})(i)
	}
}

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

  