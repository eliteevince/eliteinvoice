package com.eliteinvoice.core.dao;

import java.util.List;

public interface EntityDAO<T> {
	public T findById(int id);
	public List<T> findAll();
	public List<T> findAll(int limitStart, int limitEnd);
	public T insert(T t);
	public T update(T t);
	//public void delete(int id);
	public Long countAll();
	public void delete(String id);
}