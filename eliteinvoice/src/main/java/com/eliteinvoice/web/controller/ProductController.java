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

import com.eliteinvoice.core.model.Product;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.ProductService;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products",products);
		return ViewConstants.VIEW_PRODUCTS;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String formPost(@ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		
		User user = new User();
		user.setId(1);
		
		product.setCreatedBy(user);
		product.setModifiedBy(user);
		
		if (product.getId() == 0) {
			productService.insert(product);
		} else {
			productService.update(product);
		}
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("products.label.product") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/find-all")
	public @ResponseBody DataTablesResponse<Product> findAll(DataTablesRequest dataTablesRequest) {
		Long resultCount = productService.countAll();
		DataTablesResponse<Product> dataTablesResponse = new DataTablesResponse<Product>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(productService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
		return dataTablesResponse;
	}

	/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	public @ResponseBody void delete(@PathVariable Integer id) {
		productService.delete(id);	
	}*/
	
	@RequestMapping(method = RequestMethod.POST, value = "/delete")
	public @ResponseBody void delete(@RequestParam String values, ModelMap model) {
		productService.delete(values);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/add")
	public String add(ModelMap model) {
		Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("action", "add");
		return ViewConstants.VIEW_PRODUCT_FORM;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
	public String edit(@PathVariable Integer id, ModelMap model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		model.addAttribute("action", "edit");
		return ViewConstants.VIEW_PRODUCT_FORM;
	}
}