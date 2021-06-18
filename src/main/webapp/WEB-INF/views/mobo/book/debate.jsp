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

   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section">BOOK TALK</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div>
                  <form action="/mobo/book/debate" method="get">
					 <select name="category">
					 	<option value="title">제목</option>
					 	<option value="content">내용</option>
					 </select>
                     <input type="text" name="search"/>
                     <button>검색</button>
                  </form>
               </div>
            
               <div>
                  <table style="text-align: center;" class="table table-responsive-xl">
                    <thead>
                      <tr>
                         <th style="width: 10%; color:#000;">글번호</th>
                   		 <th style="width: 60%; color:#000;">제목</th>
                   		 <th style="width: 10%; color:#000;">작성자</th>
                   		 <th style="width: 10%; color:#000;">작성일</th>
                   		 <th style="width: 10%; color:#000;">조회수</th>
                      </tr>
                    </thead>
                    
                     <tbody>
                <c:forEach items="${list }" var="Debate">
                
                <tr>
                	<td class="notice">${Debate.dNo }</td>
                	<td style="font-size: 6px;"><a href="/mobo/book/debatedetail?dNo=${Debate.dNo }" class="notice">${Debate.dTitle }</a></td>
                	<td class="notice">${Debate.userno }</td>
                	<td class="notice"><fmt:formatDate value="${Debate.dDate }" pattern="yy-MM-dd" /></td>
                	<td class="notice">${Debate.hit }</td>
                </tr>
                 </c:forEach>
                </tbody>
                    
               </table>
           		 </div>
           		 
           		 <br><br>
           		 
	<button id="write" class="btn btn-filled" onclick='location.href="/mobo/book/debatewrite";'>작성</button>
	<button id="hot" class="btn btn-filled" onclick='location.href="/mobo/book/hot";'>HOT</button>
           		 
           		 <br><br>
           		 
     <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><jsp:include page="/WEB-INF/views/mobo/layout/DebatePaging.jsp" /></li>
               
              </ul>
            </div>
          </div>
        </div>
             
            </div>
         </div>
      </div>
   </section>
   
   
<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>
   
  <script src="/resources/board2/js/popper.js"></script>

  <script src="/resources/board2/js/main.js"></script>
