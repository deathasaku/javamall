package com.deathasaku.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.EmployeeRepository;
import com.deathasaku.dao.MessageRepository;
import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Message;
import com.deathasaku.service.MessageService;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageRepository messageRepository;
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public List<Message> findUserMessages(Integer fromUser, Integer toUser) {
		List<Message> list = messageRepository.findByFromUserAndToUserAndToAll(fromUser, toUser, false);
		List<Message> list2 = messageRepository.findByFromUserAndToUserAndToAll(toUser, fromUser, false);
		// 修改LIST2 的STATUS 對方發給我的 全部以獨
		for (Message message : list2) {

			message.setStatus(true);

		}
		// 全部都已讀
		messageRepository.saveAll(list2);

		list.addAll(list2);

		// 照日期排序
		Collections.sort(list, new Comparator<Message>() {
			public int compare(Message arg0, Message arg1) {
				return arg0.getCreateDate().compareTo(arg1.getCreateDate());
			}
		});

		return list;

	}

	@Override
	public Map<Employee, List<Message>> showList(Integer fromUser) {
		// 先找出1發出的
		// 再找出發給1的
		// 然後個別合併
		// 再用時間排序
		// select m from message m where id=1 用OR一起撈反而不好處理 分開撈更簡單
		// select m from message m where m.toUser=1
		// if m.touser = a.id list.add()
		// ==兩邊都要先篩選 先留一條?
		// FROM跟TO看起來還是要改成EMPLOYEE比較好只是MESSAGE轉換GSON要自己寫了
		// 這邊也要
		List<Message> list1 = messageRepository.findByFromUserAndToAll(fromUser, false);
		List<Message> list2 = messageRepository.findByToUserAndToAll(fromUser, false);
		list1.addAll(list2);
		// 照日期排序
		Collections.sort(list1, new Comparator<Message>() {
			public int compare(Message arg0, Message arg1) {
				return arg1.getCreateDate().compareTo(arg0.getCreateDate());
			}
		});
		// 照日期排序 影響MAP的順序

		// 先排序 再放MAP 這樣創MAP的時候會照順序
		// 想到了 直接分組就好
		// 知道 我是誰
		Map<String, List<Message>> map = new LinkedHashMap<String, List<Message>>();

		for (Message message : list1) {
			// 利用fromUser 來區分
			// 我跟別人對話 MAP KEY 是別人
			// 如果是我發給別人
			if (message.getFromUser() == fromUser) {
				if (map.get(String.valueOf(message.getToUser())) == null) {
					map.put(String.valueOf(message.getToUser()), new ArrayList<Message>());
				}
				map.get(String.valueOf(message.getToUser())).add(message);
			} else {

				// 別人發給我 gettouser==fromuser
				if (map.get(String.valueOf(message.getFromUser())) == null) {
					map.put(String.valueOf(message.getFromUser()), new ArrayList<Message>());
				}
				map.get(String.valueOf(message.getFromUser())).add(message);

			}

		}

//		for (Message message : list2) {
//			if (map.get(String.valueOf(message.getFromUser())) == null) {
//				map.put(String.valueOf(message.getFromUser()), new ArrayList<Message>());
//			}
//			map.get(String.valueOf(message.getFromUser())).add(message);
//		}

		// 不夠正規
		// 正解還是去寫GSON MESSAGE類 裡面寫好EMPLOYEE的單向關係
		Map<Employee, List<Message>> map2 = new LinkedHashMap<Employee, List<Message>>();
		for (String str : map.keySet()) {
			// 避免 其他人發來的順序 與 自己愈他人對話的順序沒有 排序
			// 最好的做法應該是資料庫先篩一遍才對
			// 指撈最新的 合併後在一次處裡?
//			Collections.sort(map.get(str), new Comparator<Message>() {
//				public int compare(Message arg0, Message arg1) {
//					return arg1.getCreateDate().compareTo(arg0.getCreateDate());
//				}
//			});

			map2.put(employeeRepository.getOne(Integer.valueOf(str)), map.get(str));
		}

		// 現在不確定 這樣到底有沒有去做排序?LIST 我是相信有排啦 但是 MAP就不好說了 如
		// 比較難去做一個分組
		return map2;
	}

	@Override
	public Map<Employee, List<Message>> serachList(Integer fromUser, String username) {
		// 先找出1發出的
		// 再找出發給1的
		// 然後個別合併
		// 再用時間排序
		// select m from message m where id=1 用OR一起撈反而不好處理 分開撈更簡單
		// select m from message m where m.toUser=1
		// if m.touser = a.id list.add()
		// ==兩邊都要先篩選 先留一條?
		// FROM跟TO看起來還是要改成EMPLOYEE比較好只是MESSAGE轉換GSON要自己寫了
		// 這邊要改
		List<Message> list1 = messageRepository.findByFromUserAndToAll(fromUser, false);
		List<Message> list2 = messageRepository.findByToUserAndToAll(fromUser, false);
		list1.addAll(list2);
		// 目標 先進行排序 在MAP PUT的時候就可以照順序建立
		// 照日期排序
		Collections.sort(list1, new Comparator<Message>() {
			public int compare(Message arg0, Message arg1) {
				return arg1.getCreateDate().compareTo(arg0.getCreateDate());
			}
		});
		// 照日期排序 影響MAP的順序
//		Collections.sort(list2, new Comparator<Message>() {
//			public int compare(Message arg0, Message arg1) {
//				return arg1.getCreateDate().compareTo(arg0.getCreateDate());
//			}
//		});

		// 先排序 再放MAP 這樣創MAP的時候會照順序
		// 想到了 直接分組就好
		// 知道 我是誰
		Map<String, List<Message>> map = new LinkedHashMap<String, List<Message>>();

		// 這樣就可以照順序建立 MAP
		for (Message message : list1) {
			// 利用fromUser 來區分
			// 我跟別人對話 MAP KEY 是別人
			// 如果是我發給別人
			if (message.getFromUser() == fromUser) {
				if (map.get(String.valueOf(message.getToUser())) == null) {
					map.put(String.valueOf(message.getToUser()), new ArrayList<Message>());
				}
				map.get(String.valueOf(message.getToUser())).add(message);
			} else {

				// 別人發給我 gettouser==fromuser
				if (map.get(String.valueOf(message.getFromUser())) == null) {
					map.put(String.valueOf(message.getFromUser()), new ArrayList<Message>());
				}
				map.get(String.valueOf(message.getFromUser())).add(message);

			}

		}

//		for (Message message : list2) {
//			if (map.get(String.valueOf(message.getFromUser())) == null) {
//				map.put(String.valueOf(message.getFromUser()), new ArrayList<Message>());
//			}
//			map.get(String.valueOf(message.getFromUser())).add(message);
//		}

		// 不夠正規
		// 正解還是去寫GSON MESSAGE類 裡面寫好EMPLOYEE的單向關係
		Map<Employee, List<Message>> map2 = new LinkedHashMap<Employee, List<Message>>();
		for (String str : map.keySet()) {
			// 避免 其他人發來的順序 與 自己愈他人對話的順序沒有 排序
			// 最好的做法應該是資料庫先篩一遍才對
			// 指撈最新的 合併後在一次處裡?
//			Collections.sort(map.get(str), new Comparator<Message>() {
//				public int compare(Message arg0, Message arg1) {
//					return arg1.getCreateDate().compareTo(arg0.getCreateDate());
//				}
//			});
			// 置入EMPLOYESS
			map2.put(employeeRepository.getOne(Integer.valueOf(str)), map.get(str));
		}

		Iterator<Entry<Employee, List<Message>>> it = map2.entrySet().iterator();
		while (it.hasNext()) {
			Entry<Employee, List<Message>> me = it.next();
			if (!me.getKey().getUsername().contains(username))
				it.remove(); // avoids a ConcurrentModificationException
		}

		// 現在不確定 這樣到底有沒有去做排序?LIST 我是相信有排啦 但是 MAP就不好說了 如
		// 比較難去做一個分組
		return map2;
	}

	@Override
	public Integer unread(Integer id) {

		return Integer.valueOf(String.valueOf(messageRepository.countByToUserAndToAllAndStatus(id, false, false)));
	}

	@Override
	public Integer unread2(Integer id) {

		return Integer.valueOf(String.valueOf(messageRepository.countByToUserAndToAllAndStatus(id, true, false)));
	}

	@Override
	public List<Message> announcement(Integer fromUser, Integer toUser) {
		return messageRepository.findByToAllAndToUserOrderByCreateDateDesc(true, fromUser);
	}

	@Override
	public List<Message> announcementAsc(Integer fromUser, Integer toUser) {
		return messageRepository.findByToAllAndToUserOrderByCreateDateAsc(true, toUser);
	}

	@Override
	public String read_announcement(Integer id) {
		List<Message> list = messageRepository.findByToAllAndToUser(true, id);
		for (Message message : list) {
			message.setStatus(true);
			messageRepository.save(message);
		}

		return "ok";
	}

}
