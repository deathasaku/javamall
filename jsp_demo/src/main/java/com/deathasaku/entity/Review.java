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
public class Review {

	private Integer id;
	private String review;
	private String reply;

	private Product product;
	private User user;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "review_product")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "review_user")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
