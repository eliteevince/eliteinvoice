package com.eliteinvoice.core.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;


@SuppressWarnings("serial")
@javax.persistence.Entity
@Table(name = "invoice")
public class Invoice extends Entity implements Serializable{

	@Column(name = "ref_no")
	private String refNo;
	
	@Column(name = "date")
	private Date date;
	
	@Column(name = "due_date")
	private Date dueDate;
	
	@Column(name = "discount")
	private float discount;
	
	@Column(name = "shipping")
	private String shipping;
	
	@Column(name = "notes")
	private String notes;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_customer_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Customer customer;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_company_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Company company;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_invoice_type_id")
	private InvoiceType invoiceType; 
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_invoice_status_id")
	private InvoiceStatus invoiceStatus;
	
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinTable(
        name="invoice_product",
        joinColumns ={ @JoinColumn( name="fk_invoice_id", referencedColumnName="id")},
        inverseJoinColumns ={ @JoinColumn( name="fk_product_id", referencedColumnName="id")})
	private List<Product> product;
	
	@OneToOne(fetch=FetchType.EAGER,  cascade = CascadeType.PERSIST)
	@JoinColumn(name = "created_by", referencedColumnName="id",  insertable = false, updatable = false, nullable = true, unique = true)
	private User user;
	
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_invoice_id", insertable = false, updatable = false, nullable = true, unique = true)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<InvoiceItem> invoiceItem;
	
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Product> getProduct() {
		return this.product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	public InvoiceType getInvoiceType() {
		return this.invoiceType;
	}

	public void setInvoiceType(InvoiceType invoiceType) {
		this.invoiceType = invoiceType;
	}

	public InvoiceStatus getInvoiceStatus() {
		return this.invoiceStatus;
	}

	public void setInvoiceStatus(InvoiceStatus invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getRefNo() {
		return refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public float getDiscount() {
		return this.discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getShipping() {
		return this.shipping;
	}

	public void setShipping(String shipping) {
		this.shipping = shipping;
	}	
	
	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public List<InvoiceItem> getInvoiceItem() {
		return invoiceItem;
	}

	public void setInvoiceItem(List<InvoiceItem> invoiceItem) {
		this.invoiceItem = invoiceItem;
	}

}