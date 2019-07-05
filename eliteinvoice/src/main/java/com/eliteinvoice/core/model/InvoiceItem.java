package com.eliteinvoice.core.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="invoiceitem")
public class InvoiceItem {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "quantity")
	private int quantity;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_product_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Product product;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_taxrate_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Taxrate taxrate;
	
	@OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_invoice_id", insertable = true, updatable = true, nullable = true, unique = true)
	private Invoice invoice;
	
	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Taxrate getTaxrate() {
		return taxrate;
	}

	public void setTaxrate(Taxrate taxrate) {
		this.taxrate = taxrate;
	}

}
