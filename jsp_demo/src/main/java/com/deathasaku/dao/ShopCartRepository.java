package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.CartItem;

public interface ShopCartRepository extends JpaRepository<CartItem, Integer> {
	@Modifying
	@Query(value = "delete FROM CartItem where cart_user=:cart_user AND id=:id", nativeQuery = true)
	void deleteByUserAndId(@Param("cart_user") Integer userId, @Param("id") Integer cartItemId);

	boolean deleteByUserIdAndProductskuId(Integer userId, Integer productId);

	@Modifying
	@Query(value = "update CartItem SET BuyNumber=:BuyNumber where id=:id", nativeQuery = true)
	void updateBuyNumber(@Param("id") Integer cartItemId, @Param("BuyNumber") Integer buyNumber);

	@Modifying
	@Query(value = "update CartItem SET BuyNumber=:BuyNumber where cart_user=:cart_user and cart_productsku=:cart_productsku", nativeQuery = true)
	boolean updateBuyNumber(@Param("cart_user") Integer userId, @Param("cart_productsku") Integer productId,
			@Param("BuyNumber") Integer buyNumber);

	List<CartItem> findByUserId(Integer id);

	@Query(value = "select * from CartItem  where cart_user=:cart_user", nativeQuery = true)
	List<CartItem> checkout(@Param("cart_user") Integer userId);

	@Modifying
	@Query(value = "delete FROM CartItem where cart_user=:cart_user", nativeQuery = true)
	void deleteByUserId(@Param("cart_user") Integer userId);
}
