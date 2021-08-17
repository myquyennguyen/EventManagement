package com.eventmanagement.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.eventmanagement.DAO.impl.RoleDAO;
import com.eventmanagement.DAO.impl.UserDAO;
import com.eventmanagement.converter.UserConverter;
import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.entity.RoleEntity;
import com.eventmanagement.entity.UserEntity;

public class UserService {
	
	private UserDAO userDAO = new UserDAO();
	private UserConverter userConverter = new UserConverter();
	
	public UserDTO createUser(UserDTO user) {
		UserDTO result = new UserDTO();
		RoleDAO roleDAO = new RoleDAO();
		RoleEntity role = roleDAO.findRoleById(user.getRoleId());
		UserEntity userEntity = userConverter.toEntity(user);
		userEntity.setRole(role);
		return userConverter.toDTO(userDAO.createUser(userEntity));
	}
	
	public UserDTO findUserByUsername(String username) {
		return userConverter.toDTO(userDAO.findUserByUsername(username));
	}
	
	public UserDTO updateUser(UserDTO user) {
		return userConverter.toDTO(userDAO.updateUser(userConverter.toEntity(user)));
	}
	
	
	public int registerEvent(String username, int eventId, int countTickets, Long countMoney) {
		return userDAO.registerEvent(username, eventId, countTickets, countMoney);
	}
	
	public List<CustomersDTO> listEventByUsername(String username) {
		return userDAO.listEvent(username);
	}
	
	public UserDTO changePasswordAdmin(String password) {
		UserEntity user = userDAO.findUserByUsername("admin");
		BCryptPasswordEncoder passwordEncode = new BCryptPasswordEncoder();
		user.setPassword(passwordEncode.encode(password));
		return userConverter.toDTO(userDAO.updateUser(user));
	}
}
