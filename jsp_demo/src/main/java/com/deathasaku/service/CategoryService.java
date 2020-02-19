package com.deathasaku.service;

import java.util.List;
import java.util.Map;

import com.deathasaku.entity.Category;

public interface CategoryService {

	boolean addCategory(Category category);

	List<Category> findAll();

	Category findById(Integer id);

	List<Category> findByParentId(Integer parentId);

	List<Category> findByNameAndParentId(String name, Integer parentId);

	List<Category> findByNameContainingAndParentId(String name, Integer parentId);

	boolean addCategory(Category category, Integer[] checkboxes);

	boolean editCategory(Category category, Integer[] checkboxes);

	Map<String, Integer> chartJson(String date);

}
