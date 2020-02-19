package com.deathasaku.service;

import com.deathasaku.entity.Payment;

public interface PaymentService {
	Payment getOne(Integer id);

	void save(Payment paymemt);

}
