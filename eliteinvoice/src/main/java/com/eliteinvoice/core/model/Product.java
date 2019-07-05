package com.eliteinvoice.core.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Table;

@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "product")
public class Product extends Entity implements Serializable {

	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private int price;    

	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}