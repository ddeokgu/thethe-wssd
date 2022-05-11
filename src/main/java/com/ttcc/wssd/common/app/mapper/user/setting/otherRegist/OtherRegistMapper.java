package com.ttcc.wssd.common.app.mapper.user.setting.otherRegist;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface OtherRegistMapper {

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