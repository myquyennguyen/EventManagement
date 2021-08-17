package com.eventmanagement.DAO;

import java.util.List;

import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.UserEntity;

public interface IUserDAO {
	UserEntity createUser(UserEntity user);
	UserEntity findUserByUserId(int id);
	UserEntity findUserByUsername(String name);
	int registerEvent(String username, int eventId, int countTickets, Long countMoney);
	UserEntity updateUser(UserEntity user);
	List<CustomersDTO> listEvent(String username);
}
