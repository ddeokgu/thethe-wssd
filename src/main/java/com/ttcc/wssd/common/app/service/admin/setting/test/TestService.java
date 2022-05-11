package com.ttcc.wssd.common.app.service.admin.setting.test;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface TestService {

    int testCount(Map paramMap);

    List<Record> testList(Map paramMap);

    void testRegist(Map paramMap);

    void testDelete(Map paramMap);

    void testUseYn(Map paramMap);

    void testUpdate(Map paramMap);


}
