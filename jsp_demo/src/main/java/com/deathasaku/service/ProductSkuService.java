package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.ProductSku;

public interface ProductSkuService {
	List<ProductSku> findAll();

	List<ProductSku> findAll(int page, int rows);

	void changeStatus(Integer id[], boolean status);

	ProductSku findById(Integer id);

	ProductSku getOne(Integer id);

	List<ProductSku> findDiscountPrice();

}
