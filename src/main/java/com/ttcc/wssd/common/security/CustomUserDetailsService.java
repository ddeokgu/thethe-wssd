package com.ttcc.wssd.common.security;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	public UserDetails loadUserByUsername(String memberId) {
		return null;
	}

}
