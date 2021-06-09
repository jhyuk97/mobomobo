package mobomobo.util.chat;

import java.util.LinkedHashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRooms {

	private Map<String, Chat> chatRoom = new LinkedHashMap<>();
	
	public Chat findRoomById(String roomId) {
		
		return chatRoom.get(roomId);
	}
	
	public Chat createChat(String roomId) {
		Chat room  = Chat.create(roomId);
		chatRoom.put(room.getRoomid(), room);
		
		return room;
	}
	
	
}
