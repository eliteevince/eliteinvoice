package com.eliteinvoice.core.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.EntityDAO;

@Transactional
@SuppressWarnings("unchecked")
public class EntityDAOImpl<T> implements EntityDAO<T> {

	protected Class<T> entityClass;
	
	@PersistenceContext
	protected EntityManager entityManager;

	public EntityDAOImpl(){
		Class<T> clazz = (Class<T>) getClass();
		Type type = clazz.getGenericSuperclass();		
		if (type instanceof ParameterizedType) {
			entityClass = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		}
	}
	
	@Override
	public T findById(int id) {
		return (T) entityManager.createQuery("FROM " + entityClass.getName() + " where deleted = 0 AND id=:id")
				.setParameter("id", id)
				.getSingleResult();
	}

	@Override
	public List<T> findAll() {
		return (List<T>) entityManager.createQuery("FROM " + entityClass.getName() + " where deleted = 0")
				.getResultList();
	}
	
	@Override
	public List<T> findAll(int limitStart, int limitEnd) {
		Query query = entityManager.createQuery("FROM " + this.entityClass.getName() + " where deleted = 0 ORDER BY id DESC");
		query.setFirstResult(limitStart);
		query.setMaxResults(limitEnd);
		return (List<T>) query.getResultList();
	}

	@Override
	public T insert(T t) {
		return entityManager.merge(t);
    }
	
	public T update(T t) {
		return entityManager.merge(t);
	}

	/*@Override
	public void delete(int id) {
		T t = findById(id);
		if (t != null) {	
			entityManager.createQuery(" update " + entityClass.getName() + " SET deleted = 1 where id =:id")
				.setParameter("id", id)
				.executeUpdate();			
		}
	}*/

	@Override
	public void delete(String id) {
			entityManager.createQuery(" update " + entityClass.getName() + " SET deleted = 1 where id in " +"("+id+")")
				.executeUpdate();
	}
	
	@Override
	public Long countAll() {
		return (Long) entityManager.createQuery(" SELECT count(*) from " + this.entityClass.getName() + " where deleted = 0").getSingleResult();
	}
}