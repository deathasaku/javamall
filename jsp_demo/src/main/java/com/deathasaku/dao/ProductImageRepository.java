package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage, Integer> {
	// Long deleteByIdIn(List<ProductImage> id);
}
