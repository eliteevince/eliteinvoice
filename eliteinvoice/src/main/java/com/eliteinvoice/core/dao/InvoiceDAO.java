package com.eliteinvoice.core.dao;

import java.util.List;

import com.eliteinvoice.core.model.Invoice;

public interface InvoiceDAO extends EntityDAO<Invoice> {
	public List<Invoice> findAll(int limitStart, int limitEnd, int id);
	public Long countAll(int id);
}