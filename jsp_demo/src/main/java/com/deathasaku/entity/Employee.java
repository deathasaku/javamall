package com.deathasaku.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Employee implements Serializable {

	public Boolean getBlock() {
		return block;
	}

	public void setBlock(Boolean block) {
		this.block = block;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 6500257156439319636L;

	private Integer id;
	private String account;
	private String password;
	private String username;// 暱稱
	private String image;// 大頭貼
	private String type;// 職位
	private Date createDate;// 創鍵日期
	private Boolean block;// BAN
	private String tel;// 電話
	private Boolean verify;

	// 外鍵在好友關係表表裡面

	public Boolean getVerify() {
		return verify;
	}

	public void setVerify(Boolean verify) {
		this.verify = verify;
	}

	private List<FriendShip> friends;

	// 港決是這邊的問題
	@OneToMany(mappedBy = "userId", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public List<FriendShip> getFriends() {
		return friends;
	}

	public void setFriends(List<FriendShip> friends) {
		this.friends = friends;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	// 旨在建立資料庫的時候有用 如果你先建過表 這條就沒屁用 ALERT也沒用
	// 簡單來說 偷懶專用啦 正常哪會用HIBERNATE建表

	@Column(unique = true)
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
