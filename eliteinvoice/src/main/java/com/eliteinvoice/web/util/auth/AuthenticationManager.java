package com.eliteinvoice.web.util.auth;

import java.util.ArrayList;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.eliteinvoice.web.WebContextUtil;

@Service
public class AuthenticationManager implements AuthenticationProvider {
	
	@Override
	public boolean supports(final Class<?> clazz) {
		return true;
	}

	@Override
	public Authentication authenticate(final Authentication authentication)
			throws AuthenticationException {

		if (authentication.getName() == null || authentication.getCredentials() == null) {
			return null;
		}

		String username = authentication.getName();
		String password = authentication.getCredentials().toString();

		if (username.trim().length() == 0 || password.trim().length() == 0) {
			return null;
		}

		ArrayList<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		Authentication returnAuthentication = authentication;

		if (!authenticateUser(username, password)) {
			return null;
		}

		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

		WebContextUtil.getSession().setAttribute("username", username);
		returnAuthentication = new UsernamePasswordAuthenticationToken(username, password, grantedAuthorities);
		return returnAuthentication;
	}

	private boolean authenticateUser(String username, String password) {
		if (username.equals("admin") && password.equals("admin")) {
			return true;
		}
		return false;
	}
}