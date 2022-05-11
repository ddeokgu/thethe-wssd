package com.ttcc.wssd.common.app.mapper.admin.setting.code;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface CodeMapper {

    List<Record> getCodeGroupAll();

    List<Record> codeList(Map paramMap);

    int codeCount();

    int codeCheck(Map paramMap);

    int channelCodeDeleteCheck(Map paramMap);

    void codeRegist(Map paramMap);

    void codeDelete(Map paramMap);

    void codeUpdate(Map paramMap);

    void codeUseYn(Map paramMap);

}