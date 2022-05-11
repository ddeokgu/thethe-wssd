package com.ttcc.wssd.common.app.controller.admin.pay;


import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.pay.PayService;
import com.ttcc.wssd.common.app.service.admin.regist.AdminRegistService;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.InnopayUtil;
import com.ttcc.wssd.common.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/pay")
public class PaySettingController extends CommonController {

    @Autowired
    PayService payService;

    @Autowired
    AdminRegistService adminRegistService;

    @Autowired
    ChannelService channelService;

    @RequestMapping("/payList.do")
    public String payList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", payService.payCount(paramMap));
        model.addAttribute("list", payService.payList(paramMap));
        Map map = new HashMap();
        map.put("startIndex", 0);
        map.put("rowsPerPage", 100);
        model.addAttribute("channelList", channelService.channelList(map));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/pay/pay";
    }

    //// 결제 취소
    @ResponseBody
    @RequestMapping(value = "/payCancel.json", produces = "application/json; utf-8")
    public Map payCancel(@RequestBody Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {

        paramMap.put("mid", PG_MID);
        paramMap.put("cancelPwd", PG_CANCEL_KEY);
        System.err.println( "paramMap = = = = " + paramMap);
        Map payInfo = payService.payOneInfo(paramMap);

        String type = paramMap.get("svcCd").toString();

        Map returnMap = new HashMap();
        System.err.println("type = = = " + type);

        //// 신용카드 결제
        if (type != null && type.equals("01")) {
            System.err.println("신용카드");
            Map resultMap = InnopayUtil.innopayCancel(paramMap);

            String resultCode = resultMap.get("innopay_cancel_resultcode").toString();
            System.err.println("resultCode = = = " +resultCode);

            if(resultCode != null && resultCode.equals("2001")) {
                System.err.println("카드 취소 성공");
                payService.payCancelInsert(resultMap);
                adminRegistService.registCancelUpdate(resultMap);
                payService.payCancelUpdate(resultMap);
                returnMap.put("result", true);
            } else {
                System.err.println("카드 취소 실패");
                payService.payCancelErrInsert(resultMap);
                System.err.println( "messgae = = = = " + resultMap.get("innopay_cancel_resultmsg").toString());
                returnMap.put("result", false);
                returnMap.put("message", resultMap.get("innopay_cancel_resultmsg").toString());
            }
        }

        if (type != null && type.equals("02")) { //// 계좌이체 결제

            Map resultMap = InnopayUtil.innopayCancel(paramMap);

            String resultCode = resultMap.get("innopay_cancel_resultcode").toString();

            //// 취소 성공
            if(resultCode != null && resultCode.equals("2001")) {
                System.err.println("계좌이체 취소 성공");
                payService.payCancelInsert(resultMap);
                adminRegistService.registCancelUpdate(resultMap);
                payService.payCancelUpdate(resultMap);
                returnMap.put("result", true);

                //// 현금영수증 발행 시 취소
              /*  if(payInfo.get("PAY_CASH_BILL") != null && !payInfo.get("PAY_CASH_BILL").toString().equals("")) {

                    Map cashBilMap = new HashMap();
                    cashBilMap.put("svcCd", "04");  //// "04": 현금영수증
                    cashBilMap.put("mid", PG_MID);
                    cashBilMap.put("tid", payInfo.get("PAY_TID"));
                    cashBilMap.put("cancelAmt", paramMap.get("cancelAmt"));
                    cashBilMap.put("cancelMsg", "사용자 취소");
                    cashBilMap.put("cancelPwd", PG_CANCEL_KEY);

                    System.err.println("cashBil = = = " + cashBilMap);

                    Boolean result = cashbill_cancel(cashBilMap); //// 현금영수증 취소

                    //// 현금영수증 취소 성공
                    if(result) {
                        System.err.println("현금영수증 취소 성공");
                        payService.payCancelInsert(resultMap);
                        adminRegistService.registCancelUpdate(resultMap);
                        payService.payCancelUpdate(resultMap);
                        returnMap.put("result", true);

                    //// 현금영수증 취소 실패
                    } else {
                        System.err.println("현금영수증 취소 실패");
                        payService.payCancelInsert(resultMap);
                        adminRegistService.registCancelUpdate(resultMap);
                        payService.payCancelUpdate(resultMap);
                        returnMap.put("result", false);
                        returnMap.put("message", "현금영수증 취소 오류");
                    }

                //// 현금영수증 미발행 시 취소
                } else {
                    payService.payCancelInsert(resultMap);
                    adminRegistService.registCancelUpdate(resultMap);
                    payService.payCancelUpdate(resultMap);
                    returnMap.put("result", true);
                }*/


                //// 취소 실패
            } else {
                System.err.println("계좌이체 취소 실패");
                payService.payCancelErrInsert(resultMap);
                System.err.println( "message = = = = " + resultMap.get("innopay_cancel_resultmsg").toString());
                returnMap.put("result", false);
                returnMap.put("message", resultMap.get("innopay_cancel_resultmsg").toString());
            }
        }
        return returnMap;
    }

    //// 현금영수증 취소 api <--사용 안함
    public Boolean cashbill_cancel(Map paramMap){
        System.err.println("여기 paramMap = = = " + paramMap);

        Map result = new HashMap();
        try{
            result = InnopayUtil.innopayCashBillCancel(paramMap);
            if(!result.get("cashBill_resultCode").equals("2001") && result.get("cashBill_resultMsg") != null) {
                System.out.println("현금영수증 취소 오류 : " + result);
                return false;
            }
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
