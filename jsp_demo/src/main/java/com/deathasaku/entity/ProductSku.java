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
public class ProductSku {
	private Integer id;
	private Integer originalPrice;// 原價
	private Integer sellingPrice;// 折扣%
	private Integer stockNum;// 庫存
	private Boolean productStatus;// 上下架
	private Product product;// 多對一
	private String spec; // 我們直接把 PRODUCT傳給前端 我前端可以用EL蟄居 ${product.productSpu}取得LIST 然後在foreach
//	private Integer page;
//	private Integer total;

	// ${productspu}可以直接把JSON抓出來
	// 顏色:紅,SIZE:X,應該是這種格式
	// 效率可能差 但是絕對好寫
	// 要想一下前台要怎麼寫 這樣拆開要怎麼新增商品... 想到ㄌ 讓用戶自己新增 同一個葉面可以有多個商品?
	// 但是要怎麼保證 SPU的SKU是同一個? 算了邊做邊坐享 大不了強制他要點進去設定 ㄏㄏ

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
	}

	public Integer getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(Integer sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public Integer getStockNum() {
		return stockNum;
	}

	public void setStockNum(Integer stockNum) {
		this.stockNum = stockNum;
	}

	@JsonIgnoreProperties("productSku")
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sku_spu")
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Boolean getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(Boolean productStatus) {
		this.productStatus = productStatus;
	}
}
