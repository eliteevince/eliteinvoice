package com.eliteinvoice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class WebContextUtil {
	
	public static HttpServletRequest getRequest() {
	    ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	    return servletRequestAttributes.getRequest();
	}	
	
	public static HttpSession getSession() {
	    ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	    return servletRequestAttributes.getRequest().getSession(true);
	}
	
	public static boolean isSessionAlive() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		return servletRequestAttributes.getRequest().getSession(false) != null;
	}
	
	public static void invalidateSession() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = servletRequestAttributes.getRequest().getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}	

	public static Authentication getAuthentication() {
		Authentication authentication = null;
		SecurityContext context = SecurityContextHolder.getContext();
		if (context != null) {
			authentication = context.getAuthentication();
		}
		return authentication;
	}
}