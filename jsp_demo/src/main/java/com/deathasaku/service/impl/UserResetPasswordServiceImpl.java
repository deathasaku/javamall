package com.deathasaku.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.service.UserResetPasswordService;
import com.deathasaku.service.UserService;
import com.deathasaku.util.sendmail;
import com.deathasaku.dao.UserResetPasswordRepository;
import com.deathasaku.entity.User;
import com.deathasaku.entity.UserResetPassword;

@Service
@Transactional
public class UserResetPasswordServiceImpl implements UserResetPasswordService {

	@Autowired
	private UserResetPasswordRepository userresetPasswordRepository;
	@Autowired
	private UserService userService;
	
	@Override
	public UserResetPassword getOne(Integer id) {
		return userresetPasswordRepository.getOne(id);
	}

	@Override
	public void save(UserResetPassword userresetPassword, String email,String url) {
		System.out.println("AAAAAAAAAA");
		userresetPasswordRepository.deleteByUserEmail(email);
		System.out.println("tttttttttttttttttttttttttt");
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		userresetPassword.setEncryPwd(id);
		userresetPassword.setCreateDate(new Date());
		userresetPassword.setUser(userService.getByEmail(email));
		userresetPasswordRepository.save(userresetPassword);
		// 寄信 送出指定URL
		sendmail.sendPwd(null, email, null, url+"/store/userresetpwd/" + id, null);
		
	}

	@Override
	public void deleteByUserEmail(String email) {
		userresetPasswordRepository.deleteByUserEmail(email);
		
	}

	@Override
	public String resetPwd(String encryPwd) {
		UserResetPassword userresetPassword = userresetPasswordRepository.findByencryPwd(encryPwd);
		// 刪掉重置資料
		try {
			userresetPasswordRepository.deleteByUserEmail(userresetPassword.getUser().getEmail());
			String newpwd = userresetPassword.getEncryPwd().substring(0, 7);
			User user = userresetPassword.getUser();
			user.setPassword(newpwd);
			userService.save(user);
			return newpwd;
		} catch (Exception e) {
			return "false";
		}
	}

}
