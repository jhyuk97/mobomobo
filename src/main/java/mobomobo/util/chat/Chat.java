package mobomobo.util.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Chat {
	
	private String roomid;
	private List<WebSocketSession> sessions = new ArrayList<>();
	
	public static Chat create(String roomId) {
		Chat room = new Chat();
		room.setRoomid(roomId);
		
		return room;
	}
	
	
	public String getRoomid() {
		return roomid;
	}
	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}
	public List<WebSocketSession> getSessions() {
		return sessions;
	}
	public void setSessions(List<WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
}
