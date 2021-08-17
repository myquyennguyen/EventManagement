package com.eventmanagement.api.web;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.RegisterEventDTO;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.service.UserService;

@CrossOrigin
@RestController(value="UserAPIOfWeb")
public class UserAPI {
	UserService us = new UserService();
	
	@PostMapping("/api/user/create")
	public UserDTO createUser(@RequestBody UserDTO user) {
		user.setRoleId(2);
		BCryptPasswordEncoder password = new BCryptPasswordEncoder();
		user.setPassword(password.encode(user.getPassword()));
		UserDTO result = us.createUser(user);
		return result;
	}
	
	@PostMapping("/api/public/event/register")
	public int registerEvent(@RequestBody RegisterEventDTO register ) {
		return us.registerEvent(register.getUsername(), register.getEventId(), register.getCountTickets(), register.getCountMoney());
	}
	
	@PostMapping("/api/public/user/update")
	public UserDTO updateUser(@RequestBody UserDTO user) {
		return us.updateUser(user);
	}
}
