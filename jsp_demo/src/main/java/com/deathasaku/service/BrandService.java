package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.Brand;

public interface BrandService {
	void modify(Brand brand);

	Brand getOne(Integer id);

	void save(Brand brand);

	void delete(Integer[] id);

	List<Brand> findAll();

}
