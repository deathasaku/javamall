package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.deathasaku.entity.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {

	List<Message> findByFromUserAndToUserAndToAll(Integer fromUser, Integer toUser, Boolean bo);

	List<Message> findByToAllAndToUser(Boolean bo, Integer toUser);

	List<Message> findByToAllAndToUserOrderByCreateDateDesc(Boolean bo, Integer toUser);

	List<Message> findByToAllAndToUserOrderByCreateDateAsc(Boolean bo, Integer toUser);

	Long countByToUserAndToAll(Integer id, Boolean bo);

	Long countByToUserAndToAllAndStatus(Integer id, Boolean bo, Boolean bo2);

	// 暫時沒用了 留存
	@Query("select max(m.createDate) from Message m group by m.fromUser")
	List<Message> selectList();

	List<Message> findByToUserAndToAll(Integer id, Boolean bo);

	List<Message> findByFromUserAndToAll(Integer id, Boolean bo);

	Long countByToUserAndStatus(Integer id, Boolean bo);
}
