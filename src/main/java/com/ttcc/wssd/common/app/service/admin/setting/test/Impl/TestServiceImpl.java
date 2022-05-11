package com.ttcc.wssd.common.app.service.admin.setting.test.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.test.TestMapper;
import com.ttcc.wssd.common.app.service.admin.setting.test.TestService;
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
public class TestServiceImpl implements TestService {

    @Autowired
    TestMapper testMapper;

    @Override
    public int testCount(Map paramMap) {
        return testMapper.testCount(paramMap);
    }

    @Override
    public List<Record> testList(Map paramMap) {
        return testMapper.testList(paramMap);
    }

    @Override
    public void testRegist(Map paramMap) {
        testMapper.testRegist(paramMap);
    }

    @Override
    public void testDelete(Map paramMap) {
        testMapper.testDelete(paramMap);
    }

    @Override
    public void testUseYn(Map paramMap) {
        testMapper.testUseYn(paramMap);
    }

    @Override
    public void testUpdate(Map paramMap) {
        testMapper.testUpdate(paramMap);
    }
}
