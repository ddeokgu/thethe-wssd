package com.ttcc.wssd.common.app.mapper.admin.scheduler;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SchedulerMapper {

    List<Record> getUserList(Map paramMap);

    List<Record> getAttendanceList(Map paramMap);

}