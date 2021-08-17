package com.eventmanagement.dto;

import com.eventmanagement.entity.UserEntity;

public class CustomersDTO {
	private String fullName;
	private String phoneNumber;
	private String address;
	private int countTickets;
	private Long countMoney;
	private String eventName;
	private String dateRegister;
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCountTickets() {
		return countTickets;
	}
	public void setCountTickets(int countTickets) {
		this.countTickets = countTickets;
	}
	public Long getCountMoney() {
		return countMoney;
	}
	public void setCountMoney(Long countMoney) {
		this.countMoney = countMoney;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getDateRegister() {
		return dateRegister;
	}
	public void setDateRegister(String dateRegister) {
		this.dateRegister = dateRegister;
	}
	
}
