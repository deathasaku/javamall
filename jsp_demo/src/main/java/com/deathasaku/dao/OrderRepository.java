package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Order;
import com.deathasaku.entity.User;

public interface OrderRepository extends JpaRepository<Order, Integer> {

	Long deleteByIdIn(Integer id[]);

	List<Order> findByIdIn(Integer[] id);

	List<Order> findByUser(User userId);

	List<Order> findByUserId(Integer userId);
}
