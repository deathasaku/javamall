package com.deathasaku.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Message implements Cloneable {

	private Integer id;
	private Integer fromUser;
	private Integer toUser;

	private String text;
	private Date createDate;
	// 用來確定該消息是否未讀
	private Boolean status;
	private Boolean toAll;

	public Boolean getToAll() {
		return toAll;
	}

	public void setToAll(Boolean toAll) {
		this.toAll = toAll;
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	private List<Employee> onlineEmployee;

	@Transient
	public List<Employee> getOnlineEmployee() {
		return onlineEmployee;
	}

	public void setOnlineEmployee(List<Employee> onlineEmployee) {
		this.onlineEmployee = onlineEmployee;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getFromUser() {
		return fromUser;
	}

	public void setFromUser(Integer fromUser) {
		this.fromUser = fromUser;
	}

	public Integer getToUser() {
		return toUser;
	}

	public void setToUser(Integer toUser) {
		this.toUser = toUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
