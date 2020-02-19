package com.deathasaku.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.deathasaku.entity.Employee;

@Component
public class ChatHandshakeInterceptor implements HandshakeInterceptor {

	/**
	 * 握手之前，若返回false，則不建立鏈接
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			// 如果用戶已經登錄，允許聊天
			if (session.getAttribute("admin") != null) {
				// 獲取登錄的用戶
				Employee loginUser = (Employee) session.getAttribute("admin");

				// 將用戶放入socket處理器的會話(WebSocketSession)中
				attributes.put("admin", loginUser);
				System.out.println(
						"Websocket:用戶[ID:" + (loginUser.getId() + ",Name:" + loginUser.getUsername() + "]要建立連接"));
			} else {
				// 用戶沒有登錄，拒絕聊天
				// 握手失敗！
				System.out.println("--------------握手已失敗...");
				return false;
			}
		}
		System.out.println("--------------握手開始...");
		return true;
	}

	/**
	 * 握手之後
	 */
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		System.out.println("--------------握手成功啦...");
	}

}