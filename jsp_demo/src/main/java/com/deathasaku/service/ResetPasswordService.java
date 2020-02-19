package com.deathasaku.service;

import com.deathasaku.entity.ResetPassword;

public interface ResetPasswordService {
	// 查詢
	ResetPassword getOne(Integer id);

	// 產生
	void save(ResetPassword resetPassword, String email,String url);

	// 刪除
	void deleteByUserAccount(String email);

	String resetPwd(String encryPwd);
}
