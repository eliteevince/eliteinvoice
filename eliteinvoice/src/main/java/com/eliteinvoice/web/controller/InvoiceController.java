package com.eliteinvoice.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eliteinvoice.core.model.Company;
import com.eliteinvoice.core.model.Customer;
import com.eliteinvoice.core.model.Invoice;
import com.eliteinvoice.core.model.InvoiceStatus;
import com.eliteinvoice.core.model.InvoiceType;
import com.eliteinvoice.core.model.Product;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.CompanyService;
import com.eliteinvoice.core.service.CustomerService;
import com.eliteinvoice.core.service.InvoiceService;
import com.eliteinvoice.core.service.InvoiceStatusService;
import com.eliteinvoice.core.service.InvoiceTypeService;
import com.eliteinvoice.core.service.ProductService;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {

	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CompanyService companyService;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private InvoiceTypeService invoiceTypeService;
	
	@Autowired
	private InvoiceStatusService invoiceStatusService;
	
	@Autowired
	private ProductService productService;

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		
		List<Invoice> invoices = invoiceService.findAll();
		model.addAttribute("invoices",invoices);
		return ViewConstants.VIEW_INVOICE;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String formPost(@ModelAttribute("invoice") Invoice invoice, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		
		User user = new User();
		user.setId(1);
		
		invoice.setCreatedBy(user);
		invoice.setModifiedBy(user);
		
		if (invoice.getId() == 0) {
			invoiceService.insert(invoice);
		} else {
			invoiceService.update(invoice);
		}
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("invoice.label") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/find-all")
	public @ResponseBody DataTablesResponse<Invoice> findAll(DataTablesRequest dataTablesRequest) {		
		Long resultCount = invoiceService.countAll();
		DataTablesResponse<Invoice> dataTablesResponse = new DataTablesResponse<Invoice>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(invoiceService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
		return dataTablesResponse;
	}

	/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	public @ResponseBody void delete(@PathVariable Integer id) {
		invoiceService.delete(id);		
	}*/
	
	@RequestMapping(method = RequestMethod.POST, value = "/delete")
	public @ResponseBody void delete(@RequestParam String values, ModelMap model) {
		invoiceService.delete(values);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/add")
	public String add(ModelMap model) {
		Invoice invoice = new Invoice();
		List<Customer> listCustomers = customerService.findAll();
		List<Company> listCompany = companyService.findAll();
		List<InvoiceType> invoiceTypes = invoiceTypeService.findAll();
		List<InvoiceStatus> invoicestatus = invoiceStatusService.findAll();
		model.addAttribute("invoicestatus",invoicestatus);
		model.addAttribute("invoiceTypes",invoiceTypes);
		model.addAttribute("listCustomers",listCustomers);
		model.addAttribute("listCompany",listCompany);
		model.addAttribute("invoice", invoice);
		model.addAttribute("action", "add");
		return ViewConstants.VIEW_INVOICE_FORM;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
	public String edit(@PathVariable Integer id, @ModelAttribute("invoice") Invoice invoice, ModelMap model) {
	//	Invoice invoice = invoiceService.findById(id);
		List<Customer> listCustomers = customerService.findAll();
		List<Company> listCompany = companyService.findAll();
		List<InvoiceType> invoiceTypes = invoiceTypeService.findAll();
		List<InvoiceStatus> invoicestatus = invoiceStatusService.findAll();
		
		List<Product> products = productService.findAll();
		for(Product product1 : products){
			System.out.println("Products Name ===" + product1.getName());
		}
		model.addAttribute("products", products);
		
		model.addAttribute("invoicestatus",invoicestatus);
		model.addAttribute("invoiceTypes",invoiceTypes);
		model.addAttribute("listCustomers",listCustomers);
		model.addAttribute("listCompany",listCompany);
		model.addAttribute("invoice", invoice);
		model.addAttribute("action", "edit");
		
		return ViewConstants.VIEW_INVOICE_FORM;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/view/{id}")
	public String view(@PathVariable Integer id, ModelMap model) {
		Invoice invoice = invoiceService.findById(id);
		List<Product> products = invoice.getProduct();
		model.addAttribute("products", products);
		model.addAttribute("invoice", invoice);
		return ViewConstants.VIEW_INVOICE_VIEW;
	}
	
}