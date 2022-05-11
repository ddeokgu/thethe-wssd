<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-25
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-18
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<div class="area">
    <div class="inner typeScroll">
        <div class="cate">
            <div class="tit">출석부관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>출석부관리</span>
                <span class="bar"></span>
                <span>출석관리</span>
            </div>
        </div>
        <div class="cont">
            <div class="list attend_list">
                <form action="#" name="frmSearch2" id="form-search" method="post" class="clearfix">
                    <input type="hidden" name="currentPage" value="<c:out value='${pageInfo.currentPage}'/>"/>
                    <input type="hidden" name="rowsPerPage" value="<c:out value='${pageInfo.rowsPerPage}'/>"/>
                    <div class="list_tit">
                        <div class="list_srch list_srch_wide">
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchChannel" id="search_channel" onchange="goSearch();">
                                        <option value="">지점선택</option>
                                        <c:forEach items="${channelList}" var="row">
                                         <option value="${row.CHANNEL_CODE}" <c:if test="${pageInfo.searchChannel == row.CHANNEL_CODE}">selected="selected"</c:if>>${row.CHANNEL_NAME}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" ㄴ="" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchRoom" id="search_room" onchange="goSearch()">
                                        <option value="">호/실 선택</option>
                                        <c:forEach items="${roomList}" var="row">
                                            <option value="${row.ROOM_CODE}" <c:if test="${pageInfo.searchRoom == row.ROOM_CODE}">selected="selected"</c:if>>${row.ROOM_NAME}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" ㄴ="" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="srch_sel dan danAuto dan_r">
                                <div class="sel_type datePicker">
                                    <input type="text" id="attendace_date" name="DATE" class="picker_form datepicker" readonly="" onchange="goSearch();"><button type="button" class="ui-datepicker-trigger"><img src="/resources/main/admin/img/icon/calender_img.svg" alt="달력" title="달력"></button>
                                </div>
                            </div>
                            <div class="srch_form" style="display: none">
                                <button type="button" class="icon" onclick="goSearch(); return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                              transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                              fill="black"></path>
                                    </svg>
                                </button>
                                <input type="text" placeholder="Search" name="searchText" value="${pageInfo.searchText}">
                            </div>
                        </div>
                       <%-- <div class="list_tool">
                            <div class="tool_btn">
                                <button type="button" class="btn btn_01" onclick="modal_view(); return false;">
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus"
                                         width="20" height="20" viewBox="0 0 24 24" stroke-width="2"
                                         stroke="currentColor" fill="none" stroke-linecap="round"
                                         stroke-linejoin="round">
                                       <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                       <line x1="12" y1="5" x2="12" y2="19"></line>
                                       <line x1="5" y1="12" x2="19" y2="12"></line>
                                    </svg>
                                </span>
                                    <span>Add</span>
                                </button>
                            </div>
                        </div>--%>
                    </div>
                </form>
                <div class="list_detail">
                    <table class="table_type01">
                        <colgroup>
                            <col class="num" style="width: 35px">
                            <col >
                            <col style="width:50%" class="m_hide" >
                            <col class="m_hide" style="width:13%">
                            <col class="m_hide" style="width:13%">
                            <col style="width:8%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>성명</th>
                            <th class="m_hide">학교</th>
                            <th class="m_hide">등록일</th>
                            <th class="m_hide">핸드폰</th>
                            <th class="edit">관리</th>
                            <th class="m_show">더보기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <tr>
                                    <td class="none" colspan="6">등록된 출석부가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="row" varStatus="status">
                        <tr>
                            <td class="num"><c:out
                                    value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                            <td class="td_tit">
                                <span><c:out value="${row.MU_NAME}"></c:out></span>
                            </td>
                            <td class="m_hide">
                                <c:choose>
                                    <c:when test="${row.SCHOOL_NAME == null || row.SCHOOL_NAME == ''}">
                                        <span>성인반</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span><c:out value="${row.SCHOOL_NAME}${row.REGIST_MU_GRADE}"></c:out></span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="m_hide"><c:out value="${row.REGIST_FIRST_DATE}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.MU_PHONE}"></c:out></td>
                            <td class="edit">
                                <div class="action">
                                    <button type="button" class="sel_btn balance_btn" onclick="userAttendance('${row.ATTENDANCE_MU_CD}'); return false;">
                                        <span>출석부관리</span>
                                    </button>
                                </div>
                            </td>
                            <td class="m_show">
                                <a href="#" class="more">
                                             <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     class="icon icon-tabler icon-tabler-chevron-down" width="24"
                                                     height="24" viewBox="0 0 24 24" stroke-width="2"
                                                     stroke="currentColor" fill="none" stroke-linecap="round"
                                                     stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                </a>
                            </td>
                        </tr>
                        <tr class="tr_m_detail">
                            <td colspan="6">
                                <div class="more_box">
                                    <ul>
                                        <li>
                                            <span class="tit">학교</span>
                                            <c:choose>
                                                <c:when test="${row.SCHOOL_NAME == null || row.SCHOOL_NAME == ''}">
                                                    <span>성인반</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span><c:out value="${row.SCHOOL_NAME}${row.REGIST_MU_GRADE}"></c:out></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                        <li>
                                            <span class="tit">등록일</span>
                                            <span><c:out value="${row.REGIST_FIRST_DATE}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">핸드폰</span>
                                            <span><c:out value="${row.MU_PHONE}"></c:out></span>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <div class="list_control">
                        <div class="sel_count">
                            <div class="sel_type">
                                <select name="" id="count" onchange="rowsChange(this.value);">
                                    <option value="10" ${pageInfo.rowsPerPage == '10' ? 'selected' : ''}>10</option>
                                    <option value="25" ${pageInfo.rowsPerPage == '25' ? 'selected' : ''}>25</option>
                                    <option value="50" ${pageInfo.rowsPerPage == '50' ? 'selected' : ''}>50</option>
                                    <option value="100" ${pageInfo.rowsPerPage == '100' ? 'selected' : ''}>100</option>

                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24"
                                         viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="paging">
                            <a href="#" class="prev">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="icon icon-tabler icon-tabler-chevron-left" width="24" height="24"
                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="15 6 9 12 15 18"></polyline>
                                </svg>
                            </a>
                            <c:if test="${!empty list}">
                                ${dh:pagingA(pageInfo.totalCount, pageInfo.currentPage, pageInfo.rowsPerPage, 10)}
                            </c:if>
                            <a href="#" class="next">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="icon icon-tabler icon-tabler-chevron-right" width="24" height="24"
                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="9 6 15 12 9 18"></polyline>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<div class="add_modal attend_modal typeScroll" id="seat_modal">
    <div class="modal_bg" ></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    <span>출석부관리</span>
                </div>
                <div class="close">
                    <button type="button" onclick="attClose();return false;">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-x" width="24"
                                 height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                 stroke-linecap="round" stroke-linejoin="round">
                               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                               <line x1="18" y1="6" x2="6" y2="18"></line>
                               <line x1="6" y1="6" x2="18" y2="18"></line>
                            </svg>
                        </span>
                    </button>
                </div>
            </div>
            <div class="modal_body modal_address">
                <form id="form_attendance" name="formAttendance" method="post" action="/">
                    <input type ="hidden" id="modal_date" name="ATTENDANCE_DATE" value="">
                    <input type ="hidden" id="modal_mb_cd" name="ATTENDANCE_MU_CD" value="">
                    <input type = "hidden" id="modal_mb_room" name="ATTENDANCE_ROOM" value="">
                    <div class="modal_get">
                        <div class="attend_table">
                            <div class="att att_01">
                                <span class="att_tit">교시</span>
                                <ul>
                                    <li>1</li>
                                    <li>2</li>
                                    <li>3</li>
                                    <li>4</li>
                                    <li>점심</li>
                                    <li>5</li>
                                    <li>6</li>
                                    <li>7</li>
                                    <li>8</li>
                                    <li>9</li>
                                    <li>석식</li>
                                    <li>10</li>
                                    <li>11</li>
                                    <li>12</li>
                                    <li>13</li>
                                    <li>14</li>
                                    <li>15</li>
                                </ul>
                            </div>
                            <div class="att att_01">
                                <span class="att_tit">시간</span>
                                <ul>
                                    <li>8:00</li>
                                    <li>9:10</li>
                                    <li>10:10</li>
                                    <li>11:10</li>
                                    <li>12:00</li>
                                    <li>12:50</li>
                                    <li>14:00</li>
                                    <li>15:00</li>
                                    <li>16:00</li>
                                    <li>17:00</li>
                                    <li>17:45</li>
                                    <li>18:30</li>
                                    <li>19:30</li>
                                    <li>20:30</li>
                                    <li>21:30</li>
                                    <li>22:30</li>
                                    <li>23:25</li>
                                </ul>
                            </div>
                            <div class="att att_02" id="attendance_list">
                               <span class="att_tit" >출결</span>
                                    <ul>
                                     <li id="c0">
                                     </li>
                                     <li id="c1">
                                     </li>
                                     <li id="c2">
                                     </li>
                                     <li id="c3">
                                     </li>
                                     <li id="c4"></li>
                                     <li id="c5">
                                     </li>
                                     <li id="c6">
                                     </li>
                                     <li id="c7">
                                     </li>
                                     <li id="c8">
                                     </li>
                                     <li id="c9">
                                     </li>
                                     <li id="c10"></li>
                                     <li id="c11">
                                     </li>
                                     <li id="c12">
                                     </li>
                                     <li id="c13">
                                     </li>
                                     <li id="c14">
                                     </li>
                                     <li id="c15">
                                     </li>
                                     <li id="c16">
                                     </li>
                                 </ul>
                            </div>
                            <div class="att att_03">
                                <span class="att_tit">비고</span>
                                <ul>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C0_EXC" name="C0_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C1_EXC" name="C1_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C2_EXC" name="C2_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C3_EXC" name="C3_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C4_EXC" name="C4_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C5_EXC" name="C5_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C6_EXC" name="C6_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C7_EXC" name="C7_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C8_EXC" name="C8_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C9_EXC" name="C9_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C10_EXC" name="C10_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C11_EXC" name="C11_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C12_EXC" name="C12_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C13_EXC" name="C13_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C14_EXC" name="C14_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C15_EXC" name="C15_EXC" placeholder="">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="note_txt">
                                            <input type="text" id="C16_EXC" name="C16_EXC" placeholder="">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal_btn">
                            <button type="button" class="btn btn_01 btn_big" onclick="attendanceRegist(); return false;">
                                <span>저장</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    $(document).ready(function () {
        datepickerSetting("add");
        maxDateSet();
    });

    function datepickerSetting(set) {
        let setting = set;
        if($('input').hasClass('picker_form')) {
            $('input[id="attendace_date"]').each(function() {
                $(this).datepicker({
                    closeText: "닫기",
                    prevText: "이전달",
                    nextText: "다음달",
                    currentText: "오늘",
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"
                    ],
                    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"
                    ],
                    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                    weekHeader: "주",
                    dateFormat: 'yy-mm-dd',
                    firstDay: 0,
                    isRTL: false,
                    showMonthAfterYear: true,
                    yearSuffix: "년",
                    showOn: 'both',
                    buttonImage: '/resources/main/admin/img/icon/calender_img.svg',
                    buttonText: "달력"
                });
                if (setting == "add") {
                    if(${pageInfo.DATE == null} || ${pageInfo.DATE == ""}) {
                        $(this).datepicker("setDate", 'today');
                    } else {
                        $(this).datepicker("setDate", "${pageInfo.DATE}");
                    }
                }
            })
        }
    }

    function maxDateSet() {
        let today = new Date();
        let max_date_year =  today.getFullYear();
        let max_date_month = ("0" + (1 + today.getMonth())).slice(-2);
        let max_date_day = ("0" + today.getDate()).slice(-2);
        let max_date_set = max_date_year+"-"+max_date_month+"-"+max_date_day;
        $("#attendace_date").datepicker("option", "maxDate", max_date_set);
    }

    function modal_view() {
        $('#code_modal').addClass('view');
    }

    function modal_close() {
        document.forms['formChannel'].reset();
        let add_code = document.querySelector("#add_code").value;
        $(".modal_body #channel_code option[value="+"'"+add_code+"'"+"]").remove();
        $('#code_modal').removeClass('view');
    }
    function address_close() {
        $('#company_address_modal').removeClass('view');
    }
    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/attendance/attendanceCheck.do");
        $("#form-search").submit();
    }

    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/attendance/attendanceCheck.do");
        $("#form-search").submit();
    }

    //// 출석부 관리
    function attView(num) {
        var number = num;
        if (number == 1) {
            $('.attend_modal').addClass('view');
            $('html,body').css('overflow', 'auto');
        }
    }

    function attClose() {
        $('.attend_modal').removeClass('view');
        $('html,body').css('overflow','');
        document.forms['formAttendance'].reset();
    }
    function navClose() {
        parent.attClose();
    }

    function userAttendance(CD) {
            let MU_CD = CD;
            let DATE = "${pageInfo.DATE}";
            let CHANNEL_CODE = "${pageInfo.searchChannel}";
            let ROOM_CODE = "${pageInfo.searchRoom}";
            $.ajax({
                type: "post",
                url: "/admin/attendance/userAttendance.do",
                data: "MU_CD="+MU_CD+"&DATE="+DATE+"&ROOM_CODE="+ROOM_CODE+"&CHANNEL_CODE="+CHANNEL_CODE,
                success: function (data) {
                    if (data.success) {
                        $("#modal_date").val(DATE);
                        $("#modal_mb_cd").val(MU_CD);
                        $("#modal_mb_room").val(ROOM_CODE);
                       for (let i = 0; i <= 16; i++) {
                           if(data.map['C'+i] == 'Y') {
                               let text = "";
                                text += "<div class='check_many_list check_many_right dan_see'>";
                                text += "<label for='radio_att_c"+i+"_Y' class='radio_label'>";
                                text += "<input type='radio' id='radio_att_c"+i+"_Y' checked='checked' name='C"+i+"' value='Y'>";
                                text += "<span>출석</span>";
                                text += "</label>";
                                text += "<label for='radio_att_c"+i+"_N' class='radio_label'>";
                                text += "<input type='radio' id='radio_att_c"+i+"_N' name='C"+i+"' value='N'>";
                                text += "<span>결석</span>";
                                text += "</label>";
                                text += "<label for='radio_att_c"+i+"_A' class='radio_label'>";
                                text += "<input type='radio' id='radio_att_c"+i+"_A' name='C"+i+"' value='A'>";
                                text += "<span>지각</span>";
                                text += "</label>";
                                text += "<label for='radio_att_c"+i+"_B' class='radio_label'>";
                                text += "<input type='radio' id='radio_att_c"+i+"_B' name='C"+i+"' value='B'>";
                                text += "<span>보강</span>";
                                text += "</label>";
                                text += "</div>";
                               $("#c"+i).html(text);
                           } else if(data.map['C'+i] == 'N') {
                               let text = "";
                               text += "<div class='check_many_list check_many_right dan_see'>";
                               text += "<label for='radio_att_c"+i+"_Y' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_Y'  name='C"+i+"' value='Y'>";
                               text += "<span>출석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_N' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_N' checked='checked' name='C"+i+"' value='N'>";
                               text += "<span>결석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_A' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_A' name='C"+i+"' value='A'>";
                               text += "<span>지각</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_B' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_B' name='C"+i+"' value='B'>";
                               text += "<span>보강</span>";
                               text += "</div>";
                               $("#c"+i).html(text);
                           } else if (data.map['C'+i] == 'A') {
                               let text = "";
                               text += "<div class='check_many_list check_many_right dan_see'>";
                               text += "<label for='radio_att_c"+i+"_Y' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_Y'  name='C"+i+"' value='Y'>";
                               text += "<span>출석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_N' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_N' name='C"+i+"' value='N'>";
                               text += "<span>결석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_A' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_A'checked='checked'  name='C"+i+"' value='A'>";
                               text += "<span>지각</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_B' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_B' name='C"+i+"' value='B'>";
                               text += "<span>보강</span>";
                               text += "</div>";
                               $("#c"+i).html(text);
                           } else if (data.map['C'+i] == 'B') {
                               let text = "";
                               text += "<div class='check_many_list check_many_right dan_see'>";
                               text += "<label for='radio_att_c"+i+"_Y' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_Y'  name='C"+i+"' value='Y'>";
                               text += "<span>출석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_N' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_N' name='C"+i+"' value='N'>";
                               text += "<span>결석</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_A' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_A' name='C"+i+"' value='A'>";
                               text += "<span>지각</span>";
                               text += "</label>";
                               text += "<label for='radio_att_c"+i+"_B' class='radio_label'>";
                               text += "<input type='radio' id='radio_att_c"+i+"_B' checked='checked' name='C"+i+"' value='B'>";
                               text += "<span>보강</span>";
                               text += "</div>";
                               $("#c"+i).html(text);
                           }else {
                               $("#c"+i).text(data.map['C'+i]);
                           }
                           if(data.map['C'+i+'_EXC'] != null || data.map['C'+i+'_EXC'] != '' ){
                               $("#C"+i+"_EXC").val(data.map['C'+i+'_EXC']);
                           }
                       }
                        attView('1');
                    } else {
                       Alert.err();
                    }
                }
            });
    }

    function attendanceRegist() {
        let params = $("form[name=formAttendance]").serialize();
       $.ajax({
            type: "post",
            url: "/admin/attendance/attendanceUpdate.do",
            data: params,
            success: function (data) {
                if (data.success) {
                    Alert.ok();
                    attClose();
                } else {
                    Alert.err();
                }
            }
        });
    }

    /*function seat_close() {
        $("#seat_modal .seat_list").empty();
        $("#seat_modal .tit").empty();
        $('#seatAdd').val('')
        $('#seat_modal').removeClass('view');
        $('.seat_scroll').removeClass('typeScroll');
    }*/


    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/attendance/attendanceCheck.do';
    }




</script>