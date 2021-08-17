package com.eventmanagement.converter;

import com.eventmanagement.dto.RoleDTO;
import com.eventmanagement.entity.RoleEntity;

public class RoleConverter {
	
	public RoleDTO toDTO(RoleEntity roleEntity) {
		RoleDTO result = new RoleDTO();
		result.setRoleId(roleEntity.getRoleId());
		result.setRoleName(roleEntity.getRoleName());
		return result;
	}
	
	public RoleEntity toEntity(RoleDTO roleDTO) {
		RoleEntity result = new RoleEntity();
		result.setRoleId(roleDTO.getRoleId());
		result.setRoleName(roleDTO.getRoleName());
		return result;
	}
}
