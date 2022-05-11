package com.ttcc.wssd.common.security;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;

import java.awt.*;
import java.util.List;
import java.util.*;

@Getter
@Setter
@ToString
public class UserInfo implements CredentialsContainer, UserDetails {

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private Collection<GrantedAuthority> authorities = new TreeSet<GrantedAuthority>();

	private List<String> provideServices;

	private final boolean accountNonExpired;

	private final boolean accountNonLocked;

	private final boolean credentialsNonExpired;

	private boolean enabled = true;
	
	//private String memberId;
	//private String memberPass;
	private String loginOk;
	private boolean memberPassComp;
	

	private String id;
	private String password;
	private String mbType;
	private String registDate;
	private String name;
	private String gender;
	private String birth;
	private String school;
	private String grade;
	private String zip;
	private String address;
	private String phone;
	private String funnelType;
	private String funnelDes;
	private String regDate;
	private String mbCd;				// 회원 코드
	private String mbEmail;				// 회원 이메일
	private String mbIsPermit;			// 가입 승인여부
	private String mbrGrpCd;			// 회원 그룹코드
	private String mbNicknm;
	private String useYn;
	private byte mbIsLive;				// 사용(탈퇴) 여부
	private byte mbIsSleep;				// 휴면계정 여부
	private int authGroupSeq;			// 관리자 메뉴 권한
	private int managerSeq;
	


	//사용자 메뉴 Map
	private Map allowedMenuMap = new HashMap<String, ArrayList<MenuItem>>();

	private String encryptKey;


	public UserInfo() {
		System.out.println("@@@@@@");
		this.accountNonExpired = true;
		this.accountNonLocked = true;
		this.credentialsNonExpired = true;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return this.accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return this.accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}

	@Override
	public void eraseCredentials() {
		this.password = "";
	}

	public String getPassword() { return this.password; }
}
