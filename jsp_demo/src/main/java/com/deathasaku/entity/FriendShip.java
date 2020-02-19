package com.deathasaku.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class FriendShip {

	private Integer id;

	private Employee userId;
	private Employee friendId;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "userId")
	public Employee getUserId() {
		return userId;
	}

	public void setUserId(Employee userId) {
		this.userId = userId;
	}

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "friendId")
	public Employee getFriendId() {
		return friendId;
	}

	public void setFriendId(Employee friendId) {
		this.friendId = friendId;
	}

}
