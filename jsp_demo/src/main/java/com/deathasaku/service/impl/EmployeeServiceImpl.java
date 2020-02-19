package com.deathasaku.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.EmployeeRepository;
import com.deathasaku.dao.FriendShipRepository;
import com.deathasaku.entity.Employee;
import com.deathasaku.service.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	EmployeeRepository employeeRepository;
	FriendShipRepository friendShipRepository;

	public EmployeeRepository getEmployeeDao() {
		return employeeRepository;
	}

	@Autowired
	public void setEmployeeDao(EmployeeRepository employeeRepository) {
		this.employeeRepository = employeeRepository;
	}

	@Autowired
	public void setFriendShipRepository(FriendShipRepository friendShipRepository) {
		this.friendShipRepository = friendShipRepository;
	}

	@Override
	public boolean save(Employee employee) {
		if (employeeRepository.getByAccount(employee.getAccount()) != null)
			return false;

		employee.setBlock(false);// true 是被鎖 FASLE 是沒鎖
		employee.setVerify(true);// true 是審核通過 如果是自己建立的就不用再審核
		employee.setCreateDate(new Date());
		// throw new Exception("帳號已存在");
		try {
			employeeRepository.save(employee);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return true;
	}

	@Override
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}

	@Override
	public Employee login(String account, String password) {

		Employee employee = null;
		try {
			employee = employeeRepository.getByAccountAndPassword(account, password);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new RuntimeException();
		}
		return employee;

	}

	@Override
	public void update(Employee employee) {
		Employee em = employeeRepository.getOne(employee.getId());
		em.setImage(employee.getImage());
		em.setPassword(employee.getPassword());
		em.setTel(employee.getTel());
		em.setType(employee.getType());
		em.setUsername(employee.getUsername());
//		em.setVerify(em.getVerify());
//		em.setBlock(em.getBlock());
	
		employeeRepository.save(em);
	}

	@Override
	public void updatepwd(Employee employee) {
		employeeRepository.save(employee);
	}

	@Override
	public Employee getByAccount(String account) {

		return employeeRepository.getByAccount(account);
	}

	@Override
	public Employee getOne(Integer id) {
		return employeeRepository.getOne(id);
	}

	@Override
	public Page<Employee> findAllPage(Integer page, Integer size) {
		PageRequest pageable = PageRequest.of(page - 1, size);

		return employeeRepository.findAll(pageable);
	}

	@Override
	public Page<Employee> findByUsernamePage(String username, Integer page, Integer size) {

		return employeeRepository.findByUsernameContaining(PageRequest.of(page - 1, size), username);
	}

	@Override
	public Boolean changeStatus(Integer[] id, Boolean bo) {
		List<Employee> employee = employeeRepository.findByIdIn(id);
		for (Employee employee2 : employee) {
			employee2.setBlock(bo);
		}
		employeeRepository.saveAll(employee);
		return true;
	}

	@Override
	public Boolean verifyStatus(Integer[] id, Boolean bo) {
		List<Employee> employee = employeeRepository.findByIdIn(id);
		for (Employee employee2 : employee) {
			employee2.setVerify(bo);
		}
		employeeRepository.saveAll(employee);
		return true;
	}

	@Override
	public void register(Employee employee) throws Exception {
		if (employeeRepository.getByAccount(employee.getAccount()) != null)
			throw new Exception("此帳號已存在");

		employee.setBlock(false);// true 是被鎖 FASLE 是沒鎖
		employee.setVerify(false);// 需要審核
		employee.setCreateDate(new Date());
		// throw new Exception("帳號已存在");
		try {
			employeeRepository.save(employee);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("註冊失敗");
		}

	}

}
