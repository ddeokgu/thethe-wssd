package com.ttcc.wssd.common.app.service.admin.setting.school;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface SchoolService {

    int schoolCount(Map paramMap);

    List<Record> schoolList(Map paramMap);

    List<Record> schoolVacationList(Map paramMap);

    void schoolRegist(Map paramMap);

    void schoolDelete(Map paramMap);

    void schoolVacationInsert(Map paramMap);

    void schoolVacationDelete(Map paramMap);

    void schoolUpdate(Map paramMap);

}
