package com.ttcc.wssd.common.app.service;

import com.ttcc.wssd.common.app.mapper.LoginMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Slf4j
@Service
@Transactional
public class LoginService {

    @Autowired
    LoginMapper loginMapper;

    public UserDetails loadUserByUsername(String memberId) {
        System.err.println("service == " + memberId);
        UserDetails user = loginMapper.selectMemberInfo(memberId);
        return user;
    }

    public UserDetails loadSocialUserByUsername(String platform, String socialId) {
        return loginMapper.selectSocialMemberInfo(platform, socialId);
    }

    public UserDetails loadMaster(String memberId, String memberPass) {
        memberPass = BCrypt.hashpw(memberPass, BCrypt.gensalt());
        return loginMapper.selectMasterInfo(memberId, memberPass);
    }

    public String memberInfo(String mbCode, String mbType){
        return loginMapper.memberInfo(mbCode, mbType);
    }

    public UserDetails masterInfo(String mbCode){
        return loginMapper.masterInfo(mbCode);
    }

    public void updateLoginDate(String mbCd) { loginMapper.updateLoginDate(mbCd); }
/*
    public static String sha256(String msg) throws NoSuchAlgorithmException {
    	MessageDigest md = MessageDigest.getInstance("SHA-256");
    	md.update(msg.getBytes());

    	return bytestToHex(md.digest());
    }

    public static String bytestToHex(byte[] bytes) {
    	StringBuilder builder = new StringBuilder();
    	for(byte b : bytes){
    		builder.append(String.format("%02x", b));
    	}

    	return builder.toString();
    }*/

    public void uptMbrAcsRec(String mb_code){
        loginMapper.uptMbrAcsRec(mb_code);
    }

    public int uptMngAcsRec(String mbCode){
        return loginMapper.uptMngAcsRec(mbCode);
    }


    public void insertSocialLoginState(Map paramMap){
        loginMapper.insertSocialLoginState(paramMap);
    }

    public Map getSocialLoginState(String platform, String state){
        return loginMapper.getSocialLoginState(platform, state);
    }

    public void checkSocialLoginState(String platform, String state){
        loginMapper.checkSocialLoginState(platform, state);
    }

    public UserDetails loadUserByMbCd(String mbCd) {
        return loginMapper.selectMemberInfoByMbCd(mbCd);
    }

    public void updateSocialTokenInfo(Map paramMap){
        loginMapper.updateSocialTokenInfo(paramMap);
    }

}
