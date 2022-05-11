package com.ttcc.wssd.common.app.service.user.attendance;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface UserAttendanceService {

    List<Record> userAttendanceList(Map paramMap);

}
