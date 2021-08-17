package com.eventmanagement.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.eventmanagement.DAO.IRoleDAO;
import com.eventmanagement.entity.RoleEntity;
import com.eventmanagement.hibernate.HibernateUtils;

public class RoleDAO implements IRoleDAO{

	public RoleEntity findRoleById(int id) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		List<RoleEntity> result = new ArrayList<>();
		result = session.createQuery("FROM RoleEntity WHERE roleId = "+id).list();
		session.close();
		if(result != null) {
			return result.get(0);
		}
		return null;
	}
}
