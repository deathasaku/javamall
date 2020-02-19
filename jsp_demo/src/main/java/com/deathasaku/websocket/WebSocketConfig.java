package com.deathasaku.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Component("webSocketConfig")
@EnableWebSocket
@EnableWebMvc
public class WebSocketConfig implements WebSocketConfigurer {

	// 注入處理器
	@Autowired
	private ChatWebSocketHandler webSocketHandler;
	@Autowired
	private ChatHandshakeInterceptor chatHandshakeInterceptor;

	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// 添加一個處理器還有定義處理器的處理路徑
		registry.addHandler(webSocketHandler, "/ws").addInterceptors(chatHandshakeInterceptor);
		/*
		 * 在這裡我們用到.withSockJS()，SockJS是spring用來處理瀏覽器對websocket的兼容性，
		 * 目前瀏覽器支持websocket還不是很好，特別是IE11以下.
		 * SockJS能根據瀏覽器能否支持websocket來提供三種方式用於websocket請求， 三種方式分別是 WebSocket, HTTP
		 * Streaming以及 HTTP Long Polling
		 */
		registry.addHandler(webSocketHandler, "/ws/sockjs").addInterceptors(chatHandshakeInterceptor).withSockJS();
	}

}