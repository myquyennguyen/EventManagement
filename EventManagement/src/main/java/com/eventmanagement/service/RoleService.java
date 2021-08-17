package com.eventmanagement.service;

import com.eventmanagement.DAO.impl.RoleDAO;
import com.eventmanagement.converter.RoleConverter;
import com.eventmanagement.dto.RoleDTO;
import com.eventmanagement.entity.RoleEntity;

public class RoleService {
	
	private RoleDAO roleDAO = new RoleDAO();
	private RoleConverter roleConverter = new RoleConverter();
	
	public RoleDTO findRoleById(int id) {
		RoleEntity result = roleDAO.findRoleById(id);
		return roleConverter.toDTO(result);
	}
}
