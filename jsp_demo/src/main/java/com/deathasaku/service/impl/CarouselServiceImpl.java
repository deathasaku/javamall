package com.deathasaku.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.CarouselRepository;
import com.deathasaku.entity.Carousel;
import com.deathasaku.service.CarouselService;

@Service
@Transactional
public class CarouselServiceImpl implements CarouselService {
	@Autowired
	private CarouselRepository carouselRepository;

	@Override
	public List<Carousel> getALL() {
		List<Carousel> list = null;
		try {
			list = carouselRepository.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void save(Carousel carousel) {
		carousel.setCreateDate(new Date());
		carouselRepository.save(carousel);
	}

	@Override
	public List<Carousel> findAll() {
		return carouselRepository.findAll();
	}

	@Override
	public void modify(String imageSrc, String hyperlink, Integer id) {

		Carousel carousel = carouselRepository.getOne(id);
		carousel.setHyperlink(hyperlink);
		carousel.setImageSrc(imageSrc);
		carousel.setCreateDate(new Date());
		carouselRepository.save(carousel);
	}

	@Override
	public void delete(Integer[] id) {
		carouselRepository.deleteAll(carouselRepository.findByIdIn(id));
	}

}
