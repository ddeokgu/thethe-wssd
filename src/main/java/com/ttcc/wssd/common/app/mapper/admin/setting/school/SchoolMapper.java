package com.ttcc.wssd.common.app.mapper.admin.setting.school;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SchoolMapper {

    int schoolCount(Map paramMap);

    List<Record> schoolList(Map paramMap);

    List<Record> schoolVacationList(Map paramMap);

    void schoolRegist(Map paramMap);

    void schoolDelete(Map paramMap);

    void schoolVacationInsert(Map paramMap);

    void schoolVacationDelete(Map paramMap);

    void schoolUpdate(Map paramMap);

}