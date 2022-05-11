package com.ttcc.wssd.common.security.authentication;

import com.ttcc.wssd.common.app.service.LoginService;
import com.ttcc.wssd.common.config.WebSecurityConfig;
import com.ttcc.wssd.common.security.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * UsernamePasswordAuthenticationFilter
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Qualifier("customUserDetailsService")
	@Autowired
	private UserDetailsService detailsService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MessageSource messageSource;

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MenuLoaderService menuLoaderService;

	private String pattern = "([a-z0-9\\w-]+\\.*)+[a-z0-9]{2,4}";

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String memberId = authentication.getName();
		UserInfo user = null;
		UserInfo muser = null;
		user = (UserInfo) loginService.loadUserByUsername(memberId);
		String password = authentication.getCredentials().toString();
		if(user == null) {
			throw new BadCredentialsException(messageSource.getMessage("fail.common.login", null, Locale.getDefault()));
		}else if(!passwordEncoder.matches(password, user.getPassword())){
			throw new BadCredentialsException(messageSource.getMessage("fail.common.pwd.diffrent", null, Locale.getDefault()));
		}

		List<GrantedAuthority> userAuthorities = new ArrayList<GrantedAuthority>();

		String mbName ="";

		//기본 role 을 세팅
		if(user.getMbType().equals("M")){
			muser = (UserInfo) loginService.masterInfo(user.getMbCd());
			System.err.println(muser.getManagerSeq());
			System.err.println("muser ::: " + muser);
			loginService.uptMbrAcsRec(user.getMbCd());
			user.setName(muser.getName());
			user.setAuthGroupSeq(muser.getAuthGroupSeq());
			user.setManagerSeq(muser.getManagerSeq());
			userAuthorities.add((GrantedAuthority)new SimpleGrantedAuthority("ROLE_ADMIN"));	//로그인어드민
			user.setAuthorities(userAuthorities);
			
			if("0".equals(muser.getUseYn())) {
				throw new BadCredentialsException(messageSource.getMessage("fail.common.login", null, Locale.getDefault()));
			}

			//권한별 메뉴 세팅
			user.getAllowedMenuMap().put(WebSecurityConfig.MASTER_MENU, menuLoaderService.setUserMenu(user));

		}
		else if(user.getMbType().equals("U")){
			mbName = user.getName();
			userAuthorities.add((GrantedAuthority)new SimpleGrantedAuthority("ROLE_USER"));	//로그인유저
			userAuthorities.add((GrantedAuthority)new SimpleGrantedAuthority("ROLE_USER_" + user.getMbType()));//유저 타입
			user.setAuthorities(userAuthorities);
		}else{
			throw new BadCredentialsException(messageSource.getMessage("fail.common.login", null, Locale.getDefault()));
		}
		return new UsernamePasswordAuthenticationToken(user, "", user.getAuthorities());
	}

}
