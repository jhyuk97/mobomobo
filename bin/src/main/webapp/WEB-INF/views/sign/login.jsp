<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>



<script type="text/javascript">
// Kakao.init('733d53597c1a83a03aa0b68ca9c16d65'); //발급받은 키 중 javascript키를 사용해준다.
// console.log(Kakao.isInitialized()); // sdk초기화여부판단


//   function loginWithKakao() {
//     Kakao.Auth.login({
//       success: function(authObj) {
//         alert(JSON.stringify(authObj))
        
//         var response = JSON.stringify(authObj);
        
//         console.log(authObj);
        
//         console.log(response);
        
//         console.log(authObj.id);
        

        
//         console.log("-------------------");
// //   	  var id = authObj.id;
//   	  var id = response.scope;

// //   	  var email = authObj.kakao_account.email;
// //   	  var nick = authObj.properties.nick;
  	  
//   	  console.log("id", id);
// //   	  console.log("email", email);
// //   	  console.log("nick", nick);
//       },
//       fail: function(err) {
//         alert(JSON.stringify(err))
//       },
//     })
//   }

// function loginWithKakao() {
// kakao.API.request({
//     url: '/v2/user/me',
//     data: {
//         property_keys: ["kakao_account.email","kakao_account.gender"]
//     },
//     success: function(response) {
//         console.log(response);
//     },
//     fail: function(error) {
//         console.log(error);
//     }
// })

// };

//   function kakaoLogout() {
// 	    if (Kakao.Auth.getAccessToken()) {
// 	      Kakao.API.request({
// 	        url: '/v1/user/unlink',
// 	        success: function (response) {
// 	        	console.log(response)
// 	        	console.log("sucsses")
// 	        },
// 	        fail: function (error) {
// 	          console.log(error)
// 	        	console.log("fail..")
// 	        },
// 	      })
// 	      Kakao.Auth.setAccessToken(undefined)
// 	    }
// 	  }  
  
 </script> 

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
				<form class="login100-form validate-form" action="/mobo/sign/login" method="post">
					<span class="login100-form-title p-b-26">
						Welcome
						
<!--   <a id="custom-login-btn" href="javascript:loginWithKakao()"> -->
<!--   <img -->
<!--     src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" -->
<!--     width="222" -->
<!--   /> -->
<!-- </a> -->

<!-- 	<a id="custom-logout-btn" href="javascript:kakaoLogout()">로그아웃</a> -->
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

						<a href="/mobo/sign/findid" class="link">아이디찾기</a> 
						<span class="stick">│</span> 
						<a href="/mobo/sign/findpw"class="link">비밀번호 찾기</a>
					</div>



<!-- 카카오 로그인  -->
<a id="kakao-login-btn"></a>
<!-- <button class="api-btn" onclick="kakaoLogout()">로그아웃</button> --><br>
	<a id="custom-logout-btn" href="javascript:kakaoLogout()">로그아웃</a>
<!-- 카카오 로그인  -->



<!-- 카카오 로그인 script  -->
    <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('733d53597c1a83a03aa0b68ca9c16d65');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
            	

        	    
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(res) {
                    	
                    	var res = JSON.stringify(res);
                    	
                    	$.ajax({
                    		type : "get"
                    		, url : "/mobo/sign/kakaocheck"
                    		, dataType : "json"
                    		, data :{
                    			"res": res
                    		}
                    		, success : function(data){
                    			console.log("성공")

                    			console.log(data)
                    			console.log(data.loginResult)
                    			
                    			if( data.loginResult == true){
                    				
                    				console.log("여기가 들어와 지나요?")
                    				document.location.href ='/mobo/main';
                    				
                    			} else {
                    			
                    				var con_test = confirm("회원가입을 진행하시겠습니까?");
                    				
// 			                    	var user123 = JSON.stringify(data);
			                    	var userInfo = JSON.stringify(data);
// 			                    	var userInfo = JSON.parse(user123);
                    				
                    				console.log("아이디가 없어서 회원가입 진행시 사용하는 값들")
                    				console.log(data)
                    				console.log(userInfo)
                    				console.log(userInfo.kakaoUserInfo)
                    				console.log(userInfo.nick)
                    				console.log(res)
                    				console.log(res.id)
                    				
                    				
                    				console.log("data", data)
                    				console.log("id", data.kakaoUserInfo.id)
                    				
                    				if(con_test == true){
                    					
                    					document.location.href ='/mobo/sign/signUp?id='+data.kakaoUserInfo.id+'&nick='+data.kakaoUserInfo.nick+'&email='+data.kakaoUserInfo.email;
                    					
                    					
//                     					$.ajax({
//                     						type : "get"
//                   	  						, url : "/mobo/sign/kakaoSignUp"
//                     						, dataType : "json"
//                     						, async: false
//                     						, data :{
// 												"kakaoUserInfo" : userInfo
// 											} 											
//                     						, success : function(data){
// 												console.log(" 회원가입 controller 로는 전송 완료 후 값 반환됨")
// 												console.log(data);
// 												console.log(data.nick);
// 												console.log(data.id);
// 												console.log(data.email);
// // 												console.log("----------------");
												
// // 												console.log(userInfo);
// // 												console.log(userInfo.id);
// // 												console.log(userInfo.nick);
// // 												console.log(userInfo.email);


// // 												$(document.body).html(data)
//                     						}
//                     						, error : function(){
//                                 				alert(" ---- error ---- ")
//                     							console.log("회원가입 체크 검사후 다시 돌와와서 error")
//                                 			}	
                    						
//                     					})
                    					
                    					
                    				}
                    				else if(con_test == false){
                    					document.location.href ='/mobo/main';
                    				}
                    			
                    			}
                    			
                    		}
                    		, error : function(){
                    			alert(" ---- error ---- ")
                    			console.log("검사후 다시 돌와와서 error")
                    		}	
                    		
                    	});
                    	
                    	
//                       alert(JSON.stringify(res))
                      console.log(res);
//                       console.log(res.id);
//                       console.log(res.kakao_account.email);
//                       console.log(res.properties.nickname);
                    },
                    fail: function(error) {
                      alert(
                        'login success, but failed to request user information: ' +
                          JSON.stringify(error)
                      )
                    },
                  })
                  
        		    
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
        
        
     function kakaoLogout() {
    	 
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	console.log("sucsses")
	        },
	        fail: function (error) {
	          console.log(error)
	        	console.log("fail..")
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	    
	  } 
    </script>
<!-- 카카오 로그인 script  -->
					
					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="/mobo/sign/signUp">
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