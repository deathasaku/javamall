package com.deathasaku.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.User;
import com.deathasaku.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	private UserRepository userRepository;

	@Autowired
	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public User getByAccount(String account) {
		return userRepository.getByAccount(account);

	}

	@Override
	public User getByAccountAndPassword(String account, String password) {

		return userRepository.getByAccountAndPassword(account, password);
	}
//被重寫的方法
//	@Override
//	public Boolean save(User user) {
//		if(userRepository.getByAccount(user.getAccount())!=null)
//		return false;
//		
//		user.setBlock(true);
//		user.setCreateDate(new Date());
//		try {
//			userRepository.save(user);
//		}catch(Exception e){
//			e.printStackTrace();
//			throw e;
//		}
//		
//		return true;
//	}
//
//	@Override
//	public User login(String account, String password) {
//		User user = null;
//		try {
//			user = userRepository.getByAccountAndPassword(account, password);
//		}catch(Exception e){
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
//		return user;
//	}

	public User getByEmail(String email) {
		return userRepository.getByEmail(email);

	}

	@Override
	public User getByEmailAndPassword(String email, String password) {

		return userRepository.getByEmailAndPassword(email, password);
	}

	@Override
	public Boolean save(User user) {
		if (userRepository.getByEmail(user.getEmail()) != null)
			return false;

		user.setBlock(true);
		user.setCreateDate(new Date());
		try {
			userRepository.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return true;
	}

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			user = userRepository.getByEmailAndPassword(email, password);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return user;
	}

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public User showUser(String account, String email, String tel) {

		return null;
	}

	@Override
	public User finduser(String email) {
		User userone = null;
		try {
			userone = userRepository.findByEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userone;
	}

	@Override
	public void editMember(String email, String name, String password, String tel, String image, String address) {
		User user = userRepository.getByEmail(email);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setTel(tel);
		user.setAddress(address);
		if (image != "/admin/upload/nouse.png") {
			user.setImage(image);
		}

//		userRepository.getByEmail(email);
//		userRepository.editMember(email, name, password, tel, image);
	}

	@Override
	public User getOne(int id) {

		return userRepository.getOne(id);
	}

//	@Override
//	public boolean save(User user) {
//		if (userRepository.getByAccount(user.getAccount()) != null)
//			return false;
//
//		user.setBlock(true);
//		user.setCreateDate(new Date());
//		// throw new Exception("撣唾�歇摮");
//		try {
//			userRepository.save(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		}
//		return true;
//	}		

	@Override
	public User update(User user) {
		return userRepository.save(user);
	}

	@Override
	public User saveOpenId(String userId, String name, String email, Date birthdate) {
		if (userRepository.getByOpenid(userId) != null) {
			return userRepository.getByOpenid(userId);
		}

		else {
			User user = new User();
			user.setEmail(email);
			user.setName(name);
			user.setOpenid(userId);
			user.setBirthdate(birthdate);
			user.setImage("/admin/upload/nouse.png");
			user.setBlock(true);
			user.setCreateDate(new Date());
			try {
				userRepository.save(user);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}

			return user;

		}

	}

	@Override
	public void deleteById(int id) {
		userRepository.deleteById(id);
	}

	public Boolean changeBlock(Integer userId, Boolean block) {
		User user = userRepository.getOne(userId);
		user.setBlock(block);
		userRepository.save(user);
		return true;
	}

}
