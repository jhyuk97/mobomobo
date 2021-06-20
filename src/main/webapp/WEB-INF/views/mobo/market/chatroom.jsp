<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

$(document).ready(function(){
	$("#send").click(function(e){
		btnSend();
		$("#chatHis").scrollTop($("#chatHis")[0].scrollHeight);
	});
	
	$("#message").keydown(function(key){
		if(key.keyCode == 13){
			btnSend();
			$("#chatHis").scrollTop($("#chatHis")[0].scrollHeight);
		}
	});
	
	$("#chatHis").scrollTop($("#chatHis")[0].scrollHeight);
	
})

function btnSend(){
	sendMessage();
	$("#message").val('');
}

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
		console.log('onmessage() 메서드 진입')
		var img = [];
		var imgarr = [];
		if(${uImg.size()} > 1){
		img[1] = '${uImg.get(1).storedName}'
		img[0] = '${uImg.get(0).storedName}'
	
		imgarr[0] = ${uImg.get(0).userNo}
		imgarr[1] = ${uImg.get(1).userNo}
		
		}
		// msg는 메세지 작성자 닉네임, 작성내용을 가지고 있음 
		var data = msg.data;
		var arr = data.split("/");
		
		var sessionId = null;
		var message = null;
		
		var roomid = null;
		var isMe = null;
				
		// 현재 로그인 중인 유저닉네임 
		var cur_session = '${nick}';
		
		//메세지 보낸 유저 닉네임 
		sessionId = arr[0];
		// 메세지 내용 
		message = arr[1];
		//채팅방 번호
		roomid = arr[2];
		//본인 메세지 체크
		if(arr.length > 3){
			isMe = arr[3];
		}
		console.log("메세지 보낸거: "+data);
		console.log(arr);
		
		
		
		
		
		
		
		//같은 채팅방인지 확인
		console.log('방확인시작')
		if(roomid == '${roomid}'){
			console.log('방진입');
			var date = new Date();
			var hours = date.getHours() >= 10 ? date.getHours() : '0'+date.getHours()
			var min = date.getMinutes() >= 10 ? date.getMinutes() : '0'+date.getMinutes()
			var ampm = date.getHours() >= 12 ? '오후' : '오전';
			var time = ampm + " " + hours + ":" + min;
			
			console.log(imgarr);
			
			console.log("사용자번호 확인" + ${userno});
			
			for(var i=0; i<2; i++){
			if(isMe != null && imgarr[i] == ${userno}){
				console.log('메세지 본인 확인');
				
				var str ="<li class='my'><div class='message-data align-right'>";
				if(${not empty uImg.get(i).storedName}){
					str += "<img style='width:30px; border-radius:15px;' src='/emp/"+img[i]+"'/>";
				}else{
					str += "<img style='width:30px; border-radius:15px;' src='/resources/img/basig.png'/>";
				}
				str+="<span class='message-data-name'></span>";
				str+="<span class='message-data-time'> "+ time +"</span>";
				str+="</div>"
				str+="<div class='message other-message float-right'>" + message + "</div></li><br>";
				
				$("#msgCon").append(str);
				$("#chatHis").scrollTop($("#chatHis")[0].scrollHeight);
				
			}else if(isMe == null && imgarr[i] != ${userno}){
				var str ="<li class='other'><div class='message-data'>";
				if(${not empty uImg.get(i).storedName}){
					str += "<img style='width:30px; border-radius:15px;' src='/emp/"+img[i]+"'/>";
				}else{
					str += "<img style='width:30px; border-radius:15px;' src='/resources/img/basig.png'/>";
				}
				str+="<span class='message-data-name'> " + sessionId + " </span>";
				str+="<span class='message-data-time'> "+ time +"</span></div>";
				str+="<div class='message my-message'>" + message + "</div></li><br>";
				
				$("#msgCon").append(str);
				$("#chatHis").scrollTop($("#chatHis")[0].scrollHeight);
				
			}
			
			}
		
		}
	}
	
	function onClose(evt){
		
	}
	
	function onOpen(evt){
		
	}
	
</script>

<div class="chat" style="height:100%;">

<div class="chat-header clearfix">        
        <!-- 게시글 설명위치 -->
        <div class="chat-about">
          <div class="chat-with" style="margin:15px 0">${mTitle }</div>
          <div class="chat-num-messages"></div>
        </div>
</div> <!-- end chat-header -->
 
<div id="chatHis" class="chat-history" style="overflow-y:scroll; height:500px;">
	<ul id="msgCon">
		<c:forEach var="i" items="${log }">
        	<c:forEach var="img" items="${uImg }">
        	<c:if test="${i.sendid eq id && img.userNo eq userno }">
	        	<li class="my">
		        	<div class="message-data align-right">
		        		<c:if test="${not empty img.storedName }">
		    	    	<img style="width:30px; border-radius:15px;" src="/emp/${img.storedName }"/>
		    	    	</c:if>
		    	    	<c:if test="${empty img.storedName }">
		    	    	<img style="width:30px; border-radius:15px;" src="/resources/img/basig.png"/>
		    	    	</c:if>
		     		   	<span class="message-data-name"></span>
		       		 	<span class="message-data-time"><fmt:formatDate value="${i.writeDate }" pattern="a HH:mm"/></span>
		       		</div>
		        	<div class="message other-message float-right">${i.msg }</div>
	        	</li><br>
			</c:if>
			<c:if test="${i.sendid ne id && img.userNo ne userno}">
				<li class="other">
		    	    <div class="message-data">
		    	    	<c:if test="${not empty img.storedName }">
		    	    	<img style="width:30px; border-radius:15px;" src="/emp/${img.storedName }"/>
		    	    	</c:if>
		    	    	<c:if test="${empty img.storedName }">
		    	    	<img style="width:30px; border-radius:15px;" src="/resources/img/basig.png"/>
		    	    	</c:if>
		     		   	<span class="message-data-name">${i.suNick }</span>
		     		   	<span class="message-data-time">작성시간</span>
		        	</div>
		        	<div class="message my-message">${i.msg }</div>
	        	</li><br>
		
			</c:if>
        </c:forEach>
        </c:forEach>
                   
	</ul>
        
</div> <!-- end chat-history -->
      
<div style="text-align:center;" class="chat-message clearfix">
	<textarea style="width:95%;"  name="content" id="message" rows="3"></textarea>
        
	<button style="float:right; margin:15px;" id="send">전송</button>

</div> <!-- end chat-message -->


</div>