package com.eliteinvoice.core.dao.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.CompanyDAO;
import com.eliteinvoice.core.model.Company;

@Transactional
public class CompanyDAOImpl extends EntityDAOImpl<Company> implements CompanyDAO{

}
