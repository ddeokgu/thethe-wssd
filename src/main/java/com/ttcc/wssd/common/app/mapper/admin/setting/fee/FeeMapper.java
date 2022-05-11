package com.ttcc.wssd.common.app.mapper.admin.setting.fee;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface FeeMapper {

    List<Record> feeList(Map paramMap);

    int feeCount(Map paramMap);

    void feeRegist(Map paramMap);

    void feeDelete(Map paramMap);

    void feeUseYn(Map paramMap);

    void feeUpdate(Map paramMap);

}