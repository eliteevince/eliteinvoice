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

import com.eliteinvoice.core.model.Customer;
import com.eliteinvoice.core.model.Invoice;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.CustomerService;
import com.eliteinvoice.core.service.InvoiceService;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/customers")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		
		List<Customer> customers = customerService.findAll();
		model.addAttribute("customers",customers);
		
		return ViewConstants.VIEW_CUSTOMERS;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String formPost(@ModelAttribute("customer") Customer customer, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		
		User user = new User();
		user.setId(1);
		
		customer.setCreatedBy(user);
		customer.setModifiedBy(user);
		
		if (customer.getId() == 0) {
			customerService.insert(customer);
		} else {
			customerService.update(customer);
		}
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("customers.label.customer") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/find-all")
	public @ResponseBody DataTablesResponse<Customer> findAll(DataTablesRequest dataTablesRequest) {		
		Long resultCount = customerService.countAll();
		DataTablesResponse<Customer> dataTablesResponse = new DataTablesResponse<Customer>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(customerService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
		System.out.println("======================"+dataTablesRequest.getiDisplayStart());
		System.out.println("======================"+ dataTablesRequest.getiDisplayLength());
		return dataTablesResponse;
	}

	/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	public @ResponseBody void delete(@PathVariable Integer id) {
		customerService.delete(id);		
	}*/

	@RequestMapping(method = RequestMethod.POST, value = "/delete")
	public @ResponseBody void delete(@RequestParam String values, ModelMap model) {
		customerService.delete(values);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/add")
	public String add(ModelMap model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		model.addAttribute("action", "add");
		return ViewConstants.VIEW_CUSTOMER_FORM;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
	public String edit(@PathVariable Integer id, ModelMap model) {
		Customer customer = customerService.findById(id);
		model.addAttribute("customer", customer);
		model.addAttribute("action", "edit");
		return ViewConstants.VIEW_CUSTOMER_FORM;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/view/{id}")
	public String displayCustomer(@PathVariable Integer id, ModelMap model) {
		Customer customer = customerService.findById(id);
		for(Invoice invoice : customer.getInvoice())
		{
			System.out.println("Invoice Ref No. : " + invoice.getRefNo());
		}
		List<Invoice> invoicelist = customer.getInvoice();
		model.addAttribute("invoices",invoicelist);
		model.addAttribute("customer", customer);
		return ViewConstants.VIEW_CUSTOMER_VIEW;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/find/{id}")
	public @ResponseBody DataTablesResponse<Invoice> findAllinvoice(@PathVariable Integer id,DataTablesRequest dataTablesRequest) {		
		Customer customer = customerService.findById(id);
		List<Invoice> invoicelist = customer.getInvoice();
		for(Invoice invoice : invoicelist){
			System.out.println("ref no.................." + invoice.getRefNo());
		}
	//	Long resultCount = (long) invoicelist.size();
		Long resultCount = invoiceService.countAll(id);
		System.out.println("resultCount==============="+resultCount);
		DataTablesResponse<Invoice> dataTablesResponse = new DataTablesResponse<Invoice>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(invoiceService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength(),id));
		System.out.println("======================"+dataTablesRequest.getiDisplayStart());
		System.out.println("======================"+ dataTablesRequest.getiDisplayLength());
		return dataTablesResponse;
	}
}