package com.eventmanagement.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="register_event")
public class RegisterEventEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int idRegister;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private UserEntity user_;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "event_id")
	private EventEntity event_;
	
	@Column(name = "count_tickets")
	private int countTickets;
	
	@Column(name="count_money")
	private Long countMoney;
	
	@Column(name="date")
	private String date;
	
	

	public RegisterEventEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserEntity getUser() {
		return user_;
	}

	public void setUser(UserEntity user) {
		this.user_ = user;
	}

	public EventEntity getEvent() {
		return event_;
	}

	public void setEvent(EventEntity event) {
		this.event_ = event;
	}

	public int getCountTickets() {
		return countTickets;
	}

	public void setCountTickets(int countTickets) {
		this.countTickets = countTickets;
	}

	public int getIdRegister() {
		return idRegister;
	}

	public UserEntity getUser_() {
		return user_;
	}

	public void setUser_(UserEntity user_) {
		this.user_ = user_;
	}

	public EventEntity getEvent_() {
		return event_;
	}

	public void setEvent_(EventEntity event_) {
		this.event_ = event_;
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
