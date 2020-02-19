package com.deathasaku.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.deathasaku.entity.Employee;

public interface EmployeeService {

	boolean save(Employee employee);

	void update(Employee employee);

	void updatepwd(Employee employee);

	void register(Employee employee) throws Exception;

	Employee login(String account, String password);

	List<Employee> findAll();

	Employee getByAccount(String account);

	Employee getOne(Integer id);

	Page<Employee> findAllPage(Integer page, Integer size);

	Page<Employee> findByUsernamePage(String username, Integer page, Integer size);

	Boolean changeStatus(Integer[] id, Boolean bo);

	Boolean verifyStatus(Integer[] id, Boolean bo);

}
