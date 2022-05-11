
package com.ttcc.wssd.common.app.controller.admin.setting.room;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.app.service.admin.setting.room.RoomService;
import com.ttcc.wssd.common.app.service.admin.setting.seat.SeatService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.model.Record;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class RoomController extends CommonController {

    @Autowired
    RoomService roomService;
    @Autowired
    ChannelService channelService;
    @Autowired
    SeatService seatService;

    @RequestMapping("/setting/room.do")
    public String roomList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", roomService.roomCount());
        //paramMap.put("channelUseYn" , "Y");
        Map map = new HashMap();
        map.put("startIndex", 0);
        map.put("rowsPerPage", 100);
        model.addAttribute("channelList", channelService.channelList(map));
        model.addAttribute("list", roomService.roomList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/setting/room";
    }

    @ResponseBody
    @RequestMapping("/setting/roomOneList.do")
    public Map roomOneList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        Util.setPageInfo(paramMap);
        List<Record> list = roomService.roomList(paramMap);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/setting/roomRegist.do")
    public Map roomRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        String result = roomService.roomRegist(paramMap);
        paramMap.put("ROOM_CODE", result);
        int seat_count = Integer.parseInt(paramMap.get("SEAT_COUNT").toString());
        List<Integer> list = new ArrayList<>();
        for (int i = 1; i <= seat_count; i++) {
            list.add(i);
        }
        paramMap.put("seatNoList", list);
        seatService.seatRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/roomDelete.do")
    public Map roomDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        System.err.println("PARAMmAP = " + paramMap);
        paramMap.put("DLT_ID ", user.getId());
        roomService.roomDelete(paramMap);
        seatService.seatDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/roomUpdate.do")
    public Map roomUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("UPDATE_ID", user.getId());
        roomService.roomUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/roomUseYn.do")
    public Map roomUseYn(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        roomService.roomUseYn(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/seat.do")
    public Map seatList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        List<Record> list = seatService.seatList(paramMap);
        return JsonResponse.asSuccess("seatList", list);
    }

    @ResponseBody
    @RequestMapping("/setting/seatStatusUpdate.do")
    public Map seatStatusUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception{
        seatService.seatStatusUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/seatDeleteOne.do")
    public Map seatDeleteOne(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception{
        paramMap.put("ID", user.getId());
        seatService.seatDeleteOne(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/seatRegistOne.do")
    public Map seatRegistOne(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception{
        paramMap.put("REG_ID", user.getId());
        seatService.seatRegistOne(paramMap);
        return JsonResponse.asSuccess();
    }
}