<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>




<title>Login V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/img/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/sign/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/sign/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/sign/css/main.css">
<!--===============================================================================================-->

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<style type="text/css">

body {
	margin: 0px;
	pading: 0px;
	font-family: sans-serif;
}

.box {
	width: 300px;
	padding: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #fff;
	text-align: center;
}

.box h1, .box label {
	color : #EA9A56;
	text-transform: uppercase;
	font-weight: 500px;
}

.box input[type = "text"], .box input[type = "password"] {
	border : 0;
	background : none;
	display : block;
	margin: 20px auto;
	text-align: center;
	border : 2px solid #FFC091;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	border-radius: 24px;
	transition: 0.25s;
}

.box input[type = "text"]:focus, .box input[type = "password"]:focus {
	width: 280px;
	border-color: #A48654;
}

.box input[type = "submit"] {
	border : 0;
	background : none;
	margin: 40px auto;
	text-align: center;
	border : 2px solid #FFC091;
	padding: 14px 40px;
	outline: none;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
}

 .box input[type = "button"] {
 	border : 0;
	background : none;
	margin: 40px auto;
	text-align: center;
	border : 2px solid #EA9A56;
	padding: 14px 40px;
	outline: none;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
 } 
 
.box input[type = "submit"]:hover {background: #FFC091;}

.box input[type = "button"]:hover {background: #EA9A56;}
 
#loginspan {color : red;}
 
.link {color : #A48654; text-decoration: none; font-size: small;}
.link:link {color : #A48654; text-decoration: none;}
.link:visited {color : #A48654; text-decoration: none;}
.link:hover {color : #A48654; text-decoration: none;}
.link:active {color : #A48654; text-decoration: none;}
.stick {color : #A48654;}

</style>

</head>
<body>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="/mobo/signin/login" method="post">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
<!-- 						<i class="zmdi zmdi-font"></i> -->
							<a href="/mobo/main"> <img src="/resources/img/1.png" style="width: 250px;" ></a>
					</span>

					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="id" id="id">
						<span class="focus-input100" data-placeholder="id"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pw" id="pw">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit">
								Login
							</button>
						</div>
<!-- 						<span class="stick">│</span>  -->
						<a href="/mobo/signin/findid" class="link">아이디	찾기</a> 
						<span class="stick">│</span> 
						<a href="/mobo/signin/findpw"class="link">비밀번호 찾기</a>
					</div>
					
					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="/mobo/signup/form">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/sign/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/sign/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/sign/js/main.js"></script>



</body>
</html>