package com.deathasaku.service;

import com.deathasaku.entity.UserResetPassword;

public interface UserResetPasswordService {
	// 查詢
		UserResetPassword getOne(Integer id);

		// 產生
		void save(UserResetPassword userresetPassword, String email,String url);

		// 刪除
		void deleteByUserEmail(String email);

		String resetPwd(String encryPwd);
}
