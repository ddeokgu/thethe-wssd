package com.ttcc.wssd.common.app.service.admin.setting.fee.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.fee.FeeMapper;
import com.ttcc.wssd.common.app.service.admin.setting.fee.FeeService;
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
public class FeeServiceImpl implements FeeService {

    @Autowired
    FeeMapper feeMapper;

    @Override
    public List<Record> feeList(Map paramMap) {
        return feeMapper.feeList(paramMap);
    }

    @Override
    public void feeRegist(Map paramMap) {
        feeMapper.feeRegist(paramMap);
    }

    @Override
    public void feeDelete(Map paramMap) {
        feeMapper.feeDelete(paramMap);
    }

    @Override
    public void feeUseYn(Map paramMap) {
        feeMapper.feeUseYn(paramMap);
    }

    @Override
    public void feeUpdate(Map paramMap) {
        feeMapper.feeUpdate(paramMap);
    }

    @Override
    public int feeCount(Map paramMap) {
        return feeMapper.feeCount(paramMap);
    }
}
