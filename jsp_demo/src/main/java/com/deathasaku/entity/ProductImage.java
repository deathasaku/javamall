package com.deathasaku.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class ProductImage {

	private Integer id;
	private Product product;
	private Boolean firstPic;// 是不是首圖
	private String src;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getFirstPic() {
		return firstPic;
	}

	public void setFirstPic(Boolean firstPic) {
		this.firstPic = firstPic;
	}

	@JsonIgnoreProperties("productImage")
	@ManyToOne
	@JoinColumn(name = "pid")
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

}
