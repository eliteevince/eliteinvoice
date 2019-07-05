package com.eliteinvoice.core.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@MappedSuperclass
public abstract class Entity extends SuperEntity implements Serializable  {

	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "created_by", insertable = true, updatable = true, nullable = true, unique = true)
	private User createdBy;	
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "modified_by", insertable = true, updatable = true, nullable = true, unique = true)
	private User modifiedBy;
	
	public User getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	
	public User getModifiedBy() {
		return this.modifiedBy;
	}
	
	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
}