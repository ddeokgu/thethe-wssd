package com.ttcc.wssd.common.security.authentication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttcc.wssd.common.app.mapper.LoginMapper;
import com.ttcc.wssd.common.security.UserInfo;


@Service
public class MenuLoaderService {

	@Autowired
	private LoginMapper loginMapper;

	public List setUserMenu(UserInfo user) {
		return loginMapper.Manager_Menu_S4_Str(user.getAuthGroupSeq());
	}
	
}

