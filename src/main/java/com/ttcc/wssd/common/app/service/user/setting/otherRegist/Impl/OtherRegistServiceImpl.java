package com.ttcc.wssd.common.app.service.user.setting.otherRegist.Impl;

import com.ttcc.wssd.common.app.mapper.user.setting.otherRegist.OtherRegistMapper;
import com.ttcc.wssd.common.app.service.user.setting.otherRegist.OtherRegistService;
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
public class OtherRegistServiceImpl implements OtherRegistService {

    @Autowired
    OtherRegistMapper otherRegistMapper;

    @Override
    public List<Record> otherRegistList(Map paramMap) {
        return otherRegistMapper.otherRegistList(paramMap);
    }

    @Override
    public List<Record> otherRegistHistoryList(Map paramMap) {

        return otherRegistMapper.otherRegistHistoryList(paramMap);
    }

    @Override
    public void otherRegistInsert(Map paramMap) {
        otherRegistMapper.otherRegistInsert(paramMap);
    }

    @Override
    public void otherRegistDelete(Map paramMap) {
        otherRegistMapper.otherRegistDelete(paramMap);
    }

    @Override
    public List<Record> otherRegistExcList(Map paramMap) {
        return otherRegistMapper.otherRegistExcList(paramMap);
    }

    @Override
    public List<Record> otherRegistExcHistoryList(Map paramMap) {
        return otherRegistMapper.otherRegistExcHistoryList(paramMap);
    }

    @Override
    public void otherRegistExcInsert(Map paramMap) {
        otherRegistMapper.otherRegistExcInsert(paramMap);
    }

    @Override
    public void otherRegistExcDelete(Map paramMap) {
        otherRegistMapper.otherRegistExcDelete(paramMap);
    }

    @Override
    public int otherRegistCount(Map paramMap) {
        return otherRegistMapper.otherRegistCount(paramMap);
    }

    @Override
    public int otherRegistHistoryCount(Map paramMap) {
        return otherRegistMapper.otherRegistHistoryCount(paramMap);
    }

    @Override
    public int otherRegistHistoryExcCount(Map paramMap) {
        return otherRegistMapper.otherRegistHistoryExcCount(paramMap);
    }


}
