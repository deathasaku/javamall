package com.deathasaku.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.ProductSkuRepository;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.service.ProductSkuService;

@Service
@Transactional
public class ProductSkuServiceImpl implements ProductSkuService {
	ProductSkuRepository productSkuRepository;

	@Autowired
	public void setProductSkuRepository(ProductSkuRepository productSkuRepository) {
		this.productSkuRepository = productSkuRepository;
	}

	@Override
	public ProductSku getOne(Integer id) {
		ProductSku productSku = null;
		try {
			productSku = productSkuRepository.findById(id).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productSku;
	}

	@Override
	public List<ProductSku> findDiscountPrice() {
		List<ProductSku> list = productSkuRepository.findBySellingPriceBetweenOrderBySellingPrice(0, 95);
		return list;
	}

	@Override
	public List<ProductSku> findAll() {
		return productSkuRepository.findAll();
	}

	// 暫時沒用
	@Override
	public List<ProductSku> findAll(int page, int rows) {
		Page<ProductSku> pageResult = productSkuRepository.findAll(PageRequest.of(page, rows));
		pageResult.getNumberOfElements(); // 本頁筆數
		pageResult.getSize(); // 每頁筆數
		pageResult.getTotalElements(); // 全部筆數
		pageResult.getTotalPages(); // 全部頁數
		List<ProductSku> productSkus = pageResult.getContent();
		return productSkus;
	}

	@Override
	public void changeStatus(Integer[] id, boolean status) {
		List<ProductSku> list = productSkuRepository.findByIdIn(id);
		for (ProductSku productSku : list) {
			productSku.setProductStatus(status);
		}
		productSkuRepository.saveAll(list);
	}

	@Override
	public ProductSku findById(Integer id) {
		// TODO Auto-generated method stub
		return productSkuRepository.getOne(id);
	}

}
