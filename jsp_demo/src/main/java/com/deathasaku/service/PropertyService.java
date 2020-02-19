package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.Property;

public interface PropertyService {

	List<Property> findAll();

	boolean updateProperties(Integer id, String propertyValue);

	boolean modifyPropertyValue(Integer id, String propertyValue);

	void save(Property property) throws Exception;

	void modify(Property property) throws Exception;

	void deleteById(Integer[] id);
	
}
