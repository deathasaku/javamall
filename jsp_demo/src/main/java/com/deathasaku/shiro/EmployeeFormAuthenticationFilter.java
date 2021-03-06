package com.deathasaku.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.deathasaku.entity.Employee;
import com.deathasaku.service.EmployeeService;

import de.triology.recaptchav2java.ReCaptcha;

//用GET/POST LOGINURL 區分是提交表單還是單純進入LOGIMURL
public class EmployeeFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final String DEFAULT_MESSAGE_PARAM = "admin_login_error";
	private EmployeeService employeeService;
	private String messageParam = DEFAULT_MESSAGE_PARAM;

	@Autowired
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("Cdn-Src-Ip");
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); // 獲取真實ip
		}
		return ip;
	}

	@Override
	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		System.out.println("username->" + username + "|password->" + password);

		boolean recaptcha = new ReCaptcha("6LfQZscUAAAAAFZfe9FJ2cKxy4h604Jf2bKfpOkY")
				.isValid(request.getParameter("g-recaptcha-response"));

		if (password == null) {
			password = "";
		}

		boolean rememberMe = isRememberMe(request);
		String host = getIpAddr((HttpServletRequest) request);
		// String captcha = getCaptcha(request);
		// boolean mobile = isMobileLogin(request);
		String loginType = "Employee";
		System.out.println("username->" + username + "|password->" + password);
		return new CustomToken(username, password.toCharArray(), rememberMe, host, loginType, recaptcha);

	}

//issueSuccessRedirect該方法就代表的校驗成功時，會跳轉到配置文件中定義的成功界面去
	@Override
	protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
		// Principal p = UserUtils.getPrincipal();

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = httpServletRequest.getSession();
		Employee employee = employeeService.getByAccount((String) SecurityUtils.getSubject().getPrincipal());
		System.out.println(employee);
		session.setAttribute("admin", employee);
		boolean rememberMe = isRememberMe(request);

		if (rememberMe) {
			Cookie cookie = new Cookie("remadmin", String.valueOf(employee.getId()));
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			res.addCookie(cookie);
		}

//		if (p != null && !p.isMobileLogin()){
		System.out.println(getSuccessUrl());

		WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);

//		}else{
//			//super.issueSuccessRedirect(request, response);//手機登錄
//			AjaxJson j = new AjaxJson();
//			j.setSuccess(true);
//			j.setMsg("登錄成功!");
//			j.put("username", p.getLoginName());
//			j.put("name", p.getName());
//			j.put("mobileLogin", p.isMobileLogin());
//			j.put("JSESSIONID", p.getSessionid());
//			PrintJSON.write((HttpServletResponse)response, j.getJsonStr());
//		}
	}

	public String getMessageParam() {
		return messageParam;
	}

	/**
	 * 登錄失敗調用事件
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		String className = e.getClass().getName(), message = "";
		System.out.println(e.getMessage());

		if (IncorrectCredentialsException.class.getName().equals(className)) {
			message = "用戶或密碼錯誤, 請重試.";
		} else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")) {
			System.out.println("FORMAUTHENTICATION");
			message = StringUtils.replace(e.getMessage(), "msg:", "");
		} else {
			message = "用戶或密碼錯誤, 請重試";
			e.printStackTrace(); // 輸出到控制台
		}

		// request.setAttribute(getFailureKeyAttribute(), className);//
		// 把錯誤類別的名字放到"shiroLoginFailure" LOG用的
		request.setAttribute(getMessageParam(), message);
		return true;
	}

	// 原FormAuthenticationFilter的認證方法
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		// 在這裡進行驗證碼的校驗

		// 從session獲取正確驗證碼
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;

//		boolean recaptcha = new ReCaptcha("6LfQZscUAAAAAFZfe9FJ2cKxy4h604Jf2bKfpOkY")
//				.isValid(request.getParameter("g-recaptcha-response"));
//		System.out.println(recaptcha);
		// ...好像忘記做ㄌ 要在驗證 其實看不出來 沒差

//		if (recaptcha == false) {
//			httpServletRequest.setAttribute("shiroLoginFailure", "機器人驗證失敗");
//
//		}

//		
//		HttpSession session = httpServletRequest.getSession();
//		// 取出session的驗證碼（正確的驗證碼）
//		String validateCode = (String) session.getAttribute("validateCode");
//
//		// 取出頁面的驗證碼
//		// 輸入的驗證和session中的驗證進行對比
//		String randomcode = httpServletRequest.getParameter("randomcode");
//		if (randomcode != null && validateCode != null && !randomcode.equals(validateCode)) {
//			// 如果校驗失敗，將驗證碼錯誤失敗信息，通過shiroLoginFailure設置到request中
//			httpServletRequest.setAttribute("shiroLoginFailure", "randomCodeError");
//			// 拒絕訪問，不再校驗賬號和密碼
//			return true;
//		}
		return super.onAccessDenied(request, response);
	}

}
