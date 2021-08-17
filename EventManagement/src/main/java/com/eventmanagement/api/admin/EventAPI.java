package com.eventmanagement.api.admin;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.service.EventService;

@CrossOrigin
@RestController(value = "eventAPIOfAdmin")
public class EventAPI {
	
	private EventService es = new EventService();
	
	@GetMapping("/api/secure/event/")
	public List<EventDTO> findAllForAdmin() {
		List<EventDTO> events = es.findAllForAdmin();
		return events;
	}
	
	@GetMapping(value="/api/secure/event/{id}")
	public EventDTO findEventById(@PathVariable("id") int id) {
		return es.findEventById(id);
	}
	
	@PostMapping("/api/private/newevent")
	public EventDTO createEvent(@RequestBody EventDTO event) {
		return es.createEvent(event);
	}
	
	@PutMapping("/api/private/update")
	public EventDTO updateEvent(@RequestBody EventDTO event) {
		System.out.print("Id cua su kien la:"+event.getEventId());
		return es.updateEvent(event);
	}
	
	@PostMapping("/api/private/event/cancel/{id}")
	public EventDTO cancelEvent(@PathVariable("id") int id, @RequestBody String status) {
		return es.updateStatusEvent(id, status);
	}
	
	@DeleteMapping("/api/private/event/delete/{id}")
	public void deleteEvent(@PathVariable("id") int id) {
		es.deleteEvent(id);
	}
	
	@GetMapping("/api/private/event/listcustomers/{id}")
	public List<CustomersDTO> listCustomers(@PathVariable("id") int eventId){
		return es.listCustomers(eventId);
	}
	
	@PostMapping("/api/private/event/review")
	public EventDTO reviewEvent(@RequestBody EventDTO event) {
		return event;
	}
}
