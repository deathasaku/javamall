package com.deathasaku.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.PaymentRepository;
import com.deathasaku.entity.Payment;
import com.deathasaku.service.PaymentService;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentRepository paymentRepository;

	@Override
	public Payment getOne(Integer id) {
		return paymentRepository.getOne(id);
	}

	@Override
	public void save(Payment paymemt) {

		paymentRepository.save(paymemt);

	}

}
