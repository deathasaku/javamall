package com.deathasaku.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Property {

	private Integer id;
	private String propertyName;
	// 外鍵在多對多的那ㄍ額外TABLE
	private List<Category> categories;
	private Date createDate;
	// 外鍵在VALUE那邊
	private List<PropertyValue> propertyValue;

	@OneToMany(mappedBy = "property", cascade = CascadeType.ALL)
	public List<PropertyValue> getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(List<PropertyValue> propertyValue) {
		this.propertyValue = propertyValue;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	@ManyToMany
	@JoinTable(name = "category_property", inverseJoinColumns = {
			@JoinColumn(name = "categoryId", referencedColumnName = "id") }, joinColumns = {
					@JoinColumn(name = "property_id", referencedColumnName = "id") })
	@JsonIgnore
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	// 怎ㄇ覺得中間還要一張表R
	// 這邊如果要配合分類 一定是最後一層分類
}
