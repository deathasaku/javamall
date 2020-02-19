package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Integer> {
	List<Payment> findByOrderIdIn(Integer[] id);
}
