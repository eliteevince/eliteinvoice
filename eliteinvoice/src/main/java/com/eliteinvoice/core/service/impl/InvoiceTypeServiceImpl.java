package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.InvoiceTypeDAO;
import com.eliteinvoice.core.model.InvoiceType;
import com.eliteinvoice.core.service.InvoiceTypeService;

public class InvoiceTypeServiceImpl implements InvoiceTypeService {

	@Autowired
	private InvoiceTypeDAO invoiceTypeDAO;
	
	@Override
	public List<InvoiceType> findAll() {
		return invoiceTypeDAO.findAll();
	}

}
