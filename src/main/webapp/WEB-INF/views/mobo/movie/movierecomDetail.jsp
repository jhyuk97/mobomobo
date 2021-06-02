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
	height : 500px;
}

</style>

<div id="movieInfoWrap">

<img src="${movie.image }">

제목 : ${movie.title } <br>
감독 : ${movie.directors } <br>
배우 : ${movie.actors } <br>
상영시간 : ${movie.showTm } <br>
개봉일 : ${movie.openDt } <br>
장르 : ${movie.genres } <br>
개봉국가 : ${movie.nationNm } <br>
관람등급 : ${movie.grades } <br>

<input type="hidden" value="${movie.key }" id="hiddenKey"/>
<input type="hidden" value="${movie.title }" id="hiddenTitle"/>
<input type="hidden" value="${movie.image }" id="hiddenImage"/>
<input type="hidden" value="${sessionScope.userno }" id="hiddenUserno" />

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


</div>

<script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
<script type="text/javascript">

var idx = -1;
$(document).ready(function() {
	
	console.log(${list});
	
	checkStarRating();
	
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
}) 
 
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
			checkStarRating();
			starRatingCount();
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
var ctx = document.getElementById('myChart1').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['10', '20', '30', '40', '50', '기타'],
        datasets: [{
            data: [3, 5, 3, 1, 5, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
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
                beginAtZero: true
            }
	    }
    }
});

</script>






<c:import url="/WEB-INF/views/mobo/layout/footer.jsp" />

