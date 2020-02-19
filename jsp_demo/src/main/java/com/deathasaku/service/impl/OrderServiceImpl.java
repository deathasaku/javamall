package com.deathasaku.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.OrderItemRepository;
import com.deathasaku.dao.OrderRepository;
import com.deathasaku.dao.PaymentRepository;
import com.deathasaku.dao.ProductSkuRepository;
import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.CartItem;
import com.deathasaku.entity.Order;
import com.deathasaku.entity.OrderItem;
import com.deathasaku.entity.Payment;
import com.deathasaku.entity.User;
import com.deathasaku.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderItemRepository orderItemRepository;
	@Autowired
	private PaymentRepository paymentRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ProductSkuRepository productSkuRepository;

	@Override
	public List<Order> findAll() {

		return orderRepository.findAll();
	}

	@Override
	public void deleteByIdIn(Integer[] id) {
		// 要先找到 OREDER底下的ITEM
		// 然後刪除
		// 在山他自己
		// 這邊擊連關西要重寫 算了
//		paymentRepository.deleteInBatch(paymentRepository.findByOrderIdIn(id));
//		orderItemRepository.deleteInBatch(orderItemRepository.findByOrderIdIn(id));
//		orderRepository.deleteInBatch(orderRepository.findByIdIn(id));
	}

	@Override
	public void modifyStatus(Integer[] id, Integer status) {
		List<Order> orders = orderRepository.findByIdIn(id);
		for (Order order : orders) {
			order.setStatus(status);	
		}
		
		orderRepository.saveAll(orders);

	}

	@Override
	public Order getOne(Integer id) {

		return orderRepository.getOne(id);
	}

	@Override
	public boolean save(Order order, Integer userId, List<CartItem> cartitem) {
		User user = userRepository.getOne(userId);
		order.setUser(user);
		order.setCreateDate(new Date());
		order.setStatus(0);
		order.setOrderItems(new ArrayList<OrderItem>());

		for (CartItem carlist : cartitem) {
			OrderItem orderItems = new OrderItem();
			orderItems.setProductsku(carlist.getProductsku());
			orderItems.setUser(user);
			orderItems.setBuyNumber(carlist.getBuyNumber());
			orderItems.setOrder(order);
			order.getOrderItems().add(orderItems);
		}
		orderRepository.save(order);
		return true;
	}

	@Override
	public boolean save(Order order, Integer userId, List<CartItem> cartitem, Payment payment) {
		User user = userRepository.getOne(userId);
		order.setUser(user);
		order.setCreateDate(new Date());
		order.setStatus(0);
		order.setOrderItems(new ArrayList<OrderItem>());

		payment.setOrder(order);
		for (CartItem carlist : cartitem) {
			OrderItem orderItems = new OrderItem();
			orderItems.setProductsku(productSkuRepository.getOne(carlist.getProductsku().getId()));// 把它持久畫附加到SESSION
																									// 不知道有沒有更好的解法
																									// 這會造成多次SELECT
																									// 不想用CASCADE
			orderItems.setUser(user);
			orderItems.setBuyNumber(carlist.getBuyNumber());
			orderItems.setOrder(order);
			order.getOrderItems().add(orderItems);
		}

		orderRepository.save(order);
		paymentRepository.save(payment);
		return true;
	}

	@Override
	public List<Order> findByUser(User userId) {

		return orderRepository.findByUser(userId);
	}

	@Override
	public List<Order> findById(Integer id) {
		// TODO Auto-generated method stub
		return orderRepository.findByUserId(id);
	}

}
