package com.ttcc.wssd.common.app.mapper.admin.attendance;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AttendanceMapper {

    int attendanceCount(Map paramMap);

    List<Record> attendanceList(Map paramMap);

    List<Record> attendanceCheckList(Map paramMap);

    Map userAttendance(Map paramMap);

    List <Record> userAttendanceList(Map paramMap);

    void attendanceUpdate(Map paramMap);

    void attendanceSeatUpdate(Map paramMap);

}