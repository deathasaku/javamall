package com.deathasaku.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.ResetPasswordRepository;
import com.deathasaku.entity.Employee;
import com.deathasaku.entity.ResetPassword;
import com.deathasaku.service.EmployeeService;
import com.deathasaku.service.ResetPasswordService;
import com.deathasaku.util.sendmail;

@Service
@Transactional
public class ResetPasswordServiceImpl implements ResetPasswordService {
	@Autowired
	private ResetPasswordRepository resetPasswordRepository;
	@Autowired
	private EmployeeService employeeService;

	@Override
	public ResetPassword getOne(Integer id) {

		return resetPasswordRepository.getOne(id);
	}

	@Override
	public void save(ResetPassword resetPassword, String email,String url) {
		resetPasswordRepository.deleteByEmployeeAccount(email);

		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		resetPassword.setEncryPwd(id);
		resetPassword.setCreateDate(new Date());
		resetPassword.setEmployee(employeeService.getByAccount(email));
		resetPasswordRepository.save(resetPassword);
		// 寄信 送出指定URL
		sendmail.sendPwd(null, email, null, url+"/admin/resetpwd/" + id, null);
											//http://deathasaku.southeastasia.cloudapp.azure.com:8080/jsp_demo/store/index
	}

	@Override
	public void deleteByUserAccount(String email) {
		resetPasswordRepository.deleteByEmployeeAccount(email);

	}

	// 收到指定URL的位置
	@Override
	public String resetPwd(String encryPwd) {
		ResetPassword resetPassword = resetPasswordRepository.findByencryPwd(encryPwd);
		// 刪掉重置資料
		try {
			resetPasswordRepository.deleteByEmployeeAccount(resetPassword.getEmployee().getAccount());
			String newpwd = resetPassword.getEncryPwd().substring(0, 7);
			Employee employee = resetPassword.getEmployee();
			employee.setPassword(newpwd);
			employeeService.save(employee);
			return newpwd;
		} catch (Exception e) {
			return "false";
		}

	}

}
