package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.PropertyValue;

public interface PropertyValueRepository extends JpaRepository<PropertyValue, Integer> {
	List<PropertyValue> findByPropertyId(Integer pid);

}
