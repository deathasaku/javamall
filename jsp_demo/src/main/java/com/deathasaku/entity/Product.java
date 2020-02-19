package com.deathasaku.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Product {

	private Integer id; // PK
	private String productName;// 產品名稱
	private String description;// 商品詳情
	private Brand brand;// 一個品牌有多個產品 這邊是多 建立雙向關係好ㄌ 這樣品牌要撈產品比較方便
	private Boolean productStatus;
	private String productIntro; // 簡單描述
	private Date createDate;
	// private Integer createUser;// 建立者 要在家日期嗎?

	private Category category;
	private List<ProductSku> productSku;
	private List<ProductImage> productImage;// 這邊會放圖片

	@JsonIgnoreProperties("product")
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER) // 要先撈圖片 不然前端沒辦法用
	public List<ProductImage> getProductImage() {
		return productImage;
	}

	public void setProductImage(List<ProductImage> productImage) {
		this.productImage = productImage;
	}

	@JsonIgnoreProperties("product")
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	public List<ProductSku> getProductSku() {
		return productSku;
	}

	public void setProductSku(List<ProductSku> productSku) {
		this.productSku = productSku;
	}

	public Boolean getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Boolean productStatus) {
		this.productStatus = productStatus;
	}

	private List<Tag> tag;// 標籤
	// 還要補外鍵 真ㄊㄇㄐ八凡

	@ManyToOne
	@JoinColumn(name = "product_brand")
	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

//	public Integer getProductCategoryId() {
//		return productCategoryId;
//	}
//
//	public void setProductCategoryId(Integer productCategoryId) {
//		this.productCategoryId = productCategoryId;
//	}

	@ManyToOne
	@JoinColumn(name = "categoryId")
	public Category getCategory() {
		return category;
	}

	@JsonIgnore
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "tag_product", inverseJoinColumns = {
			@JoinColumn(name = "tag_id", referencedColumnName = "id") }, joinColumns = {
					@JoinColumn(name = "product_id", referencedColumnName = "id") })
	public List<Tag> getTag() {
		return tag;
	}

	public void setTag(List<Tag> tag) {
		this.tag = tag;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(unique = true)
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProductIntro() {
		return productIntro;
	}

	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
