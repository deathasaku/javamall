package com.deathasaku.service;

import java.util.List;
import java.util.Map;

import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Message;

public interface MessageService {
	List<Message> findUserMessages(Integer fromUser, Integer toUser);

	List<Message> announcement(Integer fromUser, Integer toUser);

	List<Message> announcementAsc(Integer fromUser, Integer toUser);

	Map<Employee, List<Message>> showList(Integer fromUser);

	Map<Employee, List<Message>> serachList(Integer fromUser, String username);

	Integer unread(Integer id);

	Integer unread2(Integer id);

	String read_announcement(Integer id);

}
