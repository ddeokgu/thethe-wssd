package com.ttcc.wssd.common.app.mapper.user.attendance;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserAttendanceMapper {

    List<Record> userAttendanceList(Map paramMap);

}