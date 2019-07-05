package com.eliteinvoice.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.TaxratetypeDAO;
import com.eliteinvoice.core.model.Taxratetype;

@Transactional
public class TaxratetypeDAOImpl implements TaxratetypeDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Taxratetype> findAll() {
		return entityManager.createQuery("SELECT t FROM Taxratetype t", Taxratetype.class)
				.getResultList();
	}
}
