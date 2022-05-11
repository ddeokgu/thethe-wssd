package com.ttcc.wssd.common.app.mapper.admin.pay;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PayMapper {

    int payCount(Map paramMap);

    List<Record> payList(Map paramMap);

    Map payOneInfo(Map paramMap);

    String getPayCoode(Map paramMap);

    void payInsert(Map paramMap);

    void payCancelInsert(Map paramMap);

    void payCancelErrInsert(Map paramMap);

    void payCancelUpdate(Map paramMap);

}