package mobomobo.util.chat;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


import mobomobo.dao.face.MarketDao;
import mobomobo.dto.ChatLog;

public class ChatHandler extends TextWebSocketHandler {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	@Autowired
	MarketDao marketDao;
	
	private HashMap<String, Chat> sessions = new HashMap<String, Chat>();
	
	private HashMap<String, WebSocketSession> sessionList = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		
		//iterator에 현재 보관중인 id들 저장
		Iterator<String> iter = sessionList.keySet().iterator();

		int count = 0;
		
		while(iter.hasNext()) {
			//현재 로그인한 계정을 소켓서버에서 저장중일경우 count++
			if(iter.next().equals(session.getAttributes().get("userid"))) {
				count++;
			}
		}
		
		//현재 로그인계정이 소켓서버에 저장되어있지않으면 hashmap에 추가 key는 로그인한 id값 value는 session
		if(count == 0)
			sessionList.put(session.getAttributes().get("id").toString(), session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		JSONParser parser = new JSONParser();
		
		//현재 로그인중인 계정 아이디
		String userid = session.getAttributes().get("id").toString();
		
		//세션에 저장된 채팅방번호를 json형식으로 불러옴	payload는 메세지 내용, mTitle은 판매글제목, roomid는 채팅방id 
		JSONObject jsonObj = (JSONObject) parser.parse(message.getPayload());
		
		
		String roomid = jsonObj.get("roomid").toString();
		
		//판매자 아이디
		String suid = roomid.substring(roomid.indexOf("su:")+3, roomid.indexOf("bu"));
		
		//구매희망자 아이디
		String buid = roomid.substring(roomid.indexOf("bu:")+3);
		
		logger.info(buid);
		
		//로그인한 유저가 구매희망자일경우 
		if(!suid.equals(userid)) {
			//판매자가 채팅방에 들어와있을경우
			if(sessionList.get(suid) != null) {
				//판매자 세션이 살아있을경우 메세지만 보내기
				sessionList.get(suid).sendMessage(new TextMessage(
					session.getAttributes().get("nick") + "/" + jsonObj.get("payload").toString()
					+ "/" + roomid));
				
				insertMsg(jsonObj, session);
			}else {//판매자 세션이 만료됐을 경우 나한테 메세지 띄우고 디비 저장
				insertMsg(jsonObj, session);
				
				return;
			}
		}else {//로그인한 유저가 판매자일경우
			//구매희망자가 채팅방에 들어와있을경우
			if(sessionList.get(buid) != null) {
				//판매자 세션이 살아있을경우 메세지만 보내기
				sessionList.get(buid).sendMessage(new TextMessage(
					session.getAttributes().get("nick") + "/" + jsonObj.get("payload").toString()
					+ "/" + roomid));
				
				insertMsg(jsonObj, session);
				
			}else {//구매희망자 세션이 만료됐을 경우 나한테 메세지 띄우고 디비 저장
				insertMsg(jsonObj, session);
				
				return;
			}
		}
		
		
		

		
	}
	
	//메세지 보내는 함수
	public void insertMsg(JSONObject json, WebSocketSession session) {
		logger.info("핸들러 입니다핸들러 입니다핸들러 입니다핸들러 입니다핸들러 입니다");
		//json에는 메세지내용, 판매글제목, 채팅방id가 저장되어있음
		String roomid = json.get("roomid").toString();
		
		//판매자 id
		String suid = roomid.substring(roomid.indexOf("su:")+3, roomid.indexOf("bu"));
		
		//구매 희망자 id
		String buid = roomid.substring(roomid.indexOf("bu:")+3);
		
		//현재 메세지 보낸유저 아이디
		String userid = session.getAttributes().get("id").toString();
		
		
		//메세지 디비에 저장
		ChatLog msg = new ChatLog();
		msg.setSuid(suid);//파는유저 id
		msg.setRoomid(roomid);//채팅방번호
		msg.setMsg(json.get("payload").toString());//보내는 메세지내용
		msg.setmTitle(json.get("mTitle").toString());//판매글제목
		msg.setSendid(userid);//메세지 보낸사람 아이디
		msg.setBuid(buid);//구매희망자 아이디
		
		
		marketDao.InsertChat(msg);
		
		try {
			//내화면에 내가 보낸 메세지 보내기 '닉네임:보낸내용'
			session.sendMessage(new TextMessage(
					session.getAttributes().get("nick") + "/" + json.get("payload").toString()
					+ "/" + roomid + "/me"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		logger.info("세션이 삭제됐습니다");
		
		logger.info("세션 삭제전 사이즈 : {}",sessionList.size());
		
		sessionList.remove(session.getAttributes().get("id"));
		
		
		logger.info("세션 삭제후 사이즈 : {}",sessionList.size());
		
	}
	
}
