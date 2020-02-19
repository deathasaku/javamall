package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.CartItem;
import com.deathasaku.entity.Order;
import com.deathasaku.entity.Payment;
import com.deathasaku.entity.User;

public interface OrderService {
	List<Order> findAll();

	void deleteByIdIn(Integer id[]);

	void modifyStatus(Integer[] id, Integer status);

	Order getOne(Integer id);

	boolean save(Order order, Integer userId, List<CartItem> cartitems);

	boolean save(Order order, Integer userId, List<CartItem> cartitems, Payment payment);

	List<Order> findByUser(User userId);

	List<Order> findById(Integer id);
}
