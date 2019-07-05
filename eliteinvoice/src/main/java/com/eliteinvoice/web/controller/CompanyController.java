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
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.CompanyService;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/companies")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		
		List<Company> companies = companyService.findAll(); 
		model.addAttribute("companies", companies);
		return ViewConstants.VIEW_COMPANIES;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String formPost(@ModelAttribute("company") Company company, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		
		User user = new User();
		user.setId(1);
		
		company.setCreatedBy(user);
		company.setModifiedBy(user);
		
		if (company.getId() == 0) {
			companyService.insert(company);
		} else {
			companyService.update(company);
		}
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("companies.label.company") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/find-all")
	public @ResponseBody DataTablesResponse<Company> findAll(DataTablesRequest dataTablesRequest) {		
		Long resultCount = companyService.countAll();
		DataTablesResponse<Company> dataTablesResponse = new DataTablesResponse<Company>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(companyService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
		return dataTablesResponse;
	}

	/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	public @ResponseBody void delete(@PathVariable Integer id) {
		companyService.delete(id);		
	}*/
	
	@RequestMapping(method = RequestMethod.POST, value = "/delete")
	public @ResponseBody String delete(@RequestParam String values, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		System.out.println("====================In Controller===================");
		System.out.println("ids========"+values);
		companyService.delete(values);
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("companies.label.company") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/add")
	public String add(ModelMap model) {
		Company company = new Company();
		model.addAttribute("company", company);
		model.addAttribute("action", "add");
		return ViewConstants.VIEW_COMPANY_FORM;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
	public String edit(@PathVariable Integer id, ModelMap model) {
		Company company = companyService.findById(id);
		model.addAttribute("company", company);
		model.addAttribute("action", "edit");
		return ViewConstants.VIEW_COMPANY_FORM;
	}
}