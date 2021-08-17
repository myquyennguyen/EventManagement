package com.eventmanagement.DAO;

import java.util.List;

import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.entity.EventEntity;


public interface IEventDAO {
	List<EventEntity> findAllForWeb();
	List<EventEntity> findAllForAdmin();
	EventEntity findEventById(int id);
	EventEntity createEvent(EventEntity event);
	EventEntity updateEvent(EventEntity event);
	boolean checkTickets(int eventId, int number);
	void deleteEvent(int id);
	List<CustomersDTO> listCustomers(int eventId);
}

