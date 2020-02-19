package com.deathasaku.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.deathasaku.dao.EmployeeRepository;
import com.deathasaku.dao.FriendShipRepository;
import com.deathasaku.dao.MessageRepository;
import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Message;
import com.google.gson.Gson;

//這邊有點類似SERVICE曾
//還是要換成 STOMP? 算了 都寫好了
@Component("chatWebSocketHandler")
@Transactional
public class ChatWebSocketHandler implements WebSocketHandler {
	@Autowired
	private MessageRepository messageRepository;
	@Autowired
	private FriendShipRepository friendShipRepository;
	@Autowired
	private EmployeeRepository employeeRepository;

	private static final ArrayList<WebSocketSession> EMPLOYEES;
	// 放DAO
	static {
		// 保存當前連接用戶
		EMPLOYEES = new ArrayList<>();
	}

	/**
	 * webscoket建立好鏈接之後的處理函數--連接建立後的準備工作
	 */
	// 建立連線後 會進行的方法
	@Override
	public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
		System.out.println(webSocketSession.toString());
		// 把用戶放進去

		// 將用戶信息添加到list中
		EMPLOYEES.add(webSocketSession);
		System.out.println("=====================建立連接成功==========================");
		Employee employee = (Employee) webSocketSession.getAttributes().get("admin");
		if (employee != null) {
			System.out.println("當前連接用戶======" + employee.getUsername());
		}
		System.out.println("webSocket連接數量=====" + EMPLOYEES.size());

	}

	@Override
	/**
	 * 客戶端發送服務器的消息時的處理函數，在這裡收到消息之後可以分發消息
	 */
	// 處理消息：當一個新的WebSocket到達的時候，會被調用（在客戶端通過Websocket API發送的消息會經過這裡，然後進行相應的處理）
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> message) throws Exception {
		System.out.println("收到消息" + message.toString());
		Gson gson = new Gson();
		// 轉JSON gson.toJson(message);
		// 轉換失敗的訊息就不處理
		// 通知就好
		// 先來稿前端了
		// 轉換看起來問題不大
		// message id 自動產生
		// from to 用EL
		// 所以只要存就好了
		// 要重寫GSON UTIL==
		System.out.println(message.getPayload().toString());
		try {
			Message msg = gson.fromJson(message.getPayload().toString(), Message.class);
			msg.setCreateDate(new Date());
			msg.setStatus(false);

			// 只要SET日期
			// 前端 傳FROM TO TEXT
			// 這邊其實也可以直接改城公告
			// 但是變成 message 要增加field 來判斷是否為公告 先做城 好友群發功能就好了

			// 群發就是-1好了
			if (msg.getToUser() == null || msg.getToUser() == -1) {
				System.out.println("群發 公告");
				// List<FriendShip> list =
				// friendShipRepository.findByUserIdId(msg.getFromUser());
				List<Employee> list = employeeRepository.findAll();
				for (Employee employee : list) {
					// 跳過自己
//					if (employee.getId() == msg.getFromUser())
//						continue;
					Message msg2 = (Message) msg.clone();
					msg2.setToUser(employee.getId());
					// EntityManager 用這個 CLEAR CACHE 然後 SETID=0 可以強制讓他INSERT
					messageRepository.saveAndFlush(msg2);
					// 問題在這 ORM的問題 不能強制INSERT
				}

				sendMessageToAll(new TextMessage(gson.toJson(msg.getText())));
			} else {
				System.out.println("單發");
				messageRepository.save(msg);
				// 單發
				sendMessageToUser(String.valueOf(msg.getToUser()), String.valueOf(msg.getFromUser()),
						new TextMessage(gson.toJson(msg)));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		// 要不要轉譯? NNNNN 下ㄑ

		// 如果MSG是空的或-1則群發

		// 待寫 應該是一個JSON近來 轉成 MESSAGE 然後 判斷是群發還是指定對象 然後呼叫個別的方法 這邊寫好聊天室跟推送基本完成
	}

	@Override
	/**
	 * 消息傳輸過程中出現的異常處理函數 處理傳輸錯誤：處理由底層WebSocket消息傳輸過程中發生的異常
	 */
	// 異常處理
	public void handleTransportError(WebSocketSession webSocketSession, Throwable exception) throws Exception {
		// 記錄日誌，準備關閉連接
		System.out.println("Websocket異常斷開:" + webSocketSession.getId() + "已經關閉");
		// 一旦發生異常，強制用戶下線，關閉session
		if (webSocketSession.isOpen()) {
			// 關閉session
			try {
				webSocketSession.close();
			} catch (IOException e) {
			}
		}
		// 移除用戶
		EMPLOYEES.remove(webSocketSession);
	}

	@Override
	/**
	 * websocket鏈接關閉的回調 連接關閉後：一般是回收資源等
	 */
	// 連線結束處理
	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
		// 記錄日誌，準備關閉連接
		System.out.println("Websocket正常斷開:" + webSocketSession.getId() + "已經關閉");
		EMPLOYEES.remove(webSocketSession);
		Employee employee = (Employee) webSocketSession.getAttributes().get("admin");
		System.out.println(employee.getUsername() + "斷開連接");

	}

	@Override
	/**
	 * 是否支持處理拆分消息，返回true返回拆分消息
	 */
	// 是否支持部分消息：如果設置為true，那麼一個大的或未知尺寸的消息將會被分割，並會收到多次消息（會通過多次調用方法handleMessage(WebSocketSession,
	// WebSocketMessage). ）
	// 如果分為多條消息，那麼可以通過一個api：org.springframework.web.socket.WebSocketMessage.isLast()
	// 是否是某條消息的最後一部分。
	// 默認一般為false，消息不分割
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 
	 * 說明：給某個人發信息
	 * 
	 * @param id
	 * @param message
	 */
	public void sendMessageToUser(String id, String myid, TextMessage message) throws IOException {
		// 獲取到要接收消息的用戶的session
		// 這邊要注意 要改成 即使對方沒在線上也會保存到資料庫裏面
		// 要想好怎麼改
		// 靠杯 難怪不用ARRAYLIST

		for (WebSocketSession webSocketSession : EMPLOYEES) {
			Employee employee = (Employee) webSocketSession.getAttributes().get("admin");
			// GETID 是拿到INT ID是字串 自己注意
			if (employee.getId().equals(Integer.valueOf(id)) || employee.getId().equals(Integer.valueOf(myid))) {
				try {
					if (webSocketSession.isOpen()) {
						webSocketSession.sendMessage(message);
						System.out.println("发送消息给：" + employee.getId());
					}

				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

	}

	/**
	 * 
	 * 說明：群發信息：給所有在線用戶發送消息
	 */
	public void sendMessageToAll(final TextMessage message) {
		// 這邊基本上只做提醒
		// 先寫到資料庫再說
		for (WebSocketSession webSocketSession : EMPLOYEES) {
			try {
				if (webSocketSession.isOpen()) {
					webSocketSession.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
//推送的話 還是要全部推送吧?
		// 那我們先把資料都寫到資料庫
		// WEBSOCKET叫他去更新好了? 給庫
		// // 對用戶發送的消息內容進行轉義
//
//		// 獲取到所有在線用戶的SocketSession對象
//		Set<Entry<String, WebSocketSession>> entrySet = USER_SOCKETSESSION_MAP.entrySet();
//		for (Entry<String, WebSocketSession> entry : entrySet) {
//			// 某用戶的WebSocketSession
//			final WebSocketSession webSocketSession = entry.getValue();
//			// 判斷連接是否仍然打開的
//			if (webSocketSession.isOpen()) {
//				// 開啟多線程發送消息（效率高）
//				new Thread(new Runnable() {
//					public void run() {
//						try {
//							if (webSocketSession.isOpen()) {
//								webSocketSession.sendMessage(message);
//							}
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//
//				}).start();
//
//			}
//		}
	}

}
