package com.deathasaku.service.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deathasaku.dao.PropertyRepository;
import com.deathasaku.dao.PropertyValueRepository;
import com.deathasaku.entity.Property;
import com.deathasaku.entity.PropertyValue;
import com.deathasaku.service.PropertyService;

@Service
@Transactional
public class PropertyServiceImpl implements PropertyService {
	PropertyRepository propertyRepository;
	PropertyValueRepository propertyValueRepository;

	@Autowired
	public void setPropertyValueRepository(PropertyValueRepository propertyValueRepository) {
		this.propertyValueRepository = propertyValueRepository;
	}

	@Autowired
	public void setPropertyRepository(PropertyRepository propertyRepository) {
		this.propertyRepository = propertyRepository;
	}

	@Override
	public List<Property> findAll() {
		return propertyRepository.findAll();
	}

	@Override
	public void deleteById(Integer[] id) {

		propertyRepository.deleteAll(propertyRepository.findByIdIn(id));
	}

	@Override
	public boolean modifyPropertyValue(Integer id, String propertyValue) {

		List<PropertyValue> properties = propertyValueRepository.findByPropertyId(id);
		if (properties.isEmpty()) {
			System.out.println("幹你娘怎麼會是空ㄉ");
		}
		for (PropertyValue propertyValue2 : properties) {
			System.out.println("->" + propertyValue2.toString());
		}

		propertyValueRepository.deleteAll(properties);
		propertyRepository.flush();
		// 這邊先COMMIT一次
		// 想法一
		// 因為HB這時候只是把操作保存到SESSION緩存裡面而已
		// 所以下面再比較的時候
		// propertyRepository.getOne(id); 撈出來的資料是還沒同步過的
		// 所以產生錯誤

		// 想法2
		// 因為HB這時候只是把操作保存到SESSION緩存裡面而已
		// 他會先 SAVE 在 UPDATE 在 DELETE
		// 也就是先SAVE propertyValueRepository.save(tmp); 再去刪除我們的曲姓

		// 驗證
		// 兩個都是正確的想法
		// 但是目前的情況是第一個
		// 第二個想法放到同一層 可能會比較好理解跟案正

		// 如果沒在FFLUSH 但是他取得的直視應該已經被刪除的
		// 是D 只要資料庫還沒做COMMIT或FLUSH 那麼取得的資料都是 原本的 這是一個坑 要小心

		// 每次更新直接把東西砍掉 再新增回去
		// 不然的話太麻煩 要用UPDATE
		return updateProperties(id, propertyValue);

	}

	@Override
	public boolean updateProperties(Integer id, String propertyValue) {
		Property property = propertyRepository.getOne(id);

		// 這邊 SPLIT 要接收REGEX 用特殊符號要用符合REGEX規則的轉譯符號 小坑
		String[] props = propertyValue.split(",");
		// 把STRING ARRAY 轉成 SET 保證 不重複
		Set<String> set = new HashSet<String>(Arrays.asList(props));
		// 好像一定只能用NEW 這樣不知道是不是不符合SPRING的寫法

		for (String stmp : set) {
			boolean flag = true;
			// 旗標決定該屬性值 是不是已經存在了 不存在就SAVE 可是這樣做看起來不太OK
			// 這樣只能新增 屬性值
			// 沒辦法刪除 之後看看要不要再做個刪除按鈕 再用REST實現 先這樣好了
			// 不會提供修改 要馬刪除 要馬新增 舒服啦
			if (property.getPropertyValue() != null) {

				for (PropertyValue propertyValuetmp : property.getPropertyValue()) {
					if (stmp.equals(propertyValuetmp.getPropertyValue())) {
						flag = false;
					}
				}
			}
			if (flag == true) {
				PropertyValue tmp = new PropertyValue();
				tmp.setPropertyValue(stmp);
				tmp.setProperty(property);
				propertyValueRepository.save(tmp);
			}

		}

		return true;
	}

	@Override
	public void save(Property property) throws Exception {

		if (propertyRepository.findByPropertyName(property.getPropertyName()).isEmpty()) {
			propertyRepository.save(property);
		} else {

			throw new Exception("此規格已存在");
		}

	}

	@Override
	public void modify(Property property) throws Exception {

		if (propertyRepository.getOne(property.getId()) != null) {
			propertyRepository.save(property);
		} else {
			throw new Exception("此規格不存在");
		}

	}

}
