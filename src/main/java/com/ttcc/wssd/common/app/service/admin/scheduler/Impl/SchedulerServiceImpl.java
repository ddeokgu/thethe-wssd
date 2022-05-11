package com.ttcc.wssd.common.app.service.admin.scheduler.Impl;

import com.ttcc.wssd.common.app.mapper.admin.scheduler.SchedulerMapper;
import com.ttcc.wssd.common.app.service.admin.scheduler.SchedulerService;
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
public class SchedulerServiceImpl implements SchedulerService {

    @Autowired
    SchedulerMapper schedulerMapper;


    @Override
    public List<Record> getUserList(Map paramMap) {
        return schedulerMapper.getUserList(paramMap);
    }

    @Override
    public List<Record> getAttendanceList(Map paramMap) {
        return schedulerMapper.getAttendanceList(paramMap);
    }
}
