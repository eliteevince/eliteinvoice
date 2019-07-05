package com.eliteinvoice.core.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.InvoiceDAO;
import com.eliteinvoice.core.model.Invoice;

@Transactional
public class InvoiceDAOImpl extends EntityDAOImpl<Invoice> implements InvoiceDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Invoice> findAll(int limitStart, int limitEnd, int id) {
		Query query = entityManager.createQuery("FROM " + this.entityClass.getName() + " where deleted = 0 and fk_customer_id = "+ id +" ORDER BY id DESC");
		query.setFirstResult(limitStart);
		query.setMaxResults(limitEnd);
		return query.getResultList();
	}

	@Override
	public Long countAll(int id) {
		return (Long) entityManager.createQuery(" SELECT count(*) from " + this.entityClass.getName() + " where deleted = 0 and fk_customer_id = "+ id).getSingleResult();
	}

	
}
