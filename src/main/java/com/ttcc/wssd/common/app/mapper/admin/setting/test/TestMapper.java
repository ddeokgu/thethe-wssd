package com.ttcc.wssd.common.app.mapper.admin.setting.test;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface TestMapper {

    List<Record> testList(Map paramMap);

    int testCount(Map paramMap);

    void testRegist(Map paramMap);

    void testDelete(Map paramMap);

    void testUseYn(Map paramMap);

    void testUpdate(Map paramMap);

}