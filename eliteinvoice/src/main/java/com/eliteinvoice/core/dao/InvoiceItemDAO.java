package com.eliteinvoice.core.dao;

import java.util.List;

import com.eliteinvoice.core.model.InvoiceItem;

public interface InvoiceItemDAO extends EntityDAO<InvoiceItem>{
	
	public InvoiceItem findByIdItem(int id);
	public List<InvoiceItem> findAllItem();
	public void delete(int id);
}
