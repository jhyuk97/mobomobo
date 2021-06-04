<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/mobo/layout/header.jsp" />

<style type="text/css">

#movieInfoWrap {
	min-height: 1000px;
}

.starBox {
    font-size: 0 !important;
}

.star {
	display: inline-block;

	width: 15px;
    height: 30px;

	background-image: url(/resources/img/empty.png);
	background-repeat: no-repeat;
	background-size: 200%;
}

.star_left {
	background-position: 0 0;
}

.star_right {
	background-position: 100% 0;
}

.on {
	background-image: url(/resources/img/star.png);
}

.starResult {
	display: inline-block;

	width: 15px;
    height: 30px;

	background-image: url(/resources/img/star.png);
	background-repeat: no-repeat;
	background-size: 200%;
}

#chart {
	width : 500px;
	height : 250px;
}

.bubbly-button {
  font-family: "Helvetica", "Arial", sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 50px; 
  margin-bottom: 50px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #c2b0f2;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;
  box-shadow: 0 2px 25px rgba(218, 183, 234, 1);
}
.bubbly-button:focus {
  outline: 0;
}
.bubbly-button:before, .bubbly-button:after {
  position: absolute;
  content: "";
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-button:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 20%, #c2b0f2 20%, transparent 30%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 10%, #c2b0f2 15%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-button:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, transparent 10%, #c2b0f2 15%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%), radial-gradient(circle, #c2b0f2 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-button:active {
  transform: scale(0.9);
  background-color: #dab7ea;
  box-shadow: 0 2px 25px rgba(218, 183, 234, 1);
}
.bubbly-button.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-button.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}

</style>

<div id="movieInfoWrap">

<c:choose>
	<c:when test="${movie.image ne 'null' && movie.image ne '' }">
		<img src="${movie.image }">
	</c:when>
	
	<c:otherwise>
		<img src="/resources/img/noImage.png"/>
	</c:otherwise>
</c:choose>

<button type="button" id="bookmarkBtn" onclick="manageBookMark()" class="bubbly-button">북마크</button> <br>

제목 : ${movie.title } <br>
감독 : ${movie.directors } <br>
배우 : ${movie.actors } <br>
상영시간 : ${movie.showTm } <br>
개봉일 : ${movie.openDt } <br>
장르 : ${movie.genres } <br>
개봉국가 : ${movie.nationNm } <br>
관람등급 : ${movie.grades } <br><br>

평균 별점 : <span id="thisStarAvg"></span> <br>



<div id="starInsertWrap">

	<div class="starBox">
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
	</div>
	
	<div class="star-value" id="starValue">0</div>
	
	<button type="button" onclick="insertStarRating()">별점 입력</button>

</div>


<div id="starResultWrap" >
</div>

<div id="chart">
<canvas id="myChart1"></canvas>
</div>

<h4>${movie.directors } 감독의 다른작품</h4>
<c:forEach items="${list }" var="another">

	<c:choose>
		<c:when test="${another.image ne null }">
			<a href="/mobo/movie/movierecomDetail?key=${another.key }&image=${another.image}"><img src="${another.image }" /></a>
		</c:when>
		
		<c:otherwise>
			<a href="/mobo/movie/movierecomDetail?key=${another.key }&image=${another.image}"><img src="/resources/img/noImage.png"/></a>
		</c:otherwise>
	</c:choose>
</c:forEach>


</div> <!-- movieInfoWrap end -->


<input type="hidden" value="${movie.key }" id="hiddenKey"/>
<input type="hidden" value="${movie.title }" id="hiddenTitle"/>
<input type="hidden" value="${movie.image }" id="hiddenImage"/>
<input type="hidden" value="${sessionScope.userno }" id="hiddenUserno" />

<input type="hidden" value="0" id="avg0">
<input type="hidden" value="0" id="avg1">
<input type="hidden" value="0" id="avg2">
<input type="hidden" value="0" id="avg3">
<input type="hidden" value="0" id="avg4">


<script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
<script type="text/javascript">

var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-button");

	for (var i = 0; i < bubblyButtons.length; i++) {
	  bubblyButtons[i].addEventListener('click', animateButton, false);
	}



var idx = -1;
$(document).ready(function() {
	
	//별점여부 조회
	checkStarRating();
	
	//연령별 평점 평균 차트 생성
	starAvg();
	
	//해당영화 평균 별점 조회
	starAvgOfSingle();
	
	//-----------------------------------------
	
	//별 클릭 이벤트
	$(".star").click(function() {
		idx = $(this).index();
		
		$(".star").removeClass("on")
		
		for(var i=0; i<=idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
		showStarValue(idx);
		
	})
	
	//마우스를 올리면 별 채워지기
	var hover_idx = -1;
	$(".star").mouseover(function() {
		hover_idx = $(this).index();
		
		$(".star").removeClass("on")
		
		for(var i=0; i<=hover_idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
		showStarValue(hover_idx);
		
	})
	
	//마우스를 떼면 클릭된 값으로 초기화시키기
	$(".star").mouseout(function() {
		
		showStarValue(idx);
		
		$(".star").removeClass("on")
		
		for(var i=0; i<=idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
	})  
	
	//북마크 상태 조회 
	if(${bookmarkflag}) { 
		$("#bookmarkBtn").html("북마크 취소");
	} else {
		$("#bookmarkBtn").html("북마크");
	}    
	
	
}) // $(document).ready end 
 
//별 선택 값을 숫자로 보여주는 함수
function showStarValue(val) {
	if( val < 0) {
		val = 0;
	} else {
		val = (val+1)/2;
	}
	
	$(".star-value").html(val);
};

//별점 입력
function insertStarRating() {
	
	var starRating = $("#starValue").html();
	var hiddenKey = $("#hiddenKey").val();
	var hiddenTitle = $("#hiddenTitle").val();
	var hiddenImage = $("#hiddenImage").val();
	
	$.ajax({
		type : 'get'
		, url : '/mobo/movie/starRatingInsert'
		, data : {'starRating' : starRating
				, 'key' : hiddenKey
				, 'title' : hiddenTitle
				, 'image' : hiddenImage }
		, success : function() {
			
			$("#starInsertWrap").hide();
			$("#starResultWrap").show();
			
			checkStarRating(); //입력한 별점 조회/출력 메소드
			
			starRatingCount(); //푸터의 총 별점 갯수 조회 메소드
			
			starAvg(); //차트 연령별 별점 평균 조회 메소드
			
			starAvgOfSingle(); //해당영화의 평균 별점 조회 메소드
		}
	})
}

//입력한 별점 조회/출력
function checkStarRating() {
	
	var userno = $("#hiddenUserno").val();
	var hiddenKey = $("#hiddenKey").val();

	$.ajax({
		type : 'get'
		, url : '/mobo/movie/starRatingCheck'
		, data : {'key' : hiddenKey}
		, dataType : 'json'
		, success : function(data) {
			
			$("#starResultWrap").html("");
			
			if(data != 404) {
				
				$("#starInsertWrap").hide();
				
				var starResultWrapText = "";
				
				starResultWrapText += "내 별점";
				
				if(Number.isInteger(data)) {

					for(var i=0; i<data; i++) {
						
						starResultWrapText += "<img src='/resources/img/star.png' style='width:30px; height:30px;' />"
					}
				
				} else {
					
					for(var i=0; i<data-0.5; i++) {
						
						starResultWrapText += "<img src='/resources/img/star.png' style='width:30px; height:30px;' />"
					}
					
					starResultWrapText += "<img src='/resources/img/halfStar.png' style='width:15px; height:30px;' />"
				}
				
				starResultWrapText += "<br> <input type='button' value='수정' onclick='updateStarRating();'/>"
				
				$("#starResultWrap").html(starResultWrapText);
			}
		}
	})
}

//별점 수정
function updateStarRating() {
	
	console.log('수정');
	
	$("#starInsertWrap").show();
	$("#starResultWrap").hide();
}


//차트
function starAvg() {
	
	$.ajax({
		type : 'get'
		, url : '/mobo/movie/starRatingAvg'
		, data : {'key' : '${movie.key }'}
		, dataType : 'json'
		, success : function(data) {
			
			for(var i=0; i<data.length; i++) {
				if(data[i].age == 10) {
					$("#avg0").val(data[i].avg);
				}
				if(data[i].age == 20) {
					$("#avg1").val(data[i].avg);
				}
				if(data[i].age == 30) {
					$("#avg2").val(data[i].avg);
				}
				if(data[i].age == 40) {
					$("#avg3").val(data[i].avg);
				}
				if(data[i].age == 50) {
					$("#avg4").val(data[i].avg);
				}
			}
			
			$("#chart").html("");
			
			var html = "";
			
			html += "<canvas id='myChart1'></canvas>"
			
			$("#chart").html(html);
			
			
			var ctx = document.getElementById('myChart1').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['10대', '20대', '30대', '40대', '50대'],
			        datasets: [{
			            data: [$("#avg0").val(), $("#avg1").val(), $("#avg2").val(), $("#avg3").val(), $("#avg4").val()],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
//			                 'rgba(255, 159, 64, 0.2)',
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
//			                 'rgba(255, 159, 64, 1)',
			            ], 
			            borderWidth: 1
			        }]
			    },
			    options: {
			        plugins: {
			            legend: {
			              display : false
			            }
			    	},
				    scales: {
			            y: {
			                beginAtZero: true,
			                max: 5
			            }
				    }
			    }
			});
		}
	})
}

function manageBookMark() {
	
	var userno = $("#hiddenUserno").val();
	var key = $("#hiddenKey").val();
	
	$.ajax({
		type : 'get'
		,url : '/mobo/movie/bookmark'
		,data : {'userno' : userno
				, 'key' : key}
		,dataType : 'json'
		,success : function(data) {
			
			if(data) {
				$("#bookmarkBtn").html("북마크 취소");
			} else {
				$("#bookmarkBtn").html("북마크");
			}
		}
	})
}

function starAvgOfSingle() {
	
	var key = $("#hiddenKey").val();
	
	$.ajax({
		type : 'get'
		,url : '/mobo/movie/starAvgOfSingle'
		,data : {'key' : key }
		,dataType : 'json'
		,success : function(data) {
			
			console.log(data);
			
			$("#thisStarAvg").html("");
			
			if(data != null) {
				$("#thisStarAvg").html(data);
			} else {
				$("#thisStarAvg").html("0");
			}
			
		}
	})
}



</script>






<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />

