package com.eliteinvoice.core.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "customer")
public class Customer extends Entity implements Serializable{
	
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

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
	
	@JsonIgnore
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_customer_id", insertable = false, updatable = false, nullable = true, unique = true)
	@Fetch(value = FetchMode.SUBSELECT)
    private List<Invoice> invoice;
	 
	public List<Invoice> getInvoice() {
		return invoice;
	}

	public void setInvoice(List<Invoice> invoice) {
		this.invoice = invoice;
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

	public String getFirstname() {
		return this.firstName;
	}

	public void setFirstname(String firstname) {
		this.firstName = firstname;
	}

	public String getLastname() {
		return this.lastName;
	}

	public void setLastname(String lastname) {
		this.lastName = lastname;
	}
}
