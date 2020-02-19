package com.deathasaku.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.deathasaku.entity.Employee;
import com.deathasaku.service.EmployeeService;

//這邊大概要去SPRINGXML設定一下 先不管
class EmployeeRealm extends AuthorizingRealm {

	@Autowired
	EmployeeService employeeService;

	@Override // 授權
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override // 驗證身分
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		CustomToken customToken = (CustomToken) token;

		System.out.println("user->" + customToken.getUsername());
		// 先驗證帳號存不存在
		Employee employee = employeeService.login(customToken.getUsername(), String.valueOf(customToken.getPassword()));
		// 強行開搞 驗證通通放在這

		System.out.println("emp->" + employee);
		if (null != employee && employee.getVerify() != null && employee.getVerify() == false) {
			System.out.println("此帳號尚未通過審核");
			throw new UnknownAccountException("msg:此帳號尚未通過審核");
		}

		if (employee != null && employee.getBlock() != null && employee.getBlock() == true) {
			throw new UnknownAccountException("msg:此帳號已被封鎖");
		}
//		else if (customToken.isRecaptcha() == false) {
//			throw new UnknownAccountException("驗證碼錯誤");
//		}
		// 先不看驗證碼

		AuthenticationInfo authinfo;
		if (employee != null && employee.getBlock() != null && employee.getBlock() == false) {
			authinfo = new SimpleAuthenticationInfo(employee.getAccount(), employee.getPassword(), this.getName());

			return authinfo;
		}

		return null;
	}

}
