package com.eliteinvoice.core.dao.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eliteinvoice.core.dao.UserDAO;
import com.eliteinvoice.core.model.User;

@Transactional
public class UserDAOImpl extends EntityDAOImpl<User> implements UserDAO {

}
