package com.deathasaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deathasaku.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	User getByAccount(String account);

	User getByAccountAndPassword(String account, String password);

	User getByEmail(String email);

	User getByEmailAndPassword(String email, String password);

	User findByEmail(String email);

	User getByOpenid(String openid);

	@Modifying
	@Query(value = "update [User] set name= :name , password = :password, tel = :tel ,image = :image,address = :address where email = :email", nativeQuery = true)
	void editMember(@Param("email") String email, @Param("name") String name, @Param("password") String password,
			@Param("tel") String tel, @Param("image") String image, @Param("address") String address);
}
