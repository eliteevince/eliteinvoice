package com.eliteinvoice.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.RoleDAO;
import com.eliteinvoice.core.model.Role;

@Transactional
public class RoleDAOImpl implements RoleDAO{

		@PersistenceContext
		private EntityManager entityManager;
		
		@Override
		public List<Role> findAll() {
			return entityManager.createQuery("SELECT t FROM Role t", Role.class).getResultList();
		}

}
