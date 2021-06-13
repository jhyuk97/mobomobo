<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script typ="text/javascript">

$(document).ready(function(){
	$("#send").click(function(e){
		sendMessage();
		$("#message").val('');
	});
})


	var sock = new SockJS("http://localhost:8088/mobo/market/chatroom");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	
	function sendMessage(){
		
		
		var message={"roomid":'${roomid}' , "payload":$("#message").val(),
				"mTitle":'${mTitle}'}
		
		var string_msg = JSON.stringify(message);
		
		sock.send(string_msg);
	}
	
	function onMessage(msg){
		console.log(msg.data)
		var data = msg.data;
		var arr = data.split(":");
		
		var sessionId = null;
		var message = null;
				
				
		var cur_session = '${nick}';
		
		sessionId = arr[0];
		message = arr[1];
				
		
		if(sessionId == cur_session){
			var str = "<div style='text-align:right;'>";
			str += "<b>나" + ": " + message + "</b>";
			str += "</div>";
			
			$("#msgCon").append(str);
		}else{
			var str = "<div style='text-align:left;'>";
			str += "<b>" + sessionId + ": " + message + "</b>";
			str += "</div>";
			
			$("#msgCon").append(str);
		}
	}
	
	function onClose(evt){
		
	}
	
	function onOpen(evt){
		
	}
	
</script>

<div id="msgCon" class="chatContainer">
	<c:forEach var="i" items="${log }">
		<c:if test="${i.sendid eq id }">
		<div style="text-align:right">
		<b>나: ${i.msg }</b><br>
		</div>
		</c:if>
		<c:if test="${i.sendid ne id }">
		<div style="text-align:left">
		<b>${i.suNick }: ${i.msg }</b><br>
		</div>
		</c:if>
	</c:forEach>
</div>

<div>
	<input type="text" id="message" name="content"/>
	<button id="send">전송</button>
</div>