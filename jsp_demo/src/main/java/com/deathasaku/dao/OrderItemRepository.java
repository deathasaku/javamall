package com.deathasaku.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.Category;
import com.deathasaku.entity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	@Query(value="select * from orderItem where orderitem_order =:orderitem_order",nativeQuery = true)
	List<OrderItem> findByOrder(@Param("orderitem_order") Integer orderId);
	List<OrderItem> findByOrderId(Integer id);

	@Query(value = "SELECT TOP 3 orderitem_productsku,sum(buyNumber) as buy FROM OrderItem group by orderitem_productsku order by buy desc", nativeQuery = true)
//	@Query(value="SELECT orderitem_product,sum(buyNumber) as buy FROM OrderItem group by orderitem_product order by buy desc limit 3",nativeQuery = true)
	List<Object[]> findHotProduct();

	// 返回某大類訂單
	List<OrderItem> findByProductskuProductCategoryInAndOrderCreateDateBetween(List<Category> list, Date strat,
			Date end);

	List<OrderItem> findByProductskuProductCategoryIdIn(List<Integer> id);

	List<OrderItem> findByProductskuProductCategoryIn(List<Category> categories);

	List<OrderItem> findByOrderIdIn(Integer[] id);
}
