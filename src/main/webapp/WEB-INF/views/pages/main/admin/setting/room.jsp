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
            <div class="tit">실/좌석관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>환경설정</span>
                <span class="bar"></span>
                <span>실/좌석관리</span>
            </div>
        </div>
        <div class="cont">
            <div class="list">
                <form action="#" name="frmSearch2" id="form-search" method="get" class="clearfix">
                    <input type="hidden" name="currentPage" value="<c:out value='${pageInfo.currentPage}'/>"/>
                    <input type="hidden" name="rowsPerPage" value="<c:out value='${pageInfo.rowsPerPage}'/>"/>
                    <div class="list_tit">
                        <div class="list_srch list_srch_wide">
                            <div class="srch_filter">
                                <button type="button" class="btn mr">
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-filter"
                                         width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
                                         stroke="currentColor" fill="none" stroke-linecap="round"
                                         stroke-linejoin="round">
                                       <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                       <path d="M5.5 5h13a1 1 0 0 1 .5 1.5l-5 5.5l0 7l-4 -3l0 -4l-5 -5.5a1 1 0 0 1 .5 -1.5"></path>
                                    </svg>
                                </span>
                                    <span>Filter</span>
                                </button>
                                <div class="filter_pop">
                                    <div class="tit"><span>Filter Options</span></div>
                                    <div class="sel">
                                        <div class="dan">
                                            <label for="option_2">키워드</label>
                                            <div class="sel_type">
                                                <select name="search_type" id="option_1">
                                                    <option value="">옵션선택</option>
                                                    <option value="ROOM_NAME" ${pageInfo.search_type == 'ROOM_NAME' ? 'selected' : ''}>실/호명</option>
                                                    <option value="ROOM_CODE" ${pageInfo.search_type == 'ROOM_CODE' ? 'selected' : ''}>실/호코드</option>
                                                    <option value="REG_ID" ${pageInfo.search_type == 'REG_ID' ? 'selected' : ''}>등록자</option>
                                                </select>
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
                                            </div>
                                        </div>
                                        <div class="dan">
                                            <label for="option_2">사용여부</label>
                                            <div class="sel_type">
                                                <select name="searchRoomUse" id="option_2">
                                                    <option value="">옵션선택</option>
                                                    <option value="Y" ${pageInfo.searchRoomUse == 'Y' ? 'selected' : ''}>사용</option>
                                                    <option value="N" ${pageInfo.searchRoomUse == 'N' ? 'selected' : ''}>사용안함</option>
                                                </select>
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
                                            </div>
                                        </div>

                                        <div class="sel_add">
                                            <button type="button" class="btn mr btn_center" onclick="filterClear(); return false;"><span>초기화</span></button>
                                            <button type="button" onclick="filterSet(); return false;" class="btn btn_01 btn_center"><span>필터적용</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchChannel" onchange="goSearch()">
                                        <option value="" selected>지점선택</option>
                                        <c:forEach var="row" items="${channelList}">
                                            <c:if test="${row.USE_YN eq 'Y'}">
                                            <option value="${row.CHANNEL_CODE}"  ${row.CHANNEL_CODE == pageInfo.searchChannel ? 'selected' : ''}>${row.CHANNEL_NAME}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
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
                                </div>
                            </div>
                            <div class="srch_form">
                                <button type="button" class="icon" onclick="goSearch(); return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                              transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                              fill="black"></path>
                                    </svg>
                                </button>
                                <input type="text" name="searchText" placeholder="Search" value="${pageInfo.searchText}">
                            </div>
                        </div>
                        <div class="list_tool">
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
                        </div>
                    </div>
                </form>
                <div class="list_detail">
                    <table class="table_type01">
                        <colgroup>
                            <col class="num" style="width: 35px">
                            <col>
                            <col class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width:11%">
                            <col style="width:11%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>실/호명</th>
                            <th class="m_hide">실/호코드</th>
                            <th class="m_hide">지점명</th>
                            <th class="m_hide">사용설정</th>
                            <th class="m_hide">등록자</th>
                            <th class="m_hide">등록일</th>
                            <th class="edit">관리</th>
                            <th class="m_show">더보기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--리스트에 아무것도없을때--%>
                        <c:choose>
                            <c:when test="${empty list}">
                                <tr>
                                    <td class="none" colspan="8"><span>등록된 호/실이 없습니다.</span></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                        <c:forEach items="${list}" var="row" varStatus="status">
                        <tr>
                            <td class="num"><c:out
                                    value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                            <td class="td_tit">
                                <span><a href="#" onclick="roomEdit('${row.ROOM_SEQ}'); return false;"><c:out value="${row.ROOM_NAME}"></c:out></a></span>
                            </td>
                            <td class="m_hide"><c:out value="${row.ROOM_CODE}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.CHANNEL_NAME}"></c:out></td>
                            <td class="m_hide">
                                <button onclick="useYn(${row.ROOM_SEQ})"
                                        class="${row.USE_YN eq 'Y' ? 'use_btn' : 'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함'}</button>
                            </td>
                            <td class="m_hide"><c:out value="${row.REG_ID}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                            <td class="edit">
                                <div class="action">
                                    <button type="button" class="sel_btn balance_btn"
                                            onclick="seat_view('${row.ROOM_CODE}','${row.ROOM_NAME}'); return false">
                                        <span>좌석관리</span>
                                    </button>
                                </div>
                                <div class="action action_left">
                                    <button type="button" class="get_btn">
                                        <span>관리</span>
                                        <span class="more">
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                 class="icon icon-tabler icon-tabler-dots" width="24" height="24"
                                                 viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                 stroke-linecap="round" stroke-linejoin="round">
                                               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                               <circle cx="5" cy="12" r="1"></circle>
                                               <circle cx="12" cy="12" r="1"></circle>
                                               <circle cx="19" cy="12" r="1"></circle>
                                            </svg>
                                        </span>
                                    </button>
                                    <div class="action_info">
                                        <ul>
                                                <%-- <li><a href="#" onclick="codeUpdate('${row.CODE_SEQ}'); return false;">Edit</a></li>--%>
                                            <li><a href="#" onclick="roomEdit('${row.ROOM_SEQ}'); return false;">Edit</a></li>
                                            <li><a href="#"
                                                   onclick="deleteCheck('${row.ROOM_SEQ}', '${row.ROOM_CODE}'); return false;">Delete</a>
                                            </li>
                                        </ul>
                                    </div>
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
                            <td colspan="8">
                                <div class="more_box">
                                    <ul>
                                        <li>
                                            <span class="tit">실/호명</span>
                                            <span><c:out value="${row.ROOM_NAME}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">실/호코드</span>
                                            <span><c:out value="${row.ROOM_CODE}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">지점명</span>
                                            <span><c:out value="${row.CHANNEL_NAME}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">사용설정</span>
                                            <span><button onclick="useYn(${row.ROOM_SEQ})"
                                                          class="${row.USE_YN eq 'Y' ? 'use_btn' : 'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함'}</button></span>
                                        </li>
                                        <li>
                                            <span class="tit">등록자</span>
                                            <span><c:out value="${row.REG_ID}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">등록일</span>
                                            <span><c:out value="${row.REG_DATE}"></c:out></span>
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
                                <select name="" id="count" onchange="rowsChange(this.value)">
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
<div class="add_modal typeScroll" id="room_modal">
    <div class="modal_bg"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    실/좌석 <i id="trans">등록</i>
                </div>
                <div class="close">
                    <button type="button" onclick="modal_close();return false;">
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
            <div class="modal_body">
                <form id="form_room" name="formRoom" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="CODE_TYPE" id="code_type" value="RM">
                        <input type="hidden" name="ADD_CODE" id="add_code">
                        <input type="hidden" name="ROOM_SEQ" id="room_seq">
                        <div class="dan">
                            <label for="room_name" class="necessary">실/호명</label>
                            <input type="text" name="ROOM_NAME" id="room_name" maxlength="15">
                        </div>
                        <div class="dan">
                            <label for="channel_code" class="necessary">지점선택</label>
                            <div class="sel_type">
                                <select name="CHANNEL_CODE" id="channel_code">
                                    <option value="" >지점선택</option>
                                    <c:forEach items="${channelList}" var="row2">
                                        <option value="<c:out value="${row2.CHANNEL_CODE}"></c:out>">${row2.CHANNEL_NAME}</option>
                                    </c:forEach>
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
                        <div class="dan dan50  dan_r">
                            <label for="seat_count" class="necessary">좌석 수</label>
                            <input type="text" name="SEAT_COUNT" id="seat_count" onkeydown="return checkNum(event);" maxlength="10">
                        </div>
                        <div class="dan dan50  dan_l">
                            <label for="room_use" class="">사용여부</label>
                            <div class="sel_type">
                                <select name="USE_YN" id="room_use">
                                    <option value="Y">사용</option>
                                    <option value="N">미사용</option>
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
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;">
                            <span>취소</span></button>
                        <button id="btn_add" type="button" class="btn btn_01 btn_big"
                                onclick="roomRegist(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="roomUpdate(); return false;"><span>수정</span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="add_modal typeScroll" id="seat_modal">
    <div class="modal_bg" ></div>
    <div class="modal_form modal_form_wide">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                </div>
                <div class="close">
                    <button type="button" onclick="seat_close();return false;">
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
                <form id="" name="formSeat" method="post" action="/">
                    <input type ="hidden" id="modal_room_code" name="ROOM_CODE" value="">
                    <input type ="hidden" id="modal_room_name" name="ROOM_NAME" value="">
                    <div class="modal_get modal_get_wide">
                        <div class="dan danAuto dan_r">
                            <div class="datePicker">
                                <input type="text"  id="datepicker_seat" class="picker_form" readonly>
                            </div>
                        </div>
                        <div class="dan danAuto dan_l dan_r dan_mra m_dan_fix">
                            <div class="label_color">
                                <ul>
                                    <li><span class="color color_on"></span><span class="text">사용가능</span></li>
                                    <li><span class="color color_off"></span><span class="text">사용불가</span></li>
                                    <li><span class="color color_ing"></span><span class="text">사용중</span></li>

                                </ul>
                            </div>
                        </div>
                        <div class="dan danAuto dan_l">
                            <div class="seat_add">
                                <div class="seat_num">
                                    <input type="text" id="seatAdd">
                                </div>
                                <button type="button" class="btn btn_01 btn_center" onclick="seatRegistOne(); return false;"><span>좌석추가</span></button>
                            </div>
                        </div>
                        <div class="seat_scroll ">
                            <div class="seat_list">
                            </div>
                        </div>
                    </div>
                   <%-- <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="seat_close();return false;">
                            <span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big"><span>저장</span></button>
                    </div>--%>
                </form>
            </div>

        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    $(document).ready(function() {
        let date = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
    });

    //// 공통 변수 선언
    let roomName = document.querySelector("#room_name");
    let channelCode = document.querySelector("#channel_code");
    let seatCount = document.querySelector("#seat_count");


    //// 등록 버튼 클릭 모달
    function modal_view() {
        $('#room_modal').addClass('view');
    }

    //// 등록, 수정 모달 종료
    function modal_close() {
        document.forms['formRoom'].reset();
        $("#btn_add").show();
        $("#btn_update").hide();
        $(".modal_body #seat_count").prop("readonly", false);
        $('#room_modal').removeClass('view');
    }

    //// 좌석 관리 버튼
    function seat_view(CODE, NAME, DATE) {
        $("#seat_modal .tit").empty();
        $("#seat_modal .seat_list").empty();
        let name = NAME;
        let code = CODE;
        let date;
        if(DATE == null) {
         date = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
        } else {
         date = DATE;
        }
        $.ajax({
            type: "post",
            url: "/admin/setting/seat.do",
            data: "ROOM_CODE=" + CODE + "&DATE=" + date,
            success: function (data) {
                if(data.success) {
                showList(data.seatList, name, code);
                }else {
                    location.reload();
                }
            }
        });

    }

    $("#datepicker_seat").change(function() {
        let select_date = document.querySelector("#datepicker_seat").value;
        let code = document.querySelector("#modal_room_code").value;
        let name = document.querySelector("#modal_room_name").value;
        seat_view(code, name, select_date);
    });

    function showList(data, name, code) {
        document.querySelector("#modal_room_code").value = code;
        document.querySelector("#modal_room_name").value = name;
       let warpH = '';
       let head = '<span>좌석관리 - ' +name + '</span>';
       let text = '<ul id="seat_list_ul">';
       let total = '';
        $.each(data, function (index, item) {
             total = data.length+1;
            let status_name = "";
            if (item.REGIST_SEAT == null) {
                status_name = item.SEAT_STATUS;
                text += '<li id="seat_li_'+item.SEAT_SEQ+'" class="status_'+status_name+'">'
                    + '<a href="#" onclick="seat_set(this); return false;">' +item.SEAT_NAME+ '</a>' +
                    '<div class="filter_pop filter_pop_mini">' +
                    '<div class="sel">' +
                    '<div class="dan">' +
                    '<input type="hidden" id="modal_seat_seq" value="'+item.SEAT_SEQ +'">' +
                    '<label for="option_' +item.SEAT_NAME+ '"><input type="text" id="seat_name_'+item.SEAT_SEQ+'" value="' +item.SEAT_NAME+ '"/>번 좌석</label>' +
                    '<div class="sel_type">' +
                    '<select id="seat_' +item.SEAT_SEQ+ '">' +
                    '<option value="Y">사용가능</option>' +
                    '<option value="N">사용불가</option>' +
                    '</select>' +
                    '<span class="arrow">' +
                    '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="6 9 12 15 18 9"></polyline></svg>' +
                    '</span>' +
                    '</div>' +
                    '</div>' +
                    '<div class="sel_add">' +
                    '<button type="button" class="btn mr btn_small " onclick="seatDeleteOne('+item.SEAT_SEQ+', this); return false;"><span>삭제</span></button>' +
                    '<button type="button"  class="btn btn_01 btn_small " onclick="seatStatusChange('+item.SEAT_SEQ+',this); return false;"><span>적용</span></button>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>';
            }else{
                status_name = "I";
                text += '<li id="seat_li_'+item.SEAT_SEQ+'" class="status_'+status_name+'">'
                    + '<a href="#" onclick="seat_set(this); return false;">' +item.SEAT_NAME+ '</a>' +
                    '<div class="filter_pop filter_pop_mini">' +
                    '<div class="sel">' +
                    '<div class="dan">' +
                    '<input type="hidden" id="modal_seat_seq" value="'+item.SEAT_SEQ +'">' +
                    '<label for="option_' +item.SEAT_NAME+ '"><input type="text" id="seat_name_'+item.SEAT_SEQ+'" value="' +item.SEAT_NAME+ '"/>번 좌석</label>' +
                    '</div>' +
                    '<div class="sel_add">' +
                    '<button type="button" class="btn mr btn_small " onclick="seatDeleteOne('+item.SEAT_SEQ+', this); return false;"><span>삭제</span></button>' +
                    '<button type="button"  class="btn btn_01 btn_small " onclick="seatStatusChange('+item.SEAT_SEQ+',this); return false;"><span>적용</span></button>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>';
            }
        })
        text += '</ul>';
        $("#seat_modal .seat_list").append(text);
        $("#seat_modal .tit").append(head);
        $('#seatAdd').val(total);
        $("#seat_modal .seat_list").ready(function() {
            $('#seat_modal').addClass('view');
             warpH = $('.seat_list').innerHeight();
            if(warpH > 500) {
                $('.seat_scroll').addClass('typeScroll');
            }


        })


    }

    //// 좌석 추가 유효성 검사
    function seatRegistCheck(seatName) {
        let ul = document.querySelector("#seat_list_ul");
        let li = ul.getElementsByTagName('li');
        for(let i = 0; i < li.length; i++) {
            if(li[i].innerText == seatName) {
                return false;
            }
        }
        return true;
    }

    //// 좌석 추가 버튼
    function seatRegistOne() {
        let seat_name = document.querySelector("#seatAdd").value;
        let room_code = document.querySelector("#modal_room_code").value;
        let date = document.querySelector("#datepicker_seat").value;
        let room_name = document.querySelector("#modal_room_name").value;
          if(!seatRegistCheck(seat_name)) {
              alert("같은 이름 좌석이 존재합니다.");
              return false;
          }
          let check = confirm("추가하시겠습니까?");
          if(check) {
              $.ajax({
                  type : 'post',
                  url: "/admin/setting/seatRegistOne.do",
                  data: 'SEAT_NAME='+seat_name+'&ROOM_CODE='+room_code,
                  success: function (data) {
                      if (data.success) {
                          seat_view(room_code, room_name, date);
                      } else {
                          location.reload();
                      }
                  }
              });
          }
    }

    //// 좌석 삭제 버튼
    function seatDeleteOne(SEQ, el) {
        let status = $(el).parents('li').hasClass('status_I');
        if(status) {
            alert('해당 좌석은 사용중입니다.');
            return false;
        }
        let room_code = document.querySelector("#modal_room_code").value;
        let check = confirm("삭제하시겠습니까?");
        if(check) {
            $.ajax({
                type : 'post',
                url: "/admin/setting/seatDeleteOne.do",
                data: 'SEAT_SEQ='+SEQ+'&ROOM_CODE='+room_code,
                success: function (data) {
                    if (data.success) {
                        document.querySelector("#seat_li_"+SEQ).remove();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 좌석 상태값 변경 버튼
    function seatStatusChange(SEQ) {
        let room_code = document.querySelector("#modal_room_code").value;
        let seat_status = document.querySelector("#seat_"+SEQ).value;
        let seat_name = document.querySelector("#seat_name_"+SEQ).value
        if(seat_name == '' || seat_name == null) {
            alert("좌석 이름을 입력해 주세요.");
            return false;
        }
        $.ajax({
            type : 'post',
            url: "/admin/setting/seatStatusUpdate.do",
            data: 'ROOM_CODE='+room_code+'&SEAT_SEQ='+SEQ+'&SEAT_STATUS='+seat_status+'&SEAT_NAME='+seat_name,
            success: function (data) {
                if (data.success) {
                    document.querySelector("#seat_li_"+SEQ).className = 'status_'+seat_status;
                    $("#seat_li_"+SEQ).children('a').text(seat_name);
                    $("#seat_li_"+SEQ).children('a').removeClass('view');
                } else {
                    Alert.err();
                }
            }
        });
    }


    //// 좌석 관리 모달 종료
    function seat_close() {
        $("#seat_modal .seat_list").empty();
        $("#seat_modal .tit").empty();
        $('#seatAdd').val('')
        $('#seat_modal').removeClass('view');
        $('.seat_scroll').removeClass('typeScroll');
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/setting/room.do");
        $("#form-search").submit();
    }

    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/setting/room.do");
        $("#form-search").submit();
    }


    //// 호/실 등록 시 유효성 검사
    function roomRegCheck() {
        if (roomName.value == "" || roomName.value == null) {
            alert("실/호명을 입력해 주세요.");
            return false;
        }
        if (channelCode.value == "" || channelCode.value == null) {
            alert("지점을 선택해 주세요.");
            return false;
        }
        if (seatCount.value == "" || seatCount.value == null) {
            alert("좌석 수를 입력해 주세요.");
            return false;
        }

        return true;
    }

    function roomEdit(SEQ) {
        $.ajax({
            type: "post",
            url: "/admin/setting/roomOneList.do",
            data: 'ROOM_SEQ='+SEQ,
            success: function (data) {
                if (data.success) {
                    let room_seq = data.result[0].ROOM_SEQ;
                    let channel_code = data.result[0].CHANNEL_CODE;
                    let room_name = data.result[0].ROOM_NAME;
                    let use_yn = data.result[0].USE_YN;
                    let seat_count = data.result[0].SEAT_COUNT;
                    $(".modal_body #add_code").val(channel_code);
                    $(".modal_body #room_seq").val(room_seq);
                    $(".modal_body #channel_code").val(channel_code).prop("select", true);
                    $(".modal_body #room_name").val(room_name);
                    $(".modal_body #room_use").val(use_yn).prop("select", true);
                    $(".modal_body #seat_count").val(seat_count);
                    $(".modal_body #seat_count").prop("readonly", true);
                    $("#btn_add").hide();
                    $("#btn_update").show();
                    modal_view();
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// edit 버튼
    $(document).on("click", ".open-EditRoom", function () {
        let room_seq = $(this).data('seq');
        let channel_code = $(this).data('id');
        let room_name = $(this).data('name');
        let use_yn = $(this).data('use');
        let seat_count = $(this).data('count');
        $(".modal_body #add_code").val(channel_code);
        $(".modal_body #room_seq").val(room_seq);
        $(".modal_body #channel_code").val(channel_code).prop("select", true);
        $(".modal_body #room_name").val(room_name);
        $(".modal_body #room_use").val(use_yn).prop("select", true);
        $(".modal_body #seat_count").val(seat_count);
        $(".modal_body #seat_count").prop("readonly", true);
        $("#btn_add").hide();
        $("#btn_update").show();
        modal_view();
    });

    //// 등록 버튼
    function roomRegist() {
        let params = new FormData($("form[name=formRoom]")[0]);
        if (!roomRegCheck()) {
            return false;
        }
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/roomRegist.do",
                dataType: "json",
                contentType: false,
                processData: false,
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/room.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    function deleteCheck(SEQ, CODE) {
        let gubun ='RO';
        $.ajax({
            type: "post",
            url: "/admin/setting/deleteCheck.do",
            data: 'CODE='+CODE+'&gubun='+gubun,
            success: function (data) {
                if (data.success) {
                    roomDelete(SEQ, data.result,CODE);
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// delete 버튼
    function roomDelete(SEQ, result, CODE) {
        if(result > 0) {
            alert("해당 호/실에 등록된 회원이 존재합니다.");
            return;
        }
         let check = confirm("삭제하시겠습니까?");
        if (check) {
             $.ajax({
                 type: "post",
                 url: "/admin/setting/roomDelete.do",
                 data: "ROOM_SEQ=" + SEQ +"&ROOM_CODE=" + CODE,
                 success: function (data) {
                     if (data.success) {
                         location.href = "/admin/setting/room.do";
                         Alert.ok();
                     } else {
                         Alert.err();
                     }
                 }
             });
        }
    }

    //// 수정 버튼
    function roomUpdate() {
        if (!roomRegCheck()) {
            return false;
        }
            let params = $("form[name=formRoom]").serialize();
            $.ajax({
                type: "post",
                url: "/admin/setting/roomUpdate.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/room.do";
                    } else {
                        Alert.err();
                    }
                }
            });
    }

    //// 사용설정 버튼
    function useYn(SEQ) {
        $.ajax({
            type: 'post',
            url: "/admin/setting/roomUseYn.do",
            data: 'ROOM_SEQ=' + SEQ,
            success: function (data) {
                if (data.success) {
                    location.reload();
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/setting/room.do';
    }




</script>