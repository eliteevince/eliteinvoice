package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.InvoiceItemDAO;
import com.eliteinvoice.core.model.InvoiceItem;
import com.eliteinvoice.core.service.InvoiceItemService;

public class InvoiceItemServiceImpl extends EntityServiceImpl<InvoiceItem> implements InvoiceItemService {

	@Autowired
	private InvoiceItemDAO invoiceItemDAO;
	
	@Override
	public void delete(int id) {
		invoiceItemDAO.delete(id);
	}

	@Override
	public List<InvoiceItem> findAllItem() {
		return invoiceItemDAO.findAllItem();
	}

	@Override
	public InvoiceItem findByIdItem(int id) {
		return invoiceItemDAO.findByIdItem(id);
	}

}
