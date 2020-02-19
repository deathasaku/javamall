package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.Carousel;

public interface CarouselRepository extends JpaRepository<Carousel, Integer> {

	List<Carousel> findByIdIn(Integer[] id);
}
