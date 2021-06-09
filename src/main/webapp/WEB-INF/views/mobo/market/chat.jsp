<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"/mobo/market/chatroom"
		,data:{"roomid": '${room.roomid}', "mTitle":'${market.mTitle}'}
		,dataType:"html"
		,type:"GET"
		,success:function(res){
			$("#chatLine").html(res);
		}
	});
})


function readLog(roomid, mTitle){
	$("#chatLine").html('');	
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
	box-sizing: border-box;
}

</style>    
<div>
	<div class="roomLine">
		<div>
			<table id="roomtable" border="1">
				<tr><th>채팅방</th></tr>
			<c:forEach var="list" items="${roomlist }">
				<tr><td onclick="readLog('${list.roomid}', '${list.mTitle }')">${list.mTitle }:${list.suNick }</td></tr>
			</c:forEach>
			</table>
		</div>
	</div>
	
	<div id="chatLine" class="chatLine">
		
	</div>


</div>