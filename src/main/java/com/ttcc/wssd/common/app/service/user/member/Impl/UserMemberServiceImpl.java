package com.ttcc.wssd.common.app.service.user.member.Impl;

import com.ttcc.wssd.common.app.mapper.user.member.UserMemberMapper;
import com.ttcc.wssd.common.app.service.user.member.UserMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Slf4j
@Service
@Transactional
public class UserMemberServiceImpl implements UserMemberService {

    @Autowired
    private UserMemberMapper userMemberMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public int checkLoginId(Map paramMap) { return userMemberMapper.checkLoginId(paramMap);}

    public int checkPassword(Map paramMap) { return userMemberMapper.checkPassword(paramMap);}

    public void insertMember(Map paramMap){
        userMemberMapper.insertMember(paramMap);
    }

    public int Chk_Is_Id_Using_S1_Str(Map paramMap){
        return userMemberMapper.Chk_Is_Id_Using_S1_Str(paramMap);
    }

    public void updatePassword(Map paramMap){
        paramMap.replace("password", passwordEncoder.encode((String)paramMap.get("password")));
        userMemberMapper.updatePassword(paramMap);
    }

    public void updateProfile(Map paramMap) {
        userMemberMapper.updateProfile(paramMap);
    }

    @Override
    public void userPasswordUpdate(Map paramMap) {
        userMemberMapper.userPasswordUpdate(paramMap);
    }

    public Map<String, Object> getUserProfile(Map paramMap) {
        return userMemberMapper.getUserProfile(paramMap);
    }
}
