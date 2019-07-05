package com.eliteinvoice.core.dao.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.TaxrateDAO;
import com.eliteinvoice.core.model.Taxrate;

@Transactional
public class TaxrateDAOImpl extends EntityDAOImpl<Taxrate> implements TaxrateDAO{

}
