package com.eliteinvoice.core.model;

import javax.persistence.Column;
import javax.persistence.Table;

@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "company")
public class Company extends Entity {

	@Column(name = "name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private int phone;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "country")
	private String country;
	
	@Column(name = "postcode")
	private String postcode;
	
	@Column(name = "logo_image")
	private String logoImage;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return this.phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getLogoImage() {
		return this.logoImage;
	}

	public void setLogoImage(String logoImage) {
		this.logoImage = logoImage;
	}
}