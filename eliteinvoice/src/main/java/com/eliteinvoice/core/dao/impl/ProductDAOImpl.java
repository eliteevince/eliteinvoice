package com.eliteinvoice.core.dao.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.ProductDAO;
import com.eliteinvoice.core.model.Product;

@Transactional
public class ProductDAOImpl extends EntityDAOImpl<Product> implements ProductDAO {
}