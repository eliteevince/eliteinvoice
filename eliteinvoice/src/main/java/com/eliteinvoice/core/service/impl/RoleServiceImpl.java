package com.eliteinvoice.core.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.eliteinvoice.core.dao.RoleDAO;
import com.eliteinvoice.core.model.Role;
import com.eliteinvoice.core.service.RoleService;

public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDAO roleDAO;

	@Override
	public List<Role> findAll() {
		return roleDAO.findAll();
	}
}
