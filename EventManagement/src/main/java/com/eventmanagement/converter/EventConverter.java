package com.eventmanagement.converter;

import com.eventmanagement.dto.EventDTO;
import com.eventmanagement.entity.EventEntity;

public class EventConverter {
	public EventEntity toEntity(EventDTO eventdto) {
		EventEntity result = new EventEntity(eventdto.getEventId());
		result.setName(eventdto.getName());
		result.setStartDate(eventdto.getStartDate());
		result.setStartTime(eventdto.getStartTime());
		result.setEndDate(eventdto.getEndDate());
		result.setEndTime(eventdto.getEndTime());
		result.setVenuename(eventdto.getVenuename());
		result.setFee(eventdto.getFee());
		result.setDescription(eventdto.getDescription());
		result.setTickets(eventdto.getTickets());
		result.setSold(eventdto.getSold());
		result.setStatus(eventdto.getStatus());
		result.setHeader(eventdto.getHeader());
		result.setAdvancedDetails(eventdto.getAdvancedDetails());
		result.setMap(eventdto.getMap());;
		return result;
	}
	
	public EventDTO toDTO(EventEntity evententity) {
		EventDTO result = new EventDTO();
		result.setEventId(evententity.getEventId());
		result.setName(evententity.getName());
		result.setStartDate(evententity.getStartDate());
		result.setStartTime(evententity.getStartTime());
		result.setEndDate(evententity.getEndDate());
		result.setEndTime(evententity.getEndTime());
		result.setVenuename(evententity.getVenuename());
		result.setFee(evententity.getFee());
		result.setDescription(evententity.getDescription());
		result.setTickets(evententity.getTickets());
		result.setSold(evententity.getSold());
		result.setStatus(evententity.getStatus());
		result.setHeader(evententity.getHeader());
		result.setAdvancedDetails(evententity.getAdvancedDetails());
		result.setMap(evententity.getMap());
		return result;
	}
}
