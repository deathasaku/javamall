package com.deathasaku.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.User;

//這邊大概要去SPRINGXML設定一下 先不管
class UserRealm extends AuthorizingRealm {

	@Autowired
	UserRepository userRepository;

	@Override // 驗證身分
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override // 授權
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//把TOKEN轉乘我們自定義的TOKEN
		CustomToken customToken = (CustomToken) token;
		
		User user =  userRepository.getByAccountAndPassword(customToken.getUsername(), String.valueOf(customToken.getPassword())) ;//employeeService.login(customToken.getUsername(), String.valueOf(customToken.getPassword()));
		System.out.println("USER 登入測試");
		//返回NULL或拋錯 則登陸失敗
		AuthenticationInfo authinfo;
		if (user != null) {
			authinfo = new SimpleAuthenticationInfo(user.getAccount(), user.getPassword(), this.getName());
			return authinfo;
		}
		return null;
	}

}
