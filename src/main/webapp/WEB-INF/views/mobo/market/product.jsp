<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.right{
  text-align:right;
}

.center{
  text-align:center;
}

.bubbly-button {
  font-family: "Helvetica", "Arial", sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 20px; 
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

.rembutton{
  border-radius: 5px;
  padding: 10px 15px;
  font-size: 22px;
  text-decoration: none;
  margin: 20px;
  color: #fff;
  position: relative;
  display: inline-block;
  outline: 0;
  border: 0;
  float: right;

}


.rembutton:focus {
   outline: none;
}

.rembutton:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}

.purple {
  background-color: #b3b7ef;
  box-shadow: 0px 5px 0px 0px #dddff8;
}

.purple:hover {
  background-color: #dddff8;
}

</style>


<section class="bg-light">
	<div class="container pb-5">
		<div class="row">
		
			<!-- 이미지 슬라이드 -->
			<c:if test="${Img.size() } > 0">
			<div class="col-lg-5 mt-5">
			
				<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
					<ol class="carousel-indicators">
						<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
						<c:forEach items="${Img }" var="i" begin="1" varStatus="stat">
							<li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="${stat.index }"></li>
						</c:forEach>
					</ol>
				        <div class="carousel-inner">
							
							<div class="carousel-item active">
								<div class="container">
									<div class="row p-5">
										<div class="mx-auto col-md-8 col-lg-6 order-lg-last"> 
											<img style="width:100%;" class="card-img img-fluid" src="/emp/${Img.get(0).getStoredImg() }" alt="Card image cap" id="product-detail">
										</div>
									</div>
								</div>
							</div>
							
							<c:forEach var="img" items="${Img }" begin="1">
					            <div class="carousel-item">
					                <div class="container">
					                    <div class="row p-5">
					                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
					                            <img class="card-img img-fluid" src="/emp/${img.getStoredImg() }" alt="Card image cap" id="product-detail">
					                        </div>
					                    </div>
					                </div>
					            </div>
							</c:forEach>
				
						</div>
						
				        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
				            <i class="fas fa-chevron-left"></i>
				        </a>
				        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
				            <i class="fas fa-chevron-right"></i>
				        </a>
				</div>
			</div>
			
			</c:if>
			
			<!-- 판매 정보 -->
			<div class="col-lg-7 mt-5">
				<div class="card" style="height:100%;">
				<div class="card-body">
					<span>${market.nick }</span>
					<p>지역</p><hr>
					<h2>${market.mTitle }</h2>
					<span>${market.mCate }</span> <span><fmt:formatDate value="${market.mDate }" pattern="yy-MM-dd" /></span>
					<p>${market.mPrice }\</p>
					<p>${market.mContent }</p>
				</div>
				</div>
			</div>
			
			<div class="buttons">
				<div class="center">
    				<button id="bookmark" class="rembutton">북마크</button><br>
    			</div>
    			<div class="right">  
				<c:choose>
					<c:when test="${id eq market.id }">
						<a href="/mobo/market/update?mNo=${market.mNo }"><button class="bubbly-button">수정</button></a>
						<a href="/mobo/market/delete?mNo=${market.mNo }"><button>삭제</button></a>
					</c:when>
					<c:otherwise>
						<button id="openChat">채팅</button>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</section>


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
		
	$(document).ready(function(){
		
		$("#openChat").click(function(){
			var url="/mobo/market/chat?mNo=${market.mNo}";
			var name='${market.mTitle}';
			var option="width=50, height=50, location=no, menubar=no, resizable=no";
			window.open(url,name,option);
		})
		
		
		if(${bookmark}){
			$("#bookmark").css({background:"#dab7ea"});
		}
		
		$("#bookmark").click(function(){
			if(${login ne true}){
				alert('로그인 후 해주세요!!');
			}else{
				$.ajax({
					url: '/mobo/market/bookmark',
					data: {key: ${market.mNo}, category:"product", userno: ${userno}},
					type: 'POST',
					dataType: 'json',
					success: function(res){
						console.log(res);
						
						console.log(res.check);
						
						if(res.check){
							$("#bookmark").css({background:"#c2b0f2"});
						}else{
							$("#bookmark").css({background:"#dab7ea"});
						}
						
					}
				})
			}
		});
	})

		
</script>


<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>