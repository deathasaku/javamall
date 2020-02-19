package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.CartItem;

public interface ShopCartService {

	// boolean saveByUserIdAndProductId(Integer user,Integer productId,Integer
	// BuyNumber);
	public boolean saveByUserIdAndProductId(Integer userId, Integer productId, Integer BuyNumber);

	boolean deleteByUserIdAndProductskuId(Integer userId, Integer productId);

	boolean updateBuyNumber(Integer user, Integer productId, Integer buyNumber);

	List<CartItem> findByUserId(Integer id);

	boolean savaAll(List<CartItem> list);

	List<CartItem> checkout(Integer userId);

	void deleteByUserAndId(Integer userId, Integer cartItemId);

	void updateBuyNumber(Integer cartItemId, Integer buyNumber);

	void deleteByUserId(Integer userId);

	List<CartItem> mergeCartSku(List<CartItem> cartItems);

}
