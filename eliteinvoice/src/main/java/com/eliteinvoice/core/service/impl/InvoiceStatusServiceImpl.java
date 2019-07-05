package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.InvoiceStatusDAO;
import com.eliteinvoice.core.model.InvoiceStatus;
import com.eliteinvoice.core.service.InvoiceStatusService;

public class InvoiceStatusServiceImpl implements InvoiceStatusService {

	@Autowired
	private InvoiceStatusDAO invoiceStatusDAO;
	
	@Override
	public List<InvoiceStatus> findAll() {
		return invoiceStatusDAO.findAll();
	}

}
