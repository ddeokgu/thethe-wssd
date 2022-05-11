package com.ttcc.wssd.common.app.service.user.attendance.Impl;

import com.ttcc.wssd.common.app.mapper.user.attendance.UserAttendanceMapper;
import com.ttcc.wssd.common.app.service.user.attendance.UserAttendanceService;
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
public class UserAttendanceServiceImpl implements UserAttendanceService {

    @Autowired
    UserAttendanceMapper userAttendanceMapper;


    @Override
    public List<Record> userAttendanceList(Map paramMap) {
        return userAttendanceMapper.userAttendanceList(paramMap);
    }
}
