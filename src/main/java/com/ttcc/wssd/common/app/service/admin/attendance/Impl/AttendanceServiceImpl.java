package com.ttcc.wssd.common.app.service.admin.attendance.Impl;

import com.ttcc.wssd.common.app.mapper.admin.attendance.AttendanceMapper;
import com.ttcc.wssd.common.app.service.admin.attendance.AttendanceService;
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
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    AttendanceMapper attendanceMapper;

    @Override
    public int attendanceCount(Map paramMap) {
        return attendanceMapper.attendanceCount(paramMap);
    }

    @Override
    public List<Record> attendanceList(Map paramMap) {
        return attendanceMapper.attendanceList(paramMap);
    }

    @Override
    public List<Record> attendanceCheckList(Map paramMap) {
        return attendanceMapper.attendanceCheckList(paramMap);
    }

    @Override
    public Map userAttendance(Map paramMap) {
        return attendanceMapper.userAttendance(paramMap);
    }

    @Override
    public List<Record> adminUserAttendanceList(Map paramMap) {
        return attendanceMapper.adminUserAttendanceList(paramMap);
    }

    @Override
    public void attendanceUpdate(Map paramMap) {
        attendanceMapper.attendanceUpdate(paramMap);
    }

    @Override
    public void attendanceSeatUpdate(Map paramMap) {
        attendanceMapper.attendanceSeatUpdate(paramMap);
    }
}
