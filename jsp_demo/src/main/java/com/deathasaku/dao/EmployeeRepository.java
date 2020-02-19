package com.deathasaku.dao;

import java.util.Collection;
import java.util.List;

import javax.persistence.Id;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	public Employee getByAccountAndPassword(String account, String password);

	public Employee getByAccount(String account);

	public List<Employee> findByIdNotIn(Collection<Id> ids);

	Page<Employee> findByUsernameContaining(Pageable pageable, String username);

	List<Employee> findByIdIn(Integer[] ids);

//	public List<Employee> findByIdNotIn(Pageable pageable, Collection<Id> ids);
//
//	public List<Employee> findByIdIn(Pageable pageable, Collection<Id> ids);

}
