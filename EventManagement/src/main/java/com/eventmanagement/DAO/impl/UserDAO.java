package com.eventmanagement.DAO.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.eventmanagement.DAO.IUserDAO;
import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.RegisterEventEntity;
import com.eventmanagement.entity.UserEntity;
import com.eventmanagement.hibernate.HibernateUtils;

import sun.security.util.Event;

public class UserDAO implements IUserDAO{
	
	public UserEntity createUser(UserEntity user) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
		return user;
	}
	
	public UserEntity findUserByUserId(int id) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<UserEntity> users = null;
		users = session.createQuery("FROM UserEntity WHERE user_id="+id, UserEntity.class).list();
		session.getTransaction().commit();
		session.close();
		if(users != null) {
			return users.get(0);
		}
		return null;
	}
	
	public UserEntity findUserByUsername(String username) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<UserEntity> users = null;
		users = session.createQuery("FROM UserEntity WHERE username='"+username+"'", UserEntity.class).list();
		session.getTransaction().commit();
		session.close();
		if(users != null) {
			return users.get(0);
		}
		return null;
	}
	
	public UserEntity updateUser(UserEntity user) {
		UserEntity userupdate = this.findUserByUsername(user.getUserName());
		if(user.getPassword() != "") {
			BCryptPasswordEncoder password = new BCryptPasswordEncoder();
			userupdate.setPassword(password.encode(user.getPassword()));
		}
		userupdate.setFullName(user.getFullName());
		userupdate.setAddress(user.getAddress());
		userupdate.setPhoneNumber(user.getPhoneNumber());
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.update(userupdate);
		session.getTransaction().commit();
		session.close();
		return userupdate;
	}
	
	public int registerEvent(String username, int eventId, int countTickets, Long countMoney) {
		EventDAO eventDAO = new EventDAO();	
		UserEntity user = this.findUserByUsername(username);
		user.setRegisterEventEntity(null);
		EventEntity event = eventDAO.findEventById(eventId);
		event.setRegister(null);
		RegisterEventEntity register = new RegisterEventEntity();
		register.setEvent(event);
		register.setCountMoney(countMoney);
		event.setSold(event.getSold() + countTickets);
		register.setUser(user);
		register.setCountTickets(countTickets);
		register.setDate(java.time.LocalDate.now().toString());
		if(event.getStatus().equals("Cancelled"))
			return -1;
		if(countTickets <= (event.getTickets()-event.getSold())) {
			Session session = HibernateUtils.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(register);
			session.getTransaction().commit();
			session.close();
			return 1;
		}
		return 0;
	}
	
	public List<CustomersDTO> listEvent(String username){
		UserEntity user = this.findUserByUsername(username);
		Set<RegisterEventEntity> register = user.getRegisterEventEntity();
		List<CustomersDTO> result = new ArrayList<>();	
		for(RegisterEventEntity item : register) {
			CustomersDTO event = new CustomersDTO();
			event.setFullName(user.getFullName());
			event.setPhoneNumber(user.getPhoneNumber());
			event.setAddress(user.getAddress());
			event.setEventName(item.getEvent_().getName());
			event.setCountTickets(item.getCountTickets());
			event.setCountMoney(item.getCountMoney());
			event.setDateRegister(java.time.LocalDate.now().toString());
			result.add(event);
		}
		return result;
	}
}
