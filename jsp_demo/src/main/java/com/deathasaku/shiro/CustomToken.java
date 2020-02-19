package com.deathasaku.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

//自訂TOKEN 多LOGINTYPE 用來區別user and employee 不用再改
public class CustomToken extends UsernamePasswordToken {
	private static final long serialVersionUID = -2728216974896922057L;

	private String loginType;
	private boolean recaptcha;

	public CustomToken() {
	}

	public CustomToken(final String username, final String password, final String loginType) {
		super(username, password);
		this.loginType = loginType;
	}

	public boolean isRecaptcha() {
		return recaptcha;
	}

	public void setRecaptcha(boolean recaptcha) {
		this.recaptcha = recaptcha;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public CustomToken(String username, char[] password, boolean rememberMe, String host, String loginType) {
		super(username, password, rememberMe, host);
		this.loginType = loginType;
	}

	public CustomToken(String username, char[] password, boolean rememberMe, String host, String loginType,
			Boolean recaptcha) {
		super(username, password, rememberMe, host);
		this.loginType = loginType;
		this.recaptcha = recaptcha;
	}

}
