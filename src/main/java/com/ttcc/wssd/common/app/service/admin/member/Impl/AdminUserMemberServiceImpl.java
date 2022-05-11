package com.ttcc.wssd.common.app.service.admin.member.Impl;

import com.ttcc.wssd.common.app.mapper.admin.member.AdminUserMemberMapper;
import com.ttcc.wssd.common.app.service.admin.member.AdminUserMemberService;
import com.ttcc.wssd.common.model.Record;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
public class AdminUserMemberServiceImpl implements AdminUserMemberService {

    @Autowired
    private AdminUserMemberMapper adminUserMemberMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public List<Record> adminUserMemberList(Map paramMap) {
        return adminUserMemberMapper.adminUserMemberList(paramMap);
    }

    @Override
    public int adminUserMemberCount(Map paramMap) {
        return adminUserMemberMapper.adminUserMemberCount(paramMap);
    }

    @Override
    public int adminUserMemberDeleteCheck(Map paramMap) {
        return adminUserMemberMapper.adminUserMemberDeleteCheck(paramMap);
    }

    @Override
    public void adminUserMemberDelete(Map paramMap) {
        adminUserMemberMapper.adminUserMemberDelete(paramMap);
    }
}
