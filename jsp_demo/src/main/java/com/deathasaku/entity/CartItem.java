package com.deathasaku.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class CartItem {

	private Integer id;
	private ProductSku productsku;
	private Integer buyNumber;
	private User user;

	public CartItem() {

	}

	public void set(Integer id, ProductSku productsku, Integer buyNumber) {
		;
		this.id = id;
		this.productsku = productsku;
		this.buyNumber = buyNumber;
	}

	public CartItem(Integer id, ProductSku productsku, Integer buyNumber) {
		super();
		this.id = id;
		this.productsku = productsku;
		this.buyNumber = buyNumber;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JsonIgnoreProperties(value = { "hibernateLazyInitializer" })
	@ManyToOne
	@JoinColumn(name = "cart_productsku")
	public ProductSku getProductsku() {
		return productsku;
	}

	public void setProductsku(ProductSku productsku) {
		this.productsku = productsku;
	}

	@ManyToOne
	@JoinColumn(name = "cart_user")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

}
