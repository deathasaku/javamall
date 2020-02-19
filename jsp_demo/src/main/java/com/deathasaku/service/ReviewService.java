package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.Review;

public interface ReviewService {
	List<Review> findAll();

	void modifyReview(Integer id, String reply);

	void deleteByIdIn(Integer[] id);

	void save(Review review, Integer users, Integer products);

	List<Review> findAll(Integer id);
	
	String deleteReview(Integer id);
}
