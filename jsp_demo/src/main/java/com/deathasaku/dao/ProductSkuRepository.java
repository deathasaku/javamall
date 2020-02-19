package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.deathasaku.entity.ProductSku;

public interface ProductSkuRepository extends JpaRepository<ProductSku, Integer> {

	List<ProductSku> findByIdIn(Integer id[]);

	List<ProductSku> findBySellingPriceBetweenOrderBySellingPrice(int min, int max);

	@Query(value = "select  sku_spu from productSku  where productStatus = 1 group by sku_spu order by Min(originalPrice) Desc", nativeQuery = true)
	List<Integer> findPrice();
}
