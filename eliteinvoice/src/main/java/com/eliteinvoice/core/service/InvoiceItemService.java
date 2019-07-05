package com.eliteinvoice.core.service;

import java.util.List;

import com.eliteinvoice.core.model.InvoiceItem;

public interface InvoiceItemService extends EntityService<InvoiceItem>{
	
	public InvoiceItem findByIdItem(int id);
	public List<InvoiceItem> findAllItem();
	public void delete(int id);
}
