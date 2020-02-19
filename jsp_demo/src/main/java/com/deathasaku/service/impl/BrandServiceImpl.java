package com.deathasaku.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.BrandRepository;
import com.deathasaku.entity.Brand;
import com.deathasaku.service.BrandService;

@Service
@Transactional
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandRepository brandRepository;

	@Override
	public void modify(Brand brand) {
		brandRepository.save(brand);
	}

	@Override
	public void save(Brand brand) {
		brandRepository.save(brand);
	}

	@Override
	public void delete(Integer[] id) {
		brandRepository.deleteByIdIn(id);

	}

	@Override
	public List<Brand> findAll() {
		return brandRepository.findAll();
	}

	@Override
	public Brand getOne(Integer id) {
		return brandRepository.getOne(id);
	}

}
