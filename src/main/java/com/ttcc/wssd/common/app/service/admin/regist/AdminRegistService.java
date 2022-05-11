package com.ttcc.wssd.common.app.service.admin.regist;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface AdminRegistService {

 List<Record> registList(Map paramMap);

 int registCount();

 void adminRegistInsert(Map paramMap);

 void adminRegistUpdate(Map paramMap);

 void adminRegistDelete(Map paramMap);

 void registSeatUpdate(Map paramMap);

 void registCancelUpdate(Map paramMap);

 List<Record> getMemberCd(Map paramMap);

 List<Record> adminSearchMuId(Map paramMap);

}
