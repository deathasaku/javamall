package com.deathasaku.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deathasaku.entity.FriendShip;

public interface FriendShipRepository extends JpaRepository<FriendShip, Integer> {
	List<FriendShip> findByUserIdId(Integer id);

}
