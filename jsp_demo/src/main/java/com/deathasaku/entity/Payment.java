package com.deathasaku.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

//這邊等串綠屆拿到JSON在寫

@Entity
public class Payment {

	private Integer id;
	private Order order;
	private String paymentId;// PAYAPL 交易ID
	private String PayerFirstName;
	private String PayerLastName;
	private String Payeremail;
	private String PayerID;
	private String status;
	private String shipping_address;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@OneToOne
	@JoinColumn(name = "payment_order")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getPayerID() {
		return PayerID;
	}

	public void setPayerID(String payerID) {
		PayerID = payerID;
	}

	public String getPayeremail() {
		return Payeremail;
	}

	public void setPayeremail(String payeremail) {
		Payeremail = payeremail;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getPayerFirstName() {
		return PayerFirstName;
	}

	public void setPayerFirstName(String payerFirstName) {
		PayerFirstName = payerFirstName;
	}

	public String getPayerLastName() {
		return PayerLastName;
	}

	public void setPayerLastName(String payerLastName) {
		PayerLastName = payerLastName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

}
