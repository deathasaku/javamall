package com.deathasaku.service.impl;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.CategoryRepository;
import com.deathasaku.dao.OrderItemRepository;
import com.deathasaku.dao.PropertyRepository;
import com.deathasaku.entity.Category;
import com.deathasaku.entity.OrderItem;
import com.deathasaku.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	CategoryRepository categoryRepository;
	PropertyRepository propertyRepository;
	OrderItemRepository orderItemRepository;

	@Autowired
	public void setRderItemRepository(OrderItemRepository orderItemRepository) {
		this.orderItemRepository = orderItemRepository;
	}

	@Autowired
	public void setCategoryRepository(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	@Autowired
	public void setPropertyRepository(PropertyRepository propertyRepository) {
		this.propertyRepository = propertyRepository;
	}

	@Override
	public boolean addCategory(Category category, Integer[] checkboxes) {

		category.setProperty(propertyRepository.findByIdIn(checkboxes));
		System.out.println("category->" + category.toString());
		try {
			categoryRepository.save(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean addCategory(Category category) {
		// 這邊要考慮 同名 不同父 的分類處理? 例如 女裝 庫子 南庄 庫子?
		// 所以應該檢查該PID下 不能有同名 即可

		// 寫一個 getByPidAndCategoryName的JPA 就好 如果!=NULL直接下探親
		List<Category> list = null;
		// 檢查一下 已存在就不給存 可能要回傳錯誤訊息 直接拋出? 也可以

		list = categoryRepository.findByNameAndParentId(category.getName(), category.getParentId());
		if (list.size() > 0)
			return false;

		try {
			categoryRepository.save(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public List<Category> findByParentId(Integer parentId) {

		return categoryRepository.findByParentId(parentId);
	}

	@Override
	public List<Category> findByNameAndParentId(String name, Integer parentId) {
		return categoryRepository.findByNameAndParentId(name, parentId);
	}

	@Override
	public List<Category> findByNameContainingAndParentId(String name, Integer parentId) {
		// TODO Auto-generated method stub
		return categoryRepository.findByNameContainingAndParentId(name, parentId);
	}

	@Override
	public Category findById(Integer id) {

		return categoryRepository.getOne(id);
	}

	@Override
	public boolean editCategory(Category category, Integer[] checkboxes) {

		Category category2 = categoryRepository.getOne(category.getId());
		try {
			category2.setName(category.getName());
			if (checkboxes != null) {
				category2.setProperty(propertyRepository.findByIdIn(checkboxes));
			}
			categoryRepository.save(category2);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public Map<String, Integer> chartJson(String date) {
		// Date startDate = f.parse(date);
		// System.out.println(startDate);

		ZoneId zoneId = ZoneId.systemDefault();

		LocalDate localstartDate = LocalDate.parse(date + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		ZonedDateTime startzdt = localstartDate.atStartOfDay(zoneId);
		Date startDate = Date.from(startzdt.toInstant());
		System.out.println(startDate);

		LocalDate convertedDate = LocalDate.parse(date + "-01", DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		convertedDate = convertedDate.withDayOfMonth(convertedDate.getMonth().length(convertedDate.isLeapYear()));

		// convertedDate=convertedDate.plusMonths(1);
		ZonedDateTime zdt = convertedDate.atTime(LocalTime.MAX).atZone(zoneId); // convertedDate.atStartOfDay(zoneId);
		Date endDate = Date.from(zdt.toInstant());

		System.out.println(endDate);

		List<Category> list = categoryRepository.findByParentId(0);
		Map<String, Integer> map = new LinkedHashMap<String, Integer>();
		for (Category category : list) {
			// 這是第一類
			// category.name=此類名稱 要放到PIE CHART
			List<Category> list2 = categoryRepository.findByParentId(category.getId());
			// 這是第二級的
			List<Integer> id = new ArrayList<Integer>();
			for (Category category2 : list2) {
				System.out.println("找到第2及:");
				id.add(category2.getId());
			}
			List<Category> list3 = categoryRepository.findByParentIdIn(id);

			// 範圍內的資料

			// List<OrderItem> orderItems = orderItemRepository
			// .findByProductProductCategoryInAndOrderCreateDateBetween(list3, new Date(),
			// new Date());

			// List<OrderItem> orderItems =
			// orderItemRepository.findByProductProductCategoryIn(list3);
			// List<OrderItem> orderItems =
			// orderItemRepository.findByProductProductCategoryIdIn(id2);
			// List<OrderItem> orderItems =
			// orderItemRepository.findByProductProductCategoryIn(list3);
			List<OrderItem> orderItems = orderItemRepository
					.findByProductskuProductCategoryInAndOrderCreateDateBetween(list3, startDate, endDate);
			System.out.println("orderitems:" + orderItems.size());
			int buySum = 0;
			// int money=0;
			for (OrderItem orderItem : orderItems) {
				System.out.println("有找到ORDERITEM");
				buySum = buySum + orderItem.getBuyNumber();

			}
			System.out.println("數量:" + buySum);
			map.put(category.getName(), Integer.valueOf(buySum));

			// sum=此類產品的銷售量總合
			// 對應數據

		}

		return map;
	}

}
