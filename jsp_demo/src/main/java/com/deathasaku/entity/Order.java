package com.deathasaku.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "[Order]")
public class Order {

	private Integer id;
	private String orderCode;
	private String address;
	private User user;// MANYTOONE
	private Integer status;
	// 0 下定單
	// 1 備貨
	// 2 出貨
	// 3結單
	// 4取消訂單
	// 4取消訂單
	private List<OrderItem> orderItems;
	private Date createDate;
	private Payment payment;

	@JsonIgnoreProperties("order")
	@OneToOne(mappedBy = "order")
	public Payment getPayment() {
		return payment;
	}

	@JsonIgnoreProperties("order")
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "order_user")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
