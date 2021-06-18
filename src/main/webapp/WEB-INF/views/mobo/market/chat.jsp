<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/mobo/layout/header.jsp" %>

<link rel="stylesheet" href="/resources/css/chat.css">

<script type="text/javascript">
$(document).ready(function(){
	
	console.log('${profile}')
	
	if(${not empty room}){
		readLog('${room.roomid}','${market.mTitle}');
	}
	
})


function readLog(roomid, mTitle, no){
	$("#chatLine").html('');	
	$("li[id^=li]").removeClass("active");
	$("#li"+no).addClass("active");
	$.ajax({
		  url:"/mobo/market/chatroom"
		, data:{"roomid" : roomid, "mTitle": mTitle}
		, dataType:"html"
		, type: "GET"
		, success:function(res){
			$("#chatLine").html(res);
		}
	});
}
</script>

<style type="text/css">

.roomLine{
	width:50%;
	float:left;
	box-sizing: border-box;
}
.chatLine{
	width:50%;
	float:right;
	height:500px;
	box-sizing: border-box;
}
.active{
	background-color: rgba(0,0,0,0.3);
}

</style>    

<div class="container1 clearfix">
    <div class="people-list" id="people-list">
      
      <ul class="list" style="list-style:none;">
      <c:forEach var="list" items="${roomlist }" varStatus="i">
        <li style="padding:5px; border:1px solid #c2b0f2;" class="clearfix" id="li${i.index }" onclick="readLog('${list.roomid}', '${list.mTitle }', ${i.index })">
        <div class="about">
          <img style="height:50px; border-radius:25px; " src="/resources/img/basig.png" alt="avatar" />
            <div class="name" style="color:#fff; float:right;"><p>${list.mTitle }</p>
				<p>${list.suNick }</p>            
            </div>
            <div class="status">
            </div>
          </div>
        </li>
        
        </c:forEach>
        
      </ul>
    </div>
    
    <div id="chatLine" style="height:700px;">
    </div> <!-- end chat -->
    
  </div> <!-- end container -->







<%@include file="/WEB-INF/views/mobo/layout/footer.jsp" %>	