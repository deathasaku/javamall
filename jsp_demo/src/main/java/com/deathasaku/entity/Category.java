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
public class Category {
	private Integer id;// PK
	private String name;// 分類名稱
	private Integer level;// 第幾層
	private Integer parentId;// 0 =沒上級
	private List<Property> property;

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", level=" + level + ", parentId=" + parentId + ", property="
				+ property + "]";
	}

	// @ManyToMany(mappedBy = "categories", cascade = CascadeType.ALL)
	@ManyToMany
	@JoinTable(name = "category_property", joinColumns = {
			@JoinColumn(name = "categoryId", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "property_id", referencedColumnName = "id") })
	public List<Property> getProperty() {
		return property;
	}

	public void setProperty(List<Property> property) {
		this.property = property;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

}
