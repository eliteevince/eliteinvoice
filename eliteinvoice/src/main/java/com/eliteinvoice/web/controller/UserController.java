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
import com.eliteinvoice.core.model.Role;
import com.eliteinvoice.core.model.User;
import com.eliteinvoice.core.service.RoleService;
import com.eliteinvoice.core.service.UserSerivce;
import com.eliteinvoice.web.ViewConstants;
import com.eliteinvoice.web.request.DataTablesRequest;
import com.eliteinvoice.web.response.DataTablesResponse;

@Controller
@RequestMapping("/users")
public class UserController {
	

		@Autowired
		private UserSerivce userService;

		@Autowired
		private RoleService roleService;
		
		@Autowired
		private MessageSource messageSource;

		@RequestMapping(method = RequestMethod.GET)
		public String display(ModelMap model) {
			List<User> users = userService.findAll();
			model.addAttribute("users", users);
			return ViewConstants.VIEW_USERS;
		}

		@RequestMapping(method = RequestMethod.POST)
		public String formPost(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request, HttpServletResponse response, ModelMap model) {		
			MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(messageSource);
			
			Role role = new Role();
			role.setId(1);
			
			user.setRole(role);
			
			if (user.getId() == 0) {
				userService.insert(user);
			} else {
				userService.update(user);
			}
			model.addAttribute("successMsg", messageSourceAccessor.getMessage("common.message.save.success", new String[] { messageSourceAccessor.getMessage("users.label.user") }));
			return display(model);
		}

		@RequestMapping(method = RequestMethod.GET, value = "/find-all")
		public @ResponseBody DataTablesResponse<User> findAll(DataTablesRequest dataTablesRequest) {		
			Long resultCount = userService.countAll();
			DataTablesResponse<User> dataTablesResponse = new DataTablesResponse<User>(dataTablesRequest.getsEcho(), resultCount);
			dataTablesResponse.setAaData(userService.findAll(dataTablesRequest.getiDisplayStart(), dataTablesRequest.getiDisplayLength()));
			return dataTablesResponse;
		}

		/*@RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
		public @ResponseBody void delete(@PathVariable Integer id) {
			userService.delete(id);		
		}*/
		
		@RequestMapping(method = RequestMethod.POST, value = "/delete")
		public @ResponseBody void delete(@RequestParam String values, ModelMap model) {
			userService.delete(values);
		}

		@RequestMapping(method = RequestMethod.GET, value = "/add")
		public String add(ModelMap model) {
			User user = new User();
			List<Role> role = roleService.findAll();
			model.addAttribute("role", role);
			model.addAttribute("user", user);
			model.addAttribute("action", "add");
			return ViewConstants.VIEW_USER_FORM;
		}

		@RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
		public String edit(@PathVariable Integer id, ModelMap model) {
			User user = userService.findById(id);
			List<Role> role = roleService.findAll();
			model.addAttribute("role", role);
			model.addAttribute("user", user);
			model.addAttribute("action", "edit");
			return ViewConstants.VIEW_USER_FORM;
		}
}
