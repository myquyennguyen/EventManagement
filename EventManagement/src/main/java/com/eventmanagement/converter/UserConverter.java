package com.eventmanagement.converter;

import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.entity.RoleEntity;
import com.eventmanagement.entity.UserEntity;

public class UserConverter {
	public UserDTO toDTO(UserEntity userEntity) {
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userEntity.getUserId());
		userDTO.setUserName(userEntity.getUserName());
		userDTO.setPassword(userEntity.getPassword());
		userDTO.setFullName(userEntity.getFullName());
		userDTO.setAddress(userEntity.getAddress());
		userDTO.setPhoneNumber(userEntity.getPhoneNumber());
		return userDTO;
	}
	
	public UserEntity toEntity(UserDTO userDTO) {
		UserEntity result = new UserEntity(userDTO.getUserId());
		result.setUserName(userDTO.getUserName());
		result.setFullName(userDTO.getFullName());
		result.setAddress(userDTO.getAddress());
		result.setPassword(userDTO.getPassword());
		result.setPhoneNumber(userDTO.getPhoneNumber());
		result.setRole(new RoleEntity(userDTO.getRoleId()));
		return result;
	}
}
