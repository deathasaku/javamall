package com.deathasaku.service;

import java.util.List;

import com.deathasaku.entity.Carousel;

public interface CarouselService {
	void save(Carousel carousel);

	void modify(String imageSrc, String hyperlink, Integer id);

	void delete(Integer[] id);

	List<Carousel> findAll();

	List<Carousel> getALL();

}
