<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


    <title>MOBOMOBO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/templatemo.css">
    <link rel="stylesheet" href="/resources/css/custom.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/resources/css/fontawesome.min.css">
    
<!-- 폰트를 넣으려는 부분에 a 태그가 있으면 먹히지 않습니다...a태그가 필수라면 그 안쪽으로 폰트 아이디나 클래스를 설정해 여기다 넣어주세요. 
전체적으로 제가 '잘풀리는오늘' 폰트를 적용해 놔서 이게 공통적으로 적용되는데요. 어떤 부분만 바꾸고 싶을 때는 a 태그 안쪽에 넣어주셔야 합니다.
div 태그 느낌표 뜨는 거...해결 방법 아시면 알려주세염 그냥 있어도 적용은 다 되네염 
각자 게시판에 다른 폰트를 적용하고 싶으시면 꼭 임포트 여기서 해서 그 부분에 아이디나 클래스 정해서 사용하심 적용되실 거예여  -->



<!-- 헤더 푸터 기본 css는 templatemo.css 입니다  -->

<style>


@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Pen+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');

@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Noto Sans KR', sans-serif;;
    src: url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap') format('woff');
    font-weight: normal;
    font-style: normal;
}

p {
	font-size: 20px;
	font-family: 'Jal_Onuel';
}

#p {
		font-size: 20px;
	font-family: 'Noto Sans KR';

}

#title {
	font-size: 40px;
	font-family: 'Jal_Onuel'
}

.h2 {
	font-size: 20px;
	font-family: 'Jal_Onuel';
}


.h1 {
	font-size: 20px;
	font-family: 'Jal_Onuel';

}

.menufont {
	font-size: 13px;
	font-family: 'Jal_Onuel';
}



.footerfont {
	font-size: 9px;
	font-family: 'Jal_Onuel';
}

#market {
	font-size: 20px;
	font-family: 'Jal_Onuel';
}


</style>


</head>

<body>
    
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

           <a href="/mobo/main"> <img src="/resources/img/1.png" ></a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
	
	
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill" id="market" >
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                       <a class="nav-link" href="/mobo/notice/list"><div class="menufont">공지사항</div></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link " id="navbarDropdown"
                             role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><div class="menufont">영화</div></a>
                               <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <a class="dropdown-item" href="/mobo/movie/movierecom"><div class="menufont">영화추천</div></a>
                             <a class="dropdown-item" href="/mobo/movie/moviebestboard"><div class="menufont">영화명장면</div></a>
                             <a class="dropdown-item" href="single-blog.html"><div class="menufont">영화토론</div></a>
                             </div>
                        </li>
                       <li class="nav-item dropdown">
                            <a class="nav-link " href="about.html" id="navbarDropdown"
                             role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><div class="menufont">책</div></a>
                               <div id="menufont" class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <a class="dropdown-item" href="/mobo/book/bookrecom"><div class="menufont">책추천</div></a>
                             <a class="dropdown-item" href="/mobo/book/bookFamous"><div class="menufont">책명대사</div></a>
                             <a class="dropdown-item" href="single-blog.html"><div class="menufont">책토론</div></a>
                             </div>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="/mobo/market"><div class="menufont">중고마켓</div></a>
                        </li>
                        
                    </ul>
                </div>
                </div>
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                <li class="nav-item dropdown">
                <div class="navbar align-self-center d-flex">
                 
                    <a class="nav-link " href="#" id="navbarDropdown"
                             role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><i class="fa fa-fw fa-user text-dark mr-3"></i></a>
                           <div id="menufont" class="dropdown-menu" aria-labelledby="navbarDropdown">  
                           		<c:choose><c:when test="${empty login }">               
                <a class="dropdown-item" href="/mobo/sign/login"><div class="menufont">로그인</div></a>
                             <a class="dropdown-item" href="/mobo/sign/signUp"><div class="menufont">회원가입</div></a>
                					</c:when></c:choose>
                				<c:choose><c:when test="${login }">      
                <a class="dropdown-item" href="/mobo/sign/logout"><div class="menufont">로그아웃</div></a>
                <a class="dropdown-item" href="/admin/main"><div class="menufont">관리자페이지</div></a>
                					</c:when></c:choose>
                </div>
                </div>
                </li>
                </ul>
            </div>

       
    </nav>
    <!-- Close Header 끝 -->