package com.eventmanagement.api.admin;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.service.UserService;

@CrossOrigin
@RestController(value="UserAPIOfAdmin")
public class UserAPI {
	
	private UserService us = new UserService();
	
	@PostMapping(value="/api/admin/changePassword")
	public UserDTO changePassword(@RequestBody UserDTO user) {
		return us.updateUser(user);
	}
}
