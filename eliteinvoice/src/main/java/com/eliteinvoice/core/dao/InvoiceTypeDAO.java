package com.eliteinvoice.core.dao;

import java.util.List;
import com.eliteinvoice.core.model.InvoiceType;

public interface InvoiceTypeDAO {
	public List<InvoiceType> findAll();
}
