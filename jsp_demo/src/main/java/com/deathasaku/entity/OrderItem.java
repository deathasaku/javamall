package com.deathasaku.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class OrderItem {

	private Integer id;
	private Integer buyNumber;
	private User user;
	private Order order;
	private ProductSku productsku;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	@ManyToOne
	@JoinColumn(name = "orderitem_user")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@JsonIgnoreProperties("orderItems")
	@ManyToOne
	@JoinColumn(name = "orderitem_order")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "orderitem_productsku")
	public ProductSku getProductsku() {
		return productsku;
	}

	public void setProductsku(ProductSku productsku) {
		this.productsku = productsku;
	}

}
