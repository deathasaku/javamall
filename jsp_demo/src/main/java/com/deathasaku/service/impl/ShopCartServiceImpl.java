package com.deathasaku.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.ProductSkuRepository;
import com.deathasaku.dao.ShopCartRepository;
import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.CartItem;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.entity.User;
import com.deathasaku.service.ShopCartService;

@Service
@Transactional
public class ShopCartServiceImpl implements ShopCartService {
	@Autowired
	private ShopCartRepository shopCartRepository;
	@Autowired
	private ProductSkuRepository productSkuRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	public boolean saveByUserIdAndProductId(Integer userId, Integer productId, Integer BuyNumber) {
		User user = userRepository.getOne(userId);
		ProductSku productSku = productSkuRepository.getOne(productId);
		CartItem cartitem = new CartItem();
		cartitem.setUser(user);
		cartitem.setProductsku(productSku);
		cartitem.setBuyNumber(BuyNumber);
		try {
			shopCartRepository.save(cartitem);
			return true;
		} catch (Exception e) {
			return false;
			// TODO: handle exception
		}

	}

	@Override
	public void deleteByUserAndId(Integer userId, Integer cartItemId) {
		shopCartRepository.deleteByUserAndId(userId, cartItemId);

	}

	@Override
	public boolean deleteByUserIdAndProductskuId(Integer userId, Integer productId) {
		return shopCartRepository.deleteByUserIdAndProductskuId(userId, productId);

	}

	@Override
	public boolean updateBuyNumber(Integer userId, Integer productId, Integer buyNumber) {

		return shopCartRepository.updateBuyNumber(userId, productId, buyNumber);
	}

	@Override
	public List<CartItem> findByUserId(Integer id) {
		return shopCartRepository.findByUserId(id);
	}

	@Override
	public void updateBuyNumber(Integer cartItemId, Integer buyNumber) {

		shopCartRepository.updateBuyNumber(cartItemId, buyNumber);
	}

	@Override
	public boolean savaAll(List<CartItem> list) {

		shopCartRepository.saveAll(list);
		return true;
	}

	@Override
	public List<CartItem> checkout(Integer userId) {

		List<CartItem> cartall = null;
		cartall = shopCartRepository.checkout(userId);
		return cartall;
	}

	@Override
	public void deleteByUserId(Integer userId) {
		shopCartRepository.deleteByUserId(userId);
	}

	@Override
	public List<CartItem> mergeCartSku(List<CartItem> cartItems) {
		for (CartItem cartItem : cartItems) {
			cartItem.setProductsku(productSkuRepository.getOne(cartItem.getProductsku().getId()));
			// Hibernate.initialize(cartItem.getProductsku());
		}
		return cartItems;
	}
}
