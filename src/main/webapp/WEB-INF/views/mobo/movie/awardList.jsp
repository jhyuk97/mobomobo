<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

.movieAwardListContainer {
	min-height: 1000px;
	width : 1200px;
	margin : 0 auto;
}

.awardWrap {
	display : flex;
	width : 1000px;
	flex-wrap:wrap;
	margin : 0 auto;
}

.awardMovie {
	width : 200px;
	display : flex;
	justify-content: center;
	flex-direction: column;
}

.center {
	text-align: center;
}

#aColor {
	color : #7251B5;
}

#aColor:hover {
  	color : #B185DB;
}

</style>


<div class="movieAwardListContainer">

	<section class="ftco-section ">
       <div class="row no-gutters justify-content-center pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4" style='margin-top : 50px;'>아카데미 수상작</h2>
            <p id="p">당신의 인생 영화, 무부무부에서 만나보세요</p>
          </div>
    	</div> 
    </section>

	 <div class="center" style='margin-bottom : 30px;'><img src="/resources/img/movieaward2.gif"></div> <br>


	<div class="awardWrap">
	<c:forEach items="${list }" var="award">
		<div class="awardMovie">
			<div class="center"><a href="/mobo/movie/movierecomDetail?key=${award.key }&image=${award.image}"><img src="${award.image }"/></a></div>
			<div class="center"><a href="/mobo/movie/movierecomDetail?key=${award.key }&image=${award.image}" id="aColor">${award.title }</a></div>
		</div>
	</c:forEach>
	</div>

</div>





<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />

