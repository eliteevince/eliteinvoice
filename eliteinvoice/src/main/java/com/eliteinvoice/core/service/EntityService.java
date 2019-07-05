package com.eliteinvoice.core.service;

import java.util.List;

public interface EntityService<T> {
	public T findById(int id);
	public List<T> findAll();
	public List<T> findAll(int limitStart, int limitEnd);
	public T insert(T t);
	public T update(T t);
	//public void delete(int id);
	public void delete(String id);
	public Long countAll();
}
