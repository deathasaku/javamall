package com.deathasaku.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.OrderItemRepository;
import com.deathasaku.dao.ProductRepository;
import com.deathasaku.entity.OrderItem;
import com.deathasaku.entity.Product;
import com.deathasaku.service.OrderItemService;

@Service
@Transactional
public class OrderItemServiceIml implements OrderItemService {
	@Autowired
	private OrderItemRepository orderItemRepository;
	@Autowired
	private ProductRepository productRepository;

//	@Override
//	public List<OrderItem> findByOrderId(Integer id) {
//
//		return orderItemRepository.findByOrderId(id);
//	}

	@Override
	public List<Product> findHotProduct() {
		List<Object[]> list = orderItemRepository.findHotProduct();
		List<Product> list2 = new ArrayList<Product>();
		for (Object[] objects : list) {
			list2.add(productRepository.findByProductSkuId((Integer) objects[0]));
		}
		return list2;
	}
	
	@Override
	public List<OrderItem> findByOrderId(Integer orderId) {
		return orderItemRepository.findByOrder(orderId);
	}
}
