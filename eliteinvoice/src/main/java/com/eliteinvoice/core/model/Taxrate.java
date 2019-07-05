package com.eliteinvoice.core.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "taxrate")
public class Taxrate extends Entity {

	@Column(name = "name")
	private String name;
	
	@Column(name = "rate")
	private int rate;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch=FetchType.EAGER)
	@JoinColumn(name = "fk_tax_rate_type_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Taxratetype taxratetype;
	
	@OneToOne(fetch=FetchType.EAGER,  cascade = CascadeType.PERSIST)
	@JoinColumn(name = "created_by", referencedColumnName="id",  insertable = false, updatable = false, nullable = true, unique = true)
	private User user;
	
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

	public Taxratetype getTaxratetype() {
		return this.taxratetype;
	}

	public void setTaxratetype(Taxratetype taxratetype) {
		this.taxratetype = taxratetype;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRate() {
		return this.rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

}
