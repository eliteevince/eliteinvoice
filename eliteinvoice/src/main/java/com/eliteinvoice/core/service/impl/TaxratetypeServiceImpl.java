package com.eliteinvoice.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.eliteinvoice.core.dao.TaxratetypeDAO;
import com.eliteinvoice.core.model.Taxratetype;
import com.eliteinvoice.core.service.TaxratetypeService;

public class TaxratetypeServiceImpl implements TaxratetypeService {

	@Autowired
	private TaxratetypeDAO taxratetypeDAO;
	
	@Override
	public List<Taxratetype> findAll() {
		return taxratetypeDAO.findAll();
	}

}
