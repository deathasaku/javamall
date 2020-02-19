package com.deathasaku.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductSku;

public interface ProductService {
	void save(Product product, ProductSku productSku);

	void save(Product product, ProductSku productSku, MultipartFile imgs[], MultipartFile img, Integer cg);

	void edit(Product product, ProductSku productSku, MultipartFile imgs[], MultipartFile img, Integer cg);

	List<Product> findAll();

	Page<Product> findAllPageSort(Integer pageint, Integer sort);

	Page<Product> findAllPage(Integer pageint);

	Page<Product> findAllPageBybrand(Integer pageint, Integer brand);

	Page<Product> findCategoryIdLevelOnePage(Integer pageint, Integer categoryId);

	Page<Product> findKeyWordPage(Integer pageint, String searchContent);

	Page<Product> findCategoryIdPage(Integer pageint, Integer categoryId);

	Page<Product> findPrice(Integer pageint, Integer min, Integer max);

	List<Product> findDiscountPrice();

	List<Product> findCategoryId(Integer categoryId);

	Product findOne(Integer id);

}
