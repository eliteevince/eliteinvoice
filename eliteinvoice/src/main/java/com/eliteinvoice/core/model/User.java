package com.eliteinvoice.core.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "user")
public class User extends SuperEntity {
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "password")
	private String password;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_role_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Role role;
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}