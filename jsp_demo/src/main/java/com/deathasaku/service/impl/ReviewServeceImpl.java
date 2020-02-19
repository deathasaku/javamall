package com.deathasaku.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.ProductRepository;
import com.deathasaku.dao.ReviewRepository;
import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.Review;
import com.deathasaku.service.ReviewService;

@Service
@Transactional
public class ReviewServeceImpl implements ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	public void save(Review review, Integer users, Integer products) {
		review.setProduct(productRepository.getOne(products));
		review.setUser(userRepository.getOne(users));
		try {
			reviewRepository.save(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Review> findAll(Integer id) {
		List<Review> list = null;
		try {
			list = reviewRepository.findAllByreviewProduct(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Review> findAll() {
		return reviewRepository.findAll();
	}

	@Override
	public void modifyReview(Integer id, String reply) {
		Review review = reviewRepository.getOne(id);
		review.setReply(reply);
		reviewRepository.save(review);

	}

	@Override
	public void deleteByIdIn(Integer[] id) {

		long deleteCount = reviewRepository.deleteByIdIn(id);
		System.out.println(deleteCount);

	}
	@Override
	public String deleteReview(Integer id) {
		boolean flag = reviewRepository.existsById(id);
		String count;
		if(flag==true) {
			count="刪除成功";
			reviewRepository.deleteById(id);
		}else {
			count="刪除失敗";
		}
		return count;
	}
}
