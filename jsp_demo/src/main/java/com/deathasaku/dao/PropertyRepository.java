package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Property;

public interface PropertyRepository extends JpaRepository<Property, Integer> {

	List<Property> findByIdIn(Integer[] id);

	List<Property> findByPropertyName(String propertyName);

}
