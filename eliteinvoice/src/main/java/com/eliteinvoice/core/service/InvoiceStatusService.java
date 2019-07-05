package com.eliteinvoice.core.service;

import java.util.List;

import com.eliteinvoice.core.model.InvoiceStatus;

public interface InvoiceStatusService {
	public List<InvoiceStatus> findAll();
}
