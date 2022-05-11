package com.ttcc.wssd.common.app.mapper.admin.regist;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AdminRegistMapper {

    List<Record> adminRegistList(Map paramMap);

    int adminRegistCount();

    void adminRegistInsert(Map paramMap);

    void adminRegistUpdate(Map paramMap);

    void adminRegistDelete(Map paramMap);

    void registSeatUpdate(Map paramMap);

    void registCancelUpdate(Map paramMap);

    List<Record> getMemberCd(Map paramMap);

    List<Record> adminSearchMuId(Map paramMap);
}