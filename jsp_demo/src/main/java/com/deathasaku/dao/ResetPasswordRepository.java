package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.ResetPassword;

public interface ResetPasswordRepository extends JpaRepository<ResetPassword, Integer> {
	Long deleteByEmployeeAccount(String account);

	ResetPassword findByencryPwd(String pwd);

}
