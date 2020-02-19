package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Product;

public interface GoodsRepository extends JpaRepository<Product, Integer> {

}
