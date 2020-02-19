package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	Product findByProductName(String name);

	Page<Product> findDistinctIdByProductSkuProductStatusTrue(Pageable pageable);

	List<Product> findDistinctIdByProductSkuProductStatusTrue();
	Product findByProductSkuId(Integer id);
	// @Query(value = "select p.id from Product p join p.productSku s where
	// s.productStatus = true group by p.id order by min(s.originalPrice) Desc")
	//@Query(value = "select  p.id from Product as  p INNER JOIN productSku as s  on p.id = s.sku_spu where s.productStatus=1 group by p.id order by min(s.originalPrice) desc;", nativeQuery = true)
	@Query(value = "select  p.id from Product as  p INNER JOIN productSku as s  on p.id = s.sku_spu where s.productStatus=1 group by p.id order by min(s.originalPrice*s.sellingPrice) desc;", nativeQuery = true)
	List<Integer> findprice();

	@Query(value = "select  p.id from Product p join p.productSku s  where s.productStatus = true group by p.id order by min(s.originalPrice*s.sellingPrice) Asc")
	List<Integer> findpriceAsc();
	
	@Query(value = "select p from Product p where p.id in :ids order by CHARINDEX(','+convert(varchar,p.id)+','  , :idStr)")
	Page<Product> itemsIn(@Param("ids") List<Integer> ids, @Param("idStr") String idStr, Pageable pageable);

	@Query(value = "select * from Product  where categoryId in (:categoryIds)", nativeQuery = true)
	Page<Product> findByCategoryIdIn(Pageable pageable, @Param("categoryIds") List<Integer> categoryIds);

	Page<Product> findByIdIn(List<Integer> ids, Pageable pageable);

	Page<Product> findByIdInAndProductSkuProductStatusTrueOrderByProductSkuOriginalPriceDesc(List<Integer> id,
			Pageable pageable);

	Page<Product> findByproductStatusTrue(Pageable pageable);

	@Query(value = "select u from Product u where (u.productName like %:searchContent%  or u.brand.brandName like %:searchContent%  or u.description like %:searchContent% or u.productIntro like %:searchContent% or u.category.name like %:searchContent% )")	
	Page<Product> searchAll(Pageable pageable, @Param("searchContent") String searchContent);

	/*
	 * @Query(value="select DISTINCT id from Product",nativeQuery = true)
	 * Page<Product> findDistinctId(Pageable pageable);
	 */

	List<Product> findByProductSkuSellingPriceBetweenOrderByProductSkuSellingPrice(int min, int max);

	List<Product> findByproductStatusTrueAndProductSkuSellingPriceBetweenOrderByProductSkuSellingPrice(int min,
			int max);

	@Query(value = "select * from Product  where product_brand=:brand", nativeQuery = true)
	Page<Product> findByBrand(Pageable pageable, @Param("brand") Integer brand);

	@Query(value = "select * from Product  where product_brand=:brand and categoryId=:categoryId", nativeQuery = true)
	Page<Product> findByBrandandCategoryId(Pageable pageable, @Param("brand") Integer brand,
			@Param("categoryId") Integer categoryId);

//	Page<Product> findByCategoryId(Pageable pageable,Category categoryId);
	@Query(value = "select * from Product  where categoryId=:categoryId", nativeQuery = true)
	Page<Product> findByCategoryId(Pageable pageable, @Param("categoryId") Integer categoryId);

//	@Query(value="SELECT DISTINCT p.productSku.sku_spu FORM Product p where p.productSku.originalPrice BETWEEN min=:min and max=:max")
	Page<Product> findByProductSkuOriginalPriceBetween(Pageable pageable, @Param("min") int min, @Param("max") int max);

	Page<Product> findDistinctIdByProductSkuOriginalPriceBetween(Pageable pageable, @Param("min") int min,
			@Param("max") int max);

	Page<Product> findDistinctIdByProductSkuProductStatusTrueAndProductSkuOriginalPriceBetween(Pageable pageable,
			@Param("min") int min, @Param("max") int max);

	Page<Product> findBydescriptionLike(Pageable pageable, String description);

	@Query(value = "select * from Product where categoryId=:categoryId", nativeQuery = true)
	List<Product> findByCategoryId(@Param("categoryId") Integer categoryId);

	Product findByProductSkuProductStatusTrueAndId(Integer id);

	@Query(value = "select u.category.id from Product u where  u.category.name like %:searchContent%")
	List<Object> findByLevelOneId(@Param("searchContent") String searchContent);

	List<Product> findByCategoryParentId(Integer parentId);

}
