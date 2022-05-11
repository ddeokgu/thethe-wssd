package com.ttcc.wssd.common.app.service.user.setting.regist.Impl;

import com.ttcc.wssd.common.app.mapper.user.setting.regist.RegistMapper;
import com.ttcc.wssd.common.app.service.user.setting.regist.RegistService;
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
public class RegistServiceImpl implements RegistService {

    @Autowired
    RegistMapper registMapper;

    @Override
    public List<Record> registList(Map paramMap) {
        return registMapper.registList(paramMap);
    }

    @Override
    public List<Record> feeList(Map paramMap) {
        return registMapper.feeList(paramMap);
    }

    @Override
    public List<Record> registSeatList(Map paramMap) {
        return registMapper.registSeatList(paramMap);
    }

    @Override
    public List<Record> registRoomList(Map paramMap) {
        return registMapper.registRoomList(paramMap);
    }


    @Override
    public String getRegistFirstDate(Map paramMap) {
        return registMapper.getRegistFirstDate(paramMap);
    }

    @Override
    public String roomSiteMapCheck(Map paramMap) {
        return registMapper.roomSiteMapCheck(paramMap); }

    @Override
    public int registCount(Map paramMap) {
        return registMapper.registCount(paramMap);
    }


    @Override
    public void registInsert(Map paramMap) {
        registMapper.registInsert(paramMap);
    }

    @Override
    public void seatInsert(Map paramMap) {
        registMapper.seatInsert(paramMap);
    }

    @Override
    public void attendanceInsert(Map paramMap) {
        registMapper.attendanceInsert(paramMap);
    }

    @Override
    public Map selectRegistOne(Map paramMap) {
        return registMapper.selectRegistOne(paramMap);
    }
}
