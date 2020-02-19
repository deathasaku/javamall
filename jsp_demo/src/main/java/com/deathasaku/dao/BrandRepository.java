package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Brand;

public interface BrandRepository extends JpaRepository<Brand, Integer> {

	Long deleteByIdIn(Integer id[]);
}
