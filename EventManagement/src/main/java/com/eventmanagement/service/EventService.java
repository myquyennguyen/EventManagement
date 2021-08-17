package com.eventmanagement.service;

import java.util.List;
import java.util.ArrayList;

import com.eventmanagement.DAO.impl.EventDAO;
import com.eventmanagement.converter.EventConverter;
import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.UserEntity;

public class EventService {
	private EventDAO eventdao = new EventDAO();
	private EventConverter eventConverter = new EventConverter();
	
	public List<EventDTO> findAllForWeb() {
		List<EventDTO> events = new ArrayList<>();
		List<EventEntity> items = eventdao.findAllForWeb();
		for(EventEntity item : items) {
			EventDTO event = eventConverter.toDTO(item);
			events.add(event);
		}
		return events;
	}
	public List<EventDTO> findAllForAdmin() {
		List<EventDTO> events = new ArrayList<>();
		List<EventEntity> items = eventdao.findAllForAdmin();
		for(EventEntity item : items) {
			EventDTO event = eventConverter.toDTO(item);
			events.add(event);
		}
		return events;
	}
	public EventDTO findEventById(int id){
		EventDTO result = new EventDTO();
		EventEntity event = eventdao.findEventById(id);
		result = eventConverter.toDTO(event);
		return result;
	}
	public EventDTO createEvent(EventDTO event) {
		EventDTO result = new EventDTO();
		EventEntity item = eventdao.createEvent(eventConverter.toEntity(event));
		result = eventConverter.toDTO(item);
		return result;
	}
	public EventDTO updateEvent(EventDTO event) {
		EventDTO result = new EventDTO();
		EventEntity oldEvent = eventdao.findEventById(event.getEventId());
		EventEntity newEvent = eventConverter.toEntity(event);
		//newEvent.setRegister(oldEvent.getRegister());
		newEvent.setSold(oldEvent.getSold());
		EventEntity item = eventdao.updateEvent(newEvent);
		result = eventConverter.toDTO(item);
		return result;
	}
	
	public EventDTO updateStatusEvent(int id, String status) {
		EventDTO event = this.findEventById(id);
		event.setStatus(status);
		return this.updateEvent(event);
	}
	
	public void deleteEvent(int eventId) {
		eventdao.deleteEvent(eventId);
	}
	
	public List<CustomersDTO> listCustomers(int eventId){
		return eventdao.listCustomers(eventId);
	}
	
	public Long getFee(int eventId) {
		EventEntity event = eventdao.findEventById(eventId);
		return event.getFee();
	}
}
