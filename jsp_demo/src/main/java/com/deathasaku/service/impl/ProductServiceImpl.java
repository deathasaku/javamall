package com.deathasaku.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.deathasaku.dao.CategoryRepository;
import com.deathasaku.dao.ProductImageRepository;
import com.deathasaku.dao.ProductRepository;
import com.deathasaku.dao.ProductSkuRepository;
import com.deathasaku.entity.Category;
import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductImage;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.service.ProductService;
import com.deathasaku.util.UploadUtil;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	ProductRepository productRepository;
	ProductSkuRepository productSkuRepository;
	ProductImageRepository productImageRepository;
	CategoryRepository categoryRepository;

	@Autowired
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@Autowired
	public void setProductImageRepository(ProductImageRepository productImageRepository) {
		this.productImageRepository = productImageRepository;
	}

	@Autowired
	public void setCategoryRepository(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	@Autowired
	public void setProductSkuRepository(ProductSkuRepository productSkuRepository) {
		this.productSkuRepository = productSkuRepository;
	}

	@Override
	public void save(Product product, ProductSku productSku) {
		List<ProductSku> list = new ArrayList<>();
		list.add(productSku);
		product.setProductSku(list);
		// 一些預設細節 初始化
		product.setCreateDate(new Date());
		productRepository.save(product);
	}

	@Override
	public void save(Product product, ProductSku productSku, MultipartFile imgs[], MultipartFile img, Integer cg) {
		// 要先去撈PRODUCT 用產品名稱當唯一值
		// 近來的時候都沒有ID
		// 檢查此產品是否已存在
		Product product2 = productRepository.findByProductName(product.getProductName());
		System.out.println(product2);
		if (product2 != null) {
			product2.getProductSku().add(productSku);
			productSku.setProduct(product2);
			productSku.setProductStatus(true);

		} else {
			// 一個新的PRODUCT
			List<ProductSku> list = new ArrayList<>();
			list.add(productSku);
			// 新的產品列表
			product.setProductSku(list);
			Category category = categoryRepository.getOne(cg);
			product.setCategory(category);
			product.setCreateDate(new Date());
			productSku.setProduct(product);
			productSku.setProductStatus(true);
			List<ProductImage> imagelist = new ArrayList<ProductImage>();
			product.setProductImage(imagelist);

		}
		System.out.println("沒問題");
		// 先刪除所有舊的圖片
		// 靠ㄅ喔 這邊不用寫 新增的商品衣錠沒有圖片

		// 如果有圖 全部更新
		if (!img.isEmpty()) {
			List<ProductImage> list = null;
			if (product2 != null) {
				if (product2.getProductImage() != null) {
					System.out.println("進入IMAGE刪除->" + product2.getProductImage());
					// 雖然這裡刪除 但是 PRODUCT2 裡面的LIST 還是沒清掉 又存 所以她當這次不存在
					// productImageRepository.deleteAll(product2.getProductImage()); //
					// 這個會去查看CASCADE 因為沒寫CASCADE所以沒辦法處理
					// category
					productImageRepository.deleteInBatch(product2.getProductImage());// 這等於delete from producetimage
																						// where id = ?1 or
																						// id=?2........
					productImageRepository.flush();
				}
				list = new ArrayList<ProductImage>();
				product2.setProductImage(list);

			} else {
				list = product.getProductImage();
			}
			ProductImage image = new ProductImage();
			image.setSrc(UploadUtil.upload(img));
			image.setFirstPic(true);
			image.setProduct(product2 != null ? product2 : product);
			list.add(image);

			for (int i = 0; i < imgs.length; i++) {
				ProductImage productImage = new ProductImage();
				productImage.setSrc(UploadUtil.upload(imgs[i]));
				productImage.setFirstPic(false);
				productImage.setProduct(product2 != null ? product2 : product);
				list.add(productImage);
				// productImageRepository.save(productImage);
			}

		}

		productRepository.save(product2 != null ? product2 : product);
		// 一些預設細節 初始化

	}


	@Override
	public Page<Product> findCategoryIdLevelOnePage(Integer pageint, Integer categoryId) {
		List<Integer> test = categoryRepository.findByParentIdIn(categoryId);
		Page<Product> page = productRepository.findByCategoryIdIn(PageRequest.of(pageint, 9), test);
		return page;
	}
	

	@Override
	public void edit(Product product, ProductSku productSku, MultipartFile[] imgs, MultipartFile img, Integer cg) {

		ProductSku productSku2 = productSkuRepository.getOne(productSku.getId());
		Product product2 = productSku2.getProduct();
		product2.setDescription(product.getDescription());
		product2.setProductIntro(product.getProductIntro());
		//product2.setProductName(product.getProductName());

		productSku2.setOriginalPrice(productSku.getOriginalPrice());
		productSku2.setSellingPrice(productSku.getSellingPrice());
		productSku2.setStockNum(productSku.getStockNum());

		productSkuRepository.save(productSku2);
		productRepository.save(product2);
		productRepository.flush();
		// 先刪除所有舊的圖片
		// 靠ㄅ喔 這邊不用寫 新增的商品衣錠沒有圖片

		if (!img.isEmpty()) {
			if (product2.getProductImage() != null) {
				productImageRepository.deleteInBatch(product2.getProductImage());
				productImageRepository.flush();
				// FLUSH 以後被清掉了?
			}

			ProductImage image = new ProductImage();
			image.setSrc(UploadUtil.upload(img));
			image.setFirstPic(true);
			image.setProduct(product2);
			productImageRepository.save(image);
		}

		for (int i = 0; i < imgs.length; i++) {
			if (i == 0 && imgs[0].isEmpty()) {
				break;
			}

			ProductImage productImage = new ProductImage();
			productImage.setSrc(UploadUtil.upload(imgs[i]));
			productImage.setFirstPic(false);
			productImage.setProduct(product2);
			productImageRepository.save(productImage);
		}

	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product findOne(Integer id) {
		Product product = null;

		try {
			// product = productRepository.findById(id).get();
			product = productRepository.findByProductSkuProductStatusTrueAndId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public Page<Product> findAllPage(Integer pageint) {
		PageRequest pageable = PageRequest.of(pageint, 9);
//		Page<Product> page = productRepository.findAll(pageable);
		Page<Product> page = productRepository.findDistinctIdByProductSkuProductStatusTrue(pageable);
		return page;
	}

	@Override
	public Page<Product> findKeyWordPage(Integer pageint, String searchContent) {
//		searchContent = '%'+ searchContent +'%';
		PageRequest pageable = PageRequest.of(pageint, 9);
//		Page<Product> page = productRepository.findBydescriptionLike(pageable, searchContent);
		Page<Product> page = productRepository.searchAll(pageable, searchContent);
		
		System.out.println("page->"+page.getContent());
		return page;
	}

	@Override
	public Page<Product> findAllPageBybrand(Integer pageint, Integer brand) {
		PageRequest pageable = PageRequest.of(pageint, 9);
		Page<Product> page = productRepository.findByBrand(pageable, brand);
		return page;
	}

	@Override
	public Page<Product> findCategoryIdPage(Integer pageint, Integer categoryId) {
		PageRequest pageable = PageRequest.of(pageint, 9);
		Page<Product> page = productRepository.findByCategoryId(pageable, categoryId);
//		Page<Product> page = productRepository.findByCategoryId(pageable, categoryRepository.getOne(categoryId));
//		Page<Product> page = productRepository.findByBrandandCategoryId(pageable, brand, categoryId);
//		Page<Product> page = null;
//		if(categoryId != null) {
//		page = productRepository.findByBrandandCategoryId(pageable, brand, categoryId);
//		}else {
//		page = productRepository.findByBrand(pageable, brand);
//		}
		return page;
	}

	@Override
	public Page<Product> findPrice(Integer pageint, Integer max, Integer min) {

		PageRequest pageable = PageRequest.of(pageint, 9);
//		 Page<Product> page =productRepository.findByProductSkuOriginalPriceBetween(pageable, max, min);
//		Page<Product> page = productRepository.findDistinctIdByProductSkuOriginalPriceBetween(pageable, max, min);
		Page<Product> page = productRepository
				.findDistinctIdByProductSkuProductStatusTrueAndProductSkuOriginalPriceBetween(pageable, max, min);
		return page;
	}

	@Override
	public List<Product> findCategoryId(Integer categoryId) {
		List<Product> pr = null;
		try {
			pr = productRepository.findByCategoryId(categoryId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pr;
	}

	@Override
	public Page<Product> findAllPageSort(Integer pageint, Integer sort) {
		Page<Product> page = null;
		List<Integer> list=null;
		String idstr;
		switch (sort) {
		case 1:
			Sort s = Sort.by(Sort.Direction.DESC, "id");
			page = productRepository.findDistinctIdByProductSkuProductStatusTrue(PageRequest.of(pageint, 9, s));
			break;
		case 2:
			list=	productRepository.findprice();
			idstr = "," + list.stream().map(Object::toString).collect(Collectors.joining(",")) + ",";
//			idstr = list.stream().map(Object::toString).collect(Collectors.joining(",",",",",")) ;
			page = productRepository.itemsIn(list,idstr, PageRequest.of(pageint, 9));
			break;
		case 3:
			list = productRepository.findpriceAsc();
			idstr= "," + list.stream().map(Object::toString).collect(Collectors.joining(",")) + ",";
			page = productRepository.itemsIn(list, idstr, PageRequest.of(pageint, 9));
			break;
		}
		return page;
	}

	@Override
	public List<Product> findDiscountPrice() {
		List<Product> list = productRepository.findByProductSkuSellingPriceBetweenOrderByProductSkuSellingPrice(0, 95);
		return list;
	}

}
