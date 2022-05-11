package com.ttcc.wssd.common.app.service.user.setting.otherRegist;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface OtherRegistService {

    List<Record> otherRegistList(Map paramMap);

    List<Record> otherRegistExcList(Map paramMap);

    List<Record> otherRegistHistoryList(Map paramMap);

    List<Record> otherRegistExcHistoryList(Map paramMap);

    void otherRegistInsert(Map paramMap);

    void otherRegistExcInsert(Map paramMap);

    void otherRegistDelete(Map paramMap);

    void otherRegistExcDelete(Map paramMap);

    int otherRegistCount(Map paramMap);

    int otherRegistHistoryCount(Map paramMap);

    int otherRegistHistoryExcCount(Map paramMap);

}
