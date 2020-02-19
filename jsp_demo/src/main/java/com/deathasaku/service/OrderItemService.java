package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.OrderItem;
import com.deathasaku.entity.Product;


public interface OrderItemService {
	List<OrderItem> findByOrderId(Integer id);

	List<Product> findHotProduct();

}
