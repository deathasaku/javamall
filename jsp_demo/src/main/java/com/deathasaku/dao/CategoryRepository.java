package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

	List<Category> findByNameAndParentId(String name, Integer parentId);

	List<Category> findByNameContainingAndParentId(String name, Integer parentId);

	List<Category> findByParentId(Integer parentId);

	List<Category> findByParentIdIn(List<Integer> id);

	@Query(value = "select id from Category  where parentId=:parentId or id=:parentId", nativeQuery = true)
	List<Integer> findByParentIdIn(@Param("parentId") Integer parentId);
}
