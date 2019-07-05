package com.eliteinvoice.core.dao.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.CustomerDAO;
import com.eliteinvoice.core.model.Customer;

@Transactional
public class CustomerDAOImpl extends EntityDAOImpl<Customer> implements CustomerDAO{

}
