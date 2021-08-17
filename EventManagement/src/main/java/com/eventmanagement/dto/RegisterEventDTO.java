package com.eventmanagement.dto;

public class RegisterEventDTO {
	
	private int id;
	private int eventId;
	private String username;
	private int countTickets;
	private Long countMoney;
	private String date;
	
	public RegisterEventDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
