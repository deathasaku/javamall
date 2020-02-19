package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

	long deleteByIdIn(Integer id[]);

	@Query(value = "select * from Review where review_product=:id", nativeQuery = true)
	List<Review> findAllByreviewProduct(@Param("id") Integer id);

	List<Review> findByIdIn(Integer[] id);
	
	boolean existsById(Integer id);
	@Modifying
	@Query(value = "delete FROM Review where id=:id", nativeQuery = true)
	void deleteById(@Param("id") Integer id);
}
