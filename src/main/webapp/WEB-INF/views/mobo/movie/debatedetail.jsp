<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
   <link rel="stylesheet" href="/resources/board2/css/style.css">
   
   <link rel="stylesheet" href="/resources/board/css/style.css">
   
	<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>
   
<style type="text/css">

.btn {
  padding: 0.66em 2.25em;
  text-decoration: none;
  position: relative;
  display: inline-block;
}
.btn:after {
  content: "";
  display: block;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0.125em;
  left: 0.125em;
  border-bottom: 0.125em solid;
  border-right: 0.125em solid;
}
.btn:active {
  transform: translate(0.125em, 0.125em);
}
.btn:active:after {
  transform: translate(-0.125em, -0.125em);
}

.btn-filled {
  background-color: #ddccf5;
  color: #fff;
  transition: background-color 0.2s ease-out;
}
.btn-filled:after {
  border-color: #ddccf5;
  transition: border-color 0.2s ease-out;
}
.btn-filled:hover {
  background-color: #ddccf5;
}
.btn-filled:hover:after {
  border-color: #ddccf5;
}


#write {
	 float: right;
}

#hot {
	 float: left;
}

</style>

	<h2 class="heading-section">TALK</h2>
	<hr>
	<div>
	
	</div>
	<hr>
	
	<hr>
	<div>
	
	</div>
	<hr>
	
	<button id="write" class="btn btn-filled" onclick='location.href="/mobo/movie/update";'>수정</button>
	<button id="hot" class="btn btn-filled" onclick='location.href="/mobo/movie/delete";'>삭제</button>

	<div class="card-header bg-replay">
           <i class="fa fa-comment fa"></i> 댓글
   </div>
   
   
   <div class="form">
   <div class="card-body bg-replay">
      <ul class="list-group list-group-flush">
          <li class="list-group-item">
         <div class="form-inline mb-2">
            <label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
            <input type="text" class="form-control ml-2" name="id" placeholder="아이디" id="moviebestcommentid" value="${id }" readonly="readonly">
            <input type="text" class="form-control ml-2" name="nick" placeholder="닉네임" id="moviebestcommentnick" value="${nick }" readonly="readonly">
         </div>
         <textarea class="form-control" id="exampleFormControlTextarea1" name="commentText" rows="3"></textarea>
         <button type="button" id="btnmoviebestcomment" class="btn bg-replay mt-3" >댓글 등록</button>
          </li>
      </ul>
   </div>
   </div>

<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>
