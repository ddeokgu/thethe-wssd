package com.ttcc.wssd.common.app.service.admin.attendance;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface AttendanceService {

    int attendanceCount(Map paramMap);

    List<Record> attendanceList(Map paramMap);

    List<Record> attendanceCheckList(Map paramMap);

    Map userAttendance(Map paramMap);

    List<Record> userAttendanceList(Map paramMap);

    void attendanceUpdate(Map paramMap);

    void attendanceSeatUpdate(Map paramMap);


}
