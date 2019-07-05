package com.eliteinvoice.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import com.eliteinvoice.core.dao.InvoiceStatusDAO;
import com.eliteinvoice.core.model.InvoiceStatus;

@Transactional
public class InvoiceStatusDAOImpl implements InvoiceStatusDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<InvoiceStatus> findAll() {
		return entityManager.createQuery("SELECT s FROM InvoiceStatus s", InvoiceStatus.class)
				.getResultList();
	}

}
