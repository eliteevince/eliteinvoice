package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.EntityDAO;
import com.eliteinvoice.core.service.EntityService;

public class EntityServiceImpl<T> implements EntityService<T> {

	@Autowired
	private EntityDAO<T> entityDAO;

	@Override
	public T findById(int id) {
		return (T) entityDAO.findById(id);
	}

	@Override
	public List<T> findAll() {
		return entityDAO.findAll();
	}

	@Override
	public List<T> findAll(int limitStart, int limitEnd) {
		return entityDAO.findAll(limitStart, limitEnd);
	}
	
	@Override
	public T insert(T t) {
		return (T) entityDAO.insert(t);
	}

	@Override
	public T update(T t) {
		return (T) entityDAO.update(t);
	}
	
	/*@Override
	public void delete(int id) {
		entityDAO.delete(id);
	}*/
	
	@Override
	public void delete(String id) {
		entityDAO.delete(id);
	}
	
	
	@Override
	public Long countAll() {
		return entityDAO.countAll();
	}

	
}