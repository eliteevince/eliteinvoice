package com.eliteinvoice.core.dao;

import java.util.List;
import com.eliteinvoice.core.model.InvoiceStatus;

public interface InvoiceStatusDAO {
	public List<InvoiceStatus> findAll();
}
