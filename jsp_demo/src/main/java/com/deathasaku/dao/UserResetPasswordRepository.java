package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.UserResetPassword;

public interface UserResetPasswordRepository extends  JpaRepository<UserResetPassword, Integer>{
	Long deleteByUserEmail(String email);

	UserResetPassword findByencryPwd(String pwd);

}
