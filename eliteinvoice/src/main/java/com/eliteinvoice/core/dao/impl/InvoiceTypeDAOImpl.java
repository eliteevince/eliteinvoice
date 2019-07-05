package com.eliteinvoice.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import com.eliteinvoice.core.dao.InvoiceTypeDAO;
import com.eliteinvoice.core.model.InvoiceType;

@Transactional
public class InvoiceTypeDAOImpl implements InvoiceTypeDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<InvoiceType> findAll() {
		return entityManager.createQuery("SELECT it FROM InvoiceType it", InvoiceType.class)
				.getResultList();
	}

}
