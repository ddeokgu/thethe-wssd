package com.ttcc.wssd.common.app.service.admin.scheduler;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface SchedulerService {

 List<Record> getUserList(Map paramMap);

 List<Record> getAttendanceList(Map paramMap);


}
