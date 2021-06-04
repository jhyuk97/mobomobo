<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="bg-light">
	<div class="container pb-5">
		<div class="row">
		
			<!-- 이미지 슬라이드 -->
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
				<c:choose>
					<c:when test="${id eq market.id }">
						<button>수정</button>
						<a href="/mobo/market/delete?mNo=${market.mNo }"><button>삭제</button></a>
					</c:when>
					<c:otherwise>
						<button>채팅</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>


<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>