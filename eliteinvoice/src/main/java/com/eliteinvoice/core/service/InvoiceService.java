package com.eliteinvoice.core.service;

import java.util.List;

import com.eliteinvoice.core.model.Invoice;

public interface InvoiceService extends EntityService<Invoice> {
	public List<Invoice> findAll(int limitStart, int limitEnd, int id);
	public Long countAll(int id);
}
