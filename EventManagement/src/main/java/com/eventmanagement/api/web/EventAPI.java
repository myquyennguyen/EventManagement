package com.eventmanagement.api.web;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.dto.RegisterEventDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.service.EventService;

@CrossOrigin
@RestController(value = "eventAPIOfWeb")
public class EventAPI {
	private EventService es = new EventService();
	
	@GetMapping("/api/public/event/upcoming")
	public List<EventDTO> findAllForWeb() {
		List<EventDTO> events = es.findAllForWeb();
		return events;
	}
	
	@GetMapping("/api/public/event/{id}")
	public EventDTO findEventById(@PathVariable("id") int id ) {
		EventDTO event = es.findEventById(id);
		return event;
	}
	
	@GetMapping("/api/public/event/fee/{id}")
	public Long getFee(@PathVariable("id") int id) {
		return es.getFee(id);
	}
}
