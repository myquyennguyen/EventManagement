package com.eventmanagement.DAO.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.eventmanagement.DAO.IEventDAO;
import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.RegisterEventEntity;
import com.eventmanagement.entity.UserEntity;
import com.eventmanagement.hibernate.HibernateUtils;


public class EventDAO implements IEventDAO {
	public List<EventEntity> findAllForWeb(){
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<EventEntity> events = null;
		Query query = session.createQuery("FROM EventEntity WHERE endDate >= current_date() AND status != :status ORDER BY startDate, startTime DESC", EventEntity.class);
		query.setParameter("status", "Draft");
		events = query.list();
		if(events != null) {
			session.getTransaction().commit();
			session.close();
			return events;
		}
		else {
			session.getTransaction().commit();
			session.close();
			return null;}
	}
	
	public List<EventEntity> findAllForAdmin(){
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<EventEntity> events = null;
		events = session.createQuery("FROM EventEntity ORDER BY eventId DESC", EventEntity.class).list();
		if(events != null) {
			session.getTransaction().commit();
			return events;
		}
		else {
			session.getTransaction().commit();
			return null;}
	}
	
	public EventEntity findEventById(int id) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<EventEntity> events = null;
		events = session.createQuery("FROM EventEntity WHERE event_id="+id, EventEntity.class).list();
		session.getTransaction().commit();
		session.close();
		if(events != null) {
			return events.get(0);
		}
		return null;
	}
	
	public EventEntity createEvent(EventEntity event) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(event);
		session.getTransaction().commit();
		session.close();
		return event;
	}
	
	public EventEntity updateEvent(EventEntity event) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.update(event);
		session.getTransaction().commit();
		session.close();
		return event;
	}
	
	public boolean checkTickets(int eventId, int number) {
		EventEntity event = this.findEventById(eventId);
		int countTickets = event.getTickets() - event.getSold();
		if(number <= countTickets)
			return true;
		else
			return false;
	}
	
	public void deleteEvent(int eventId) {
		EventEntity event = this.findEventById(eventId);
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(event);
		session.getTransaction().commit();
		session.close();
	}
	
	public List<CustomersDTO> listCustomers(int eventId){
		EventEntity event = this.findEventById(eventId);
		Set<RegisterEventEntity> registers = event.getRegister();
		List<CustomersDTO> result = new ArrayList<>();
		for (RegisterEventEntity item : registers) {
			CustomersDTO customer = new CustomersDTO();
			customer.setFullName(item.getUser().getFullName());
			customer.setPhoneNumber(item.getUser().getPhoneNumber());
			customer.setAddress(item.getUser().getAddress());
			customer.setCountTickets(item.getCountTickets());
			customer.setCountMoney(item.getCountMoney());
			customer.setDateRegister(item.getDate());
			result.add(customer);
		}
		return result;
	}
}
