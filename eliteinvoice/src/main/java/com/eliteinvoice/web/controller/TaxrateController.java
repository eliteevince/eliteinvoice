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

import com.eliteinvoice.core.model.Taxrate;
import com.eliteinvoice.core.model.Taxratetype;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.TaxrateService;
import com.eliteinvoice.core.service.TaxratetypeService;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/taxrate")
public class TaxrateController {

	@Autowired
	private TaxrateService taxrateService;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private TaxratetypeService taxratetypeService;

	@RequestMapping(method = RequestMethod.GET)
	public String display(ModelMap model) {
		
		List<Taxrate> taxrates = taxrateService.findAll();
		model.addAttribute("taxrates",taxrates);
		return ViewConstants.VIEW_TAXRATE;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String formPost(@ModelAttribute("taxrate") Taxrate taxrate, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
		MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
		
		User user = new User();
		user.setId(1);
		
		taxrate.setCreatedBy(user);
		taxrate.setModifiedBy(user);
		
		if (taxrate.getId() == 0) {
			taxrateService.insert(taxrate);
		} else {
			taxrateService.update(taxrate);
		}
		model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("taxrate.label") }));
		return display(model);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/find-all")
	public @ResponseBody DataTablesResponse<Taxrate> findAll(DataTablesRequest dataTablesRequest) {		
		Long resultCount = taxrateService.countAll();
		DataTablesResponse<Taxrate> dataTablesResponse = new DataTablesResponse<Taxrate>(dataTablesRequest.getsEcho(), resultCount);
		dataTablesResponse.setAaData(taxrateService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
		return dataTablesResponse;
	}

	/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	public @ResponseBody void delete(@PathVariable Integer id) {
		taxrateService.delete(id);		
	}*/
	
	@RequestMapping(method = RequestMethod.POST, value = "/delete")
	public @ResponseBody void delete(@RequestParam String values, ModelMap model) {
		taxrateService.delete(values);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/add")
	public String add(ModelMap model) {
		Taxrate taxrate = new Taxrate();
		List<Taxratetype> taxratetype = taxratetypeService.findAll();
		model.addAttribute("taxratetypelist",taxratetype);
		model.addAttribute("taxrate", taxrate);
		model.addAttribute("acrtion", "add");
		return ViewConstants.VIEW_TAXRATE_FORM;
	}
	@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
	public String edit(@PathVariable Integer id, ModelMap model) {
		Taxrate taxrate = taxrateService.findById(id);
		List<Taxratetype> taxratetype = taxratetypeService.findAll();
		model.addAttribute("taxratetypelist",taxratetype);
		model.addAttribute("taxrate", taxrate);
		model.addAttribute("action", "edit");
		return ViewConstants.VIEW_TAXRATE_FORM;
	}
}