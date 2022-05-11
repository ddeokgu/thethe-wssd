package com.ttcc.wssd.common.app.service.admin.regist.Impl;

import com.ttcc.wssd.common.app.mapper.admin.regist.AdminRegistMapper;
import com.ttcc.wssd.common.app.service.admin.regist.AdminRegistService;
import com.ttcc.wssd.common.model.Record;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
public class AdminRegistServiceImpl implements AdminRegistService {

    @Autowired
    AdminRegistMapper adminRegistMapper;

    @Override
    public List<Record> registList(Map paramMap) {
        return adminRegistMapper.adminRegistList(paramMap);
    }

    @Override
    public int registCount() {
        return adminRegistMapper.adminRegistCount();
    }

    @Override
    public void adminRegistInsert(Map paramMap) {
        adminRegistMapper.adminRegistInsert(paramMap);
    }

    @Override
    public void adminRegistUpdate(Map paramMap) {
        adminRegistMapper.adminRegistUpdate(paramMap);
    }

    @Override
    public void adminRegistDelete(Map paramMap) {
        adminRegistMapper.adminRegistDelete(paramMap);
    }

    @Override
    public void registSeatUpdate(Map paramMap) {
        adminRegistMapper.registSeatUpdate(paramMap);
    }

    @Override
    public void registCancelUpdate(Map paramMap) {
        adminRegistMapper.registCancelUpdate(paramMap);
    }

    @Override
    public List<Record> getMemberCd(Map paramMap) {
        return adminRegistMapper.getMemberCd(paramMap);
    }

    @Override
    public List<Record> adminSearchMuId(Map paramMap) {
        return adminRegistMapper.adminSearchMuId(paramMap);
    }
}
