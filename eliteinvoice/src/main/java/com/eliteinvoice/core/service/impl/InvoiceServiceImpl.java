package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.InvoiceDAO;
import com.eliteinvoice.core.model.Invoice;
import com.eliteinvoice.core.service.InvoiceService;

public class InvoiceServiceImpl extends EntityServiceImpl<Invoice> implements InvoiceService {

	@Autowired
	private InvoiceDAO invoiceDAO;
	
	@Override
	public List<Invoice> findAll(int limitStart, int limitEnd, int id) {
		return invoiceDAO.findAll(limitStart, limitEnd, id);
	}

	@Override
	public Long countAll(int id) {
		return invoiceDAO.countAll(id);
	}

}
