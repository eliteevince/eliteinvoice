package com.eliteinvoice.web.controller;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.eliteinvoice.web.ViewConstants;

@Controller
public class IndexController {	
	
	@RequestMapping(value = { "", "/" }, method = RequestMethod.GET)
	public String login(ModelMap model) {
		return ViewConstants.LOGIN;
	}
	
	@RequestMapping(value = { "", "/dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap model) {
		return ViewConstants.VIEW_DASHBOARD;
	}

	@RequestMapping(value = "/setSessionLanguageCode", method = RequestMethod.POST)
	public String setSessionLanguage(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		String sessionLanguageCode = request
				.getParameter("sessionLanguageCode");
		String redirectUrl = request.getParameter("redirectUrl");

		LocaleResolver localeResolver = RequestContextUtils
				.getLocaleResolver(request);
		localeResolver.setLocale(request, response, new Locale(
				sessionLanguageCode));

		Cookie languageCodeCookie = new Cookie("ELITEINVOICE_LANGUAGECODE",
				sessionLanguageCode);
		languageCodeCookie.setMaxAge(60 * 60 * 24 * 365); // Store cookie for 1
															// year response.
		response.addCookie(languageCodeCookie);

		return "redirect:" + redirectUrl;
	}
}