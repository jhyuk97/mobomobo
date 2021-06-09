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
		
		
		//전체 사용자 세션 리스트에 저장
		Iterator<String> iter = sessionList.keySet().iterator();

		int count = 0;
		
		while(iter.hasNext()) {
			logger.info("");
			if(iter.next().equals(session.getAttributes().get("userid"))) {
				count++;
			}
		}
		
		if(count == 0)
			sessionList.put(session.getAttributes().get("id").toString(), session);
		
		logger.info("세션갯수 : {}",sessionList.size());
			//사용자id,세션으로 등록함
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		JSONParser parser = new JSONParser();
		
		String userid = session.getAttributes().get("id").toString();
		
		//세션에 저장된 채팅방번호를 json형식으로 불러옴	
		JSONObject jsonObj = (JSONObject) parser.parse(message.getPayload());
		
		logger.info("{}",jsonObj.get("payload"));
		
		logger.info("{}",jsonObj);
		
		String roomid = jsonObj.get("roomid").toString();
		
		//채팅방번호에서 판매자 번호를 추려내기위한 split
		String suid = roomid.substring(roomid.indexOf("su:")+3, roomid.indexOf("bu"));
		String buid = roomid.substring(roomid.indexOf("bu:")+3);
		
		logger.info(buid);
		
		//전체 사용자 세션중에서 판매자 세션으로 메시지 보내기
		if(!suid.equals(userid)) {
			if(sessionList.get(suid) != null) {
				logger.info("{}",sessionList.get(suid));
				logger.info("세션만료안됨");
				//판매자 세션이 살아있을경우 메세지만 보내기
				sessionList.get(suid).sendMessage(new TextMessage(
					session.getAttributes().get("nick") + ":" + jsonObj.get("payload").toString()));
				
				insertMsg(jsonObj, session);
			}else {//판매자 세션이 만료됐을 경우 나한테 메세지 띄우고 디비 저장
				insertMsg(jsonObj, session);
				
				return;
			}
		}else {
			if(sessionList.get(buid) != null) {
				logger.info("{}",sessionList.get(buid));
				logger.info("세션만료안됨???");
				//판매자 세션이 살아있을경우 메세지만 보내기
				sessionList.get(buid).sendMessage(new TextMessage(
					session.getAttributes().get("nick") + ":" + jsonObj.get("payload").toString()));
				
				insertMsg(jsonObj, session);
			}else {//판매자 세션이 만료됐을 경우 나한테 메세지 띄우고 디비 저장
				insertMsg(jsonObj, session);
				
				return;
			}
		}
		
		
		

		
	}
	
	public void insertMsg(JSONObject json, WebSocketSession session) {
		try {
			session.sendMessage(new TextMessage(
					session.getAttributes().get("nick") + ":" + json.get("payload").toString()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String roomid = json.get("roomid").toString();
		
		//채팅방번호에서 판매자 번호를 추려내기위한 split
		String suid = roomid.substring(roomid.indexOf("su:")+3, roomid.indexOf("bu"));
		String buid = roomid.substring(roomid.indexOf("bu:")+3);
		String userid = session.getAttributes().get("id").toString();
		
		//메세지 디비에 저장
		ChatLog msg = new ChatLog();
		msg.setSuid(suid);//파는유저 id
		msg.setRoomid(roomid);//채팅방번호
		msg.setMsg(json.get("payload").toString());//보내는 메세지내용
		msg.setmTitle(json.get("mTitle").toString());//판매글제목
		msg.setSendid(userid);//보낸사람 아이디
		msg.setBuid(buid);
		
		
		marketDao.InsertChat(msg);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		logger.info("세션이 삭제됐습니다");
		
		sessionList.remove(session);
		
	}
	
}
