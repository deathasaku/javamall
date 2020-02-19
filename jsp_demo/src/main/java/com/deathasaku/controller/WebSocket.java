package com.deathasaku.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Message;
import com.deathasaku.service.MessageService;
import com.deathasaku.websocket.ChatWebSocketHandler;

@Controller
@RequestMapping("/admin/chat")
public class WebSocket {

	@Autowired
	private ChatWebSocketHandler chatWebSocketHandler;
	@Autowired
	private MessageService messageService;

	// 跳轉到聊天室頁面
	@RequestMapping("/addgoods")
	public String mainpage(HttpServletRequest request) {
		// 判斷，如果沒有session，則跳到登錄頁面
		HttpSession session = request.getSession();

		return "/admin/chat/addgoods";
	}

	@RequestMapping("/addgoods2")
	public String mainpage2(HttpServletRequest request) {
		// 判斷，如果沒有session，則跳到登錄頁面
		HttpSession session = request.getSession();

		return "/admin/chat/addgoods2";
	}

	@RequestMapping({ "/addgoods3" })
	public String mainpage3(HttpServletRequest request, Model model) {
		// 判斷，如果沒有session，則跳到登錄頁面
		HttpSession session = request.getSession();
		model.addAttribute("msglist", messageService.findUserMessages(1, 2));
		model.addAttribute("mapmsg", messageService.showList(1));
		return "/admin/chat/addgoods3";
	}

	@ResponseBody
	@RequestMapping("/sendMsg")
	public String sendMag(String content, String toUserName) {
		Employee user = new Employee();
		Message message = new Message();
//
//		try {
//			//chatWebSocketHandler.sendMessageToUser(String.valueOf(message.getToUser()),
//					//new TextMessage(GsonUtils.toJson(message)));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		return "200";

	}

}
