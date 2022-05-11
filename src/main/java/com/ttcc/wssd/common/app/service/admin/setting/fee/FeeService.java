package com.ttcc.wssd.common.app.service.admin.setting.fee;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface FeeService {

    List<Record> feeList(Map paramMap);

    void feeRegist(Map paramMap);

    void feeDelete(Map paramMap);

    void feeUseYn(Map paramMap);

    void feeUpdate(Map paramMap);

    int feeCount(Map paramMap);

}
