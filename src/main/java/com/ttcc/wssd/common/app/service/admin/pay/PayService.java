package com.ttcc.wssd.common.app.service.admin.pay;

import com.ttcc.wssd.common.model.Record;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

public interface PayService {

    int payCount(Map paramMap);

    List<Record> payList(Map paramMap);

    Map payOneInfo(Map paramMap);

    Map<String, Object> Order_Temp_Process(Map paramMap, Map defaultMap) throws UnsupportedEncodingException;

    void payInsert(Map paramMap);

    void payCancelInsert(Map paramMap);

    void payCancelErrInsert(Map paramMap);

    void payCancelUpdate(Map paramMap);


}