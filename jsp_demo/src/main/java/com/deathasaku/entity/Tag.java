package com.deathasaku.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Tag {

	private Integer id;
	private String tag;
	private List<Product> product;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@ManyToMany
	@JoinTable(name = "tag_product", joinColumns = {
			@JoinColumn(name = "tag_id", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "product_id", referencedColumnName = "id") })
	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

}
