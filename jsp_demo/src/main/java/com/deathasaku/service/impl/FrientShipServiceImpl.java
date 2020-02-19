package com.deathasaku.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.EmployeeRepository;
import com.deathasaku.dao.FriendShipRepository;
import com.deathasaku.entity.Employee;
import com.deathasaku.entity.FriendShip;
import com.deathasaku.service.FriendShipService;

@Service
@Transactional
public class FrientShipServiceImpl implements FriendShipService {
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	FriendShipRepository friendShipRepository;

	@Override
	public void addFriendShip(Employee employee, Integer id) {
		Employee frient_employee = employeeRepository.getOne(id);
		if (employee.getFriends() == null) {
			employee.setFriends(new ArrayList<FriendShip>());
		}

		for (FriendShip iterable_element : employee.getFriends()) {
			System.out.println("test->" + iterable_element.getUserId());
			if (iterable_element.getFriendId().getId() == id) {
				return;
			}
		}
		FriendShip friendShip = new FriendShip();

		friendShip.setFriendId(frient_employee);
		friendShip.setUserId(employee);
		friendShipRepository.save(friendShip);
	}

}
