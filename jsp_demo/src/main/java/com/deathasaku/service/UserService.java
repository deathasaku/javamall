package com.deathasaku.service;

import java.util.Date;
import java.util.List;

import com.deathasaku.entity.User;

public interface UserService {

	User getByAccount(String account);

	User getByAccountAndPassword(String account, String password);
//	Boolean save(User user);
//	User login(String account, String password);

	User getByEmail(String email);

	User getByEmailAndPassword(String email, String password);

	Boolean save(User user);

	User login(String email, String password);

	List<User> findAll();

	User showUser(String account, String email, String tel);

	User finduser(String email);

	void editMember(String email, String name, String password, String tel, String image, String address);

	User getOne(int id);

	User update(User user);

	User saveOpenId(String userId, String name, String email, Date birthdate);

	Boolean changeBlock(Integer userId, Boolean block);

	// ------------------------
//	User getByAccount(String account);
//	User getByAccountAndPassword(String account, String password);
	void deleteById(int id);
//	User getOne(int id);
//	boolean save(User user);
//	User update(User user);

}
