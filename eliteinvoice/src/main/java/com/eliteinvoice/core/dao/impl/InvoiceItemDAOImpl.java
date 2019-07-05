package com.eliteinvoice.core.dao.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.InvoiceItemDAO;
import com.eliteinvoice.core.model.InvoiceItem;

@Transactional
public class InvoiceItemDAOImpl extends EntityDAOImpl<InvoiceItem> implements InvoiceItemDAO{

	@Override
	public void delete(int id) {
		System.out.println("In dao before query");
		entityManager.createQuery("DELETE FROM InvoiceItem where id = "+id).executeUpdate();
		System.out.println("id ==========" + id);
		System.out.println("In dao after query");
	}

	@Override
	public List<InvoiceItem> findAllItem() {
		return (List<InvoiceItem>) entityManager.createQuery("SELECT ii FROM InvoiceItem ii", InvoiceItem.class)
				.getResultList();
	}

	@Override
	public InvoiceItem findByIdItem(int id) {
		return entityManager.find(InvoiceItem.class, id);
	}

}
