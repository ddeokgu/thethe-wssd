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
            <div class="tit">등록관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>등록관리</span>
                <span class="bar"></span>
                <span>등록관리</span>
            </div>
        </div>
        <div class="cont">
            <div class="list">
                <form action="#" name="frmSearch2" id="form-search" method="post" class="clearfix">
                    <input type="hidden" name="currentPage" value="<c:out value='${pageInfo.pageIndex}'/>"/>
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
                                            <label for="option_1">키워드</label>
                                            <div class="sel_type">
                                                <select name="search_type" id="option_1">
                                                    <option value="">옵션 선택</option>
                                                    <option value="REGIST_MU_NAME" ${pageInfo.search_type eq 'REGIST_MU_NAME' ? 'selected' : ''}>
                                                        등록 이름
                                                    </option>
                                                    <option value="REGIST_MU_ID" ${pageInfo.search_type eq 'REGIST_MU_ID' ? 'selected' : ''}>
                                                        등록 아이디
                                                    </option>
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
                                            <label for="option_2">회원유형</label>
                                            <div class="sel_type">
                                                <select name="REGIST_MU_TYPE" id="option_2">
                                                    <option value="">옵션 선택</option>
                                                    <option value="Y" ${pageInfo.REGIST_MU_TYPE eq 'Y' ? 'selected' : ''}>
                                                        회원
                                                    </option>
                                                    <option value="N" ${pageInfo.REGIST_MU_TYPE eq 'N' ? 'selected' : ''}>
                                                        비회원
                                                    </option>
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
                                            <button type="button" class="btn mr btn_center"
                                                    onclick="filterClear(); return false;"><span>초기화</span>
                                            </button>
                                            <button type="button" class="btn btn_01 btn_center"
                                                    onclick="filterSet(); return false;"><span>필터적용</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchChannel"  onchange="goSearch()">
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
                                <input type="text" placeholder="Search" name="searchText"
                                       value="${pageInfo.searchText}">
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
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 9%">
                            <col>

                            <col class="m_hide" style="width: 13%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 10%">
                            <col style="width:5%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th class="m_hide">등록 유형</th>
                            <th >등록 아이디</th>
                            <th class="m_hide">등록 이름</th>
                            <th class="m_hide">지점명</th>
                            <th class="m_hide">호실/명</th>
                            <th class="m_hide">등록 기간</th>
                            <th class="m_hide">등록일</th>
                            <th class="edit">관리</th>
                            <th class="m_show">더보기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <%--리스트에 아무것도없을때--%>
                               <tr>
                                   <td class="none" colspan="11"><span>등록된 리스트가 없습니다.</span></td>
                                </tr>
                                <%--리스트에 아무것도없을때--%>
                            </c:when>
                        <c:otherwise>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <input type="hidden" value="${row.REGIST_SEQ}">
                                <input type="hidden" value="${row.REGIST_SEAT}">
                                <td class="num"><c:out
                                        value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>

                                <td class="m_hide"><c:out value="${row.REGIST_TYPE eq 'A' ? '학원' : '독서실'}"></c:out></td>
                                <td class="td_tit"><a href="#" onclick="registEdit('${row.REGIST_SEQ}'); return false;"><c:out value="${row.REGIST_MU_ID}"></c:out></a></td>
                                <td class="m_hide"><c:out value="${row.REGIST_MU_NAME}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.CHANNEL_NAME}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.ROOM_NAME}"></c:out></td>
                                <td class="m_hide"> <c:out value="${row.REGIST_START_DATE}"></c:out> ~ </span>
                                   <c:out value="${row.REGIST_END_DATE}"></c:out></span></td>
                                <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                                <td class="edit">
                                    <div class="action">
                                        <button type="button" class="${row.REGIST_SEAT != null ? 'sel_btn balance_btn' : 'sel_btn balance_btn null sel_btn1 '}"
                                                onclick="seat_view('${row.REGIST_ROOM}','${row.ROOM_NAME}','${row.REGIST_SEAT}', '${row.REGIST_START_DATE}', '${row.REGIST_END_DATE}','${row.REGIST_MU_CD}', '${row.REGIST_SEQ}'); return false">
                                            <span>${row.REGIST_SEAT != null ? '좌석관리' : '좌석선택'}</span>
                                        </button>
                                    </div>
                                    <div class="action action_left">
                                        <button type="button" class="get_btn">
                                            <span>관리</span>
                                            <span class="more">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-dots" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
                                                <li><%--<a data-toggle="modal" data-seq="${row.REGIST_SEQ}"
                                                       data-cd="${row.REGIST_MU_CD}" data-id="${row.REGIST_MU_ID}" data-name="${row.REGIST_MU_NAME}"
                                                       data-room_code="${row.REGIST_ROOM}" data-fee_code="${row.REGIST_FEE_TYPE}" data-phone="${row.REGIST_MU_PHONE}"
                                                       data-room_name="${row.ROOM_NAME}" data-channel="${row.REGIST_CHANNEL}" data-gender="${row.REGIST_MU_GENDER}"
                                                       data-regist_first_date="${row.REGIST_FIRST_DATE}" data-regist_exam_des="${row.REGIST_EXAM_DES}"
                                                       data-seat_name="${row.SEAT_NAME}" data-regist_seat="${row.REGIST_SEAT}" data-regist_exam="${row.REGIST_EXAM}"
                                                       data-regist_phone_type="${row.REGIST_PHONE_TYPE}" data-regist_test_first="${row.REGIST_TEST_FIRST}"
                                                       data-regist_test_second="${row.REGIST_TEST_SECOND}" data-parent_phone="${row.REGIST_PARENT_PHONE}"
                                                       data-date_start="${row.REGIST_START_DATE}" data-date_end="${row.REGIST_END_DATE}" data-regist_type="${row.REGIST_TYPE}"
                                                       data-school="${row.REGIST_MU_SCHOOL}" data-grade="${row.REGIST_MU_GRADE}" data-mu_type="${row.REGIST_MU_TYPE}"
                                                       class="open-EditRegist"
                                                       href="#regist_modal">Edit</a>--%>
                                                    <a href="#"
                                                       onclick="registEdit('${row.REGIST_SEQ}'); return false;">Edit</a></li>
                                                <li><a href="#"
                                                       onclick="registDelete('${row.REGIST_SEQ}'); return false;">Delete</a>
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
                                                <span class="tit">등록 유형</span>
                                                <span><c:out value="${row.REGIST_TYPE eq 'A' ? '학원' : '독서실'}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">등록 이름</span>
                                                <span><c:out value="${row.REGIST_MU_NAME}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">지점명</span>
                                                <span><c:out value="${row.CHANNEL_NAME}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">호/실명</span>
                                                <span><c:out value="${row.ROOM_NAME}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">등록 기간</span>
                                                <span><c:out value="${row.REGIST_START_DATE}"></c:out> ~ </span>
                                                <span><c:out value="${row.REGIST_END_DATE}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">등록일</span>
                                                <span><c:out value="${row.REG_DATE}"></c:out></span>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
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
<div class="add_modal typeScroll" id="regist_modal">
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    등록 <i id="trans">수정</i>
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
                <form id="form_regist" name="formRegist" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="REGIST_SEQ" id="regist_seq">
                        <input type="hidden" name="STUDENT_CHECK" id="student_check">
                        <div class="dan dan_stack">
                            <div class="stack_txt">
                                <span>등록관리 회원설정</span>
                                <span>등록하고자 하는 회원유형을 선택해주세요.</span>
                            </div>
                            <div class="stack_radio">
                                <label for="regi_member" class="stack_label">
                                    <input type="radio" id="regi_member" value="Y" name="REGIST_MU_TYPE" checked>
                                    <span>회원</span>
                                </label>
                                <label for="regi_bemember" class="stack_label">
                                    <input type="radio" id="regi_bemember" value="N" name="REGIST_MU_TYPE">
                                    <span>비회원</span>
                                </label>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="regi_id" class="necessary">아이디</label>
                            <input type="hidden" name="REGIST_MU_CD" id="regi_mu_cd">
                            <input type="hidden" name="REGIST_FIRST_DATE" id="regi_first_date">
                            <input type="hidden"  id="hidden_id">
                            <div class="srch_set dan_see">
                                <input type="text" name="REGIST_MU_ID" id="regi_id" maxlength="15" readonly>
                                <button type="button" id="btn_searchId" onclick="srch_id_view();return false" class="btn btn_center"><span>아이디찾기</span></button>
                            </div>
                        </div>
                        <div class="dan ">
                            <label for="regi_name2" class="necessary">이름/성별</label>
                            <div class="check_many_list check_many_right dan_see">
                                <input type="text" name="REGIST_MU_NAME" id="regi_name2">
                                <label for="regist_gender_m" class="radio_label">
                                    <input type="radio" id="regist_gender_m" checked="" name="REGIST_MU_GENDER" value="M">
                                    <span>남</span>
                                </label>
                                <label for="regist_gender_f" class="radio_label">
                                    <input type="radio" id="regist_gender_f" name="REGIST_MU_GENDER" value="F">
                                    <span>여</span>
                                </label>

                            </div>
                        </div>

                        <div class="dan dan50 dan_r">
                            <label for="regi_me" class="necessary">연락처(본인)</label>
                            <input type="text" id="regi_me" name="REGIST_MU_PHONE" placeholder="-없이 숫자만 입력해주세요">
                        </div>
                        <div class="dan dan50 dan_l">
                            <label for="regi_set" class="necessary">등록구분</label>
                            <div class="sel_type">
                                <select name="REGIST_TYPE" id="regi_set">
                                    <option value="">선택</option>
                                    <option value="A">학원</option>
                                    <option value="B">독서실</option>
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
                        <div class="dan dan50 dan_r">
                            <label for="regi_store" class="necessary">지점명</label>
                            <div class="sel_type">
                                <select name="REGIST_CHANNEL" id="regi_store" onchange="roomList();">
                                    <option value="">선택</option>
                                    <c:forEach items="${channelList}" var="row">
                                        <c:if test="${row.USE_YN eq 'Y'}">
                                    <option value="${row.CHANNEL_CODE}">${row.CHANNEL_NAME}</option>
                                        </c:if>
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
                        <div class="dan dan50 dan_l">
                            <label for="regi_room" class="necessary">호/실명</label>
                            <div class="sel_type">
                                <select name="REGIST_ROOM" id="regi_room">

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
                        <div class="dan dan_division">
                            <label for="" class="necessary">구분</label>
                            <div class="check_many_list dan_wrap">
                                <%--<label for="regi_ra1" class="radio_label Y" onclick="transRadio();">
                                    <input type="radio" id="regi_ra1" checked name="REGIST_FEE_TYPE" >
                                    <span>고등학생</span>
                                </label>
                                <label for="regi_ra2" class="radio_label N" onclick="transRadio(); r">
                                    <input type="radio" id="regi_ra2" name="REGIST_FEE_TYPE" >
                                    <span>성인반</span>
                                </label>--%>
                            </div>
                            <div class="check_list_view Y " >
                                <label for="regi_school">학교</label>
                                <div class="sel_type">
                                    <select name="REGIST_MU_SCHOOL" id="regi_school">
                                        <option value="">선택</option>
                                        <c:forEach items="${schoolList}" var="row">
                                            <option value="${row.SCHOOL_CODE}">${row.SCHOOL_NAME}</option>
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
                                <label for="regi_grade" class="dan_ll">학년</label>
                                <div class="sel_type">
                                    <select name="REGIST_MU_GRADE" id="regi_grade">
                                        <option value="">선택</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
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
                            <div class="check_list_view N none">
                                <label for="regi_test">시험종류</label>
                                <div class="sel_type">
                                    <select name="REGIST_EXAM" id="regi_test" onchange="testSel(this)">
                                        <option value="">선택</option>
                                        <c:forEach items="${testList}" var="row">
                                        <option value="${row.TEST_CODE}">${row.TEST_NAME}</option>
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
                            <div class="check_list_other">
                                <label for="regi_other">기타시험</label>
                                <input type="text" id="regi_other" name="REGIST_EXAM_DES">
                            </div>
                        </div>
                        <div class="dan dan50 dan_r">
                            <label for="datepicker_go" class="necessary">등원기간</label>
                            <div class="datePicker datePickerAll">
                                <input type="text" name="REGIST_START_DATE" id="datepicker_go" class="picker_form">
                            </div>

                        </div>
                        <div class="dan dan50 dan_b dan_l">
                            <div class="datePicker datePickerAll">
                                <input type="text" name="REGIST_END_DATE" id="datepicker_go2" class="picker_form">
                            </div>
                        </div>

                        <div class="dan">
                            <label for="REGIST_PHONE_TYPE1" class="necessary">연락처(보호자)</label>
                            <div class="check_many_list dan_see">
                                <label for="REGIST_PHONE_TYPE1" class="radio_label">
                                    <input type="radio" id="REGIST_PHONE_TYPE1" checked="" name="REGIST_PHONE_TYPE" value="부">
                                    <span>부</span>
                                </label>
                                <label for="REGIST_PHONE_TYPE2" class="radio_label">
                                    <input type="radio" id="REGIST_PHONE_TYPE2" name="REGIST_PHONE_TYPE" value="모">
                                    <span>모</span>
                                </label>
                                <input type="text" id="parent_phone" name="REGIST_PARENT_PHONE" placeholder="-없이 숫자만 입력해주세요">
                            </div>
                        </div>
                      <%--  <div class="dan dan50 dan_r">
                            <label for="fee_set" class="necessary">이용료</label>
                            <input type="text" name="FEE_SET" id="fee_set" onkeydown="return checkNum(event)" maxlength="15">
                        </div>--%>
                        <div class="dan dan50 dan_r">
                            <label for="datepicker_exam1" class="">시험일</label>
                            <div class="check_list_view">
                                <label for="datepicker_exam1" >1차</label>
                                <div class="datePicker datePickerAll">
                                    <input type="text" name="REGIST_TEST_FIRST" id="datepicker_exam1" class="picker_form">
                                </div>
                            </div>
                        </div>
                        <div class="dan dan50 dan_b dan_l">
                            <div class="check_list_view">
                                <label for="datepicker_exam2" >2차</label>
                                <div class="datePicker datePickerAll">
                                    <input type="text" name="REGIST_TEST_SECOND" id="datepicker_exam2" class="picker_form">
                                </div>
                            </div>
                        </div>
                        <div class="dan" id="payTypeDan">
                            <label for="REGIST_PHONE_TYPE1" class="necessary">결제 방법(현장 결제)</label>
                            <div class="check_many_list dan_see" >
                                <input type ="hidden" name="PAY_YN" value="Y">
                                <label for="modal_pay_type3" class="radio_label">
                                    <input type="radio" id="modal_pay_type3" checked="" name="REGIST_PAY_TYPE" value="CARD_B">
                                    <span>카드</span>
                                </label>
                                <label for="modal_pay_type4" class="radio_label">
                                    <input type="radio" id="modal_pay_type4" name="REGIST_PAY_TYPE" value="BANK_B">
                                    <span>계좌이체</span>
                                </label>
                                <label for="modal_pay_type5" class="radio_label">
                                    <input type="radio" id="modal_pay_type5" name="REGIST_PAY_TYPE" value="CASH_B">
                                    <span>현금</span>
                                </label>
                                <label for="modal_pay_type6" class="radio_label">
                                    <input type="radio" id="modal_pay_type6" name="REGIST_PAY_TYPE" value="ETC_B">
                                    <span>기타</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;">
                            <span>취소</span></button>
                        <button id="btn_add" type="button" class="btn btn_01 btn_big"
                                onclick="registInsert(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="registUpdate(); return false;"><span>수정</span></button>
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
                    <input type ="hidden" id="modal_room_name" name="ROOM_NAME" value="">
                    <div class="modal_get modal_get_wide">
                     <%--   <div class="dan danAuto dan_r">
                            <div class="datePicker">
                                <input type="text"  id="datepicker_seat" class="picker_form" readonly>
                            </div>
                        </div>--%>
                        <div class="dan danAuto dan_l dan_r dan_mra m_dan_fix">
                            <div class="label_color">
                                <ul>
                                    <li><span class="color color_on"></span><span class="text">사용가능</span></li>
                                    <li><span class="color color_off"></span><span class="text">사용불가</span></li>
                                    <li><span class="color color_ing"></span><span class="text">사용중</span></li>
                                    <li><span class="color color_me"></span><span class="text">사용중(본인)</span></li>
                                </ul>
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
<div class="add_modal typeScroll" id="register_id_modal">
    <div class="modal_bg" onclick="srch_id_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    아이디찾기
                </div>
                <div class="close">
                    <button type="button" onclick="srch_id_close();return false;">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-x" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                               <line x1="18" y1="6" x2="6" y2="18"></line>
                               <line x1="6" y1="6" x2="18" y2="18"></line>
                            </svg>
                        </span>
                    </button>
                </div>
            </div>
            <div class="modal_body ">
                <div class="modal_get typeScroll">
                    <div class="srch_form srch_form_pop">
                        <button type="button" class="icon" onclick="searchMuId(); return false;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black"></path>
                            </svg>
                        </button>
                        <input type="text" id="input_search_id" placeholder="Search" name="searchText" value="">
                    </div>
                    <div class="srch_id_list typeScroll">
                        <ul>
                           <li class="none">검색된 결과가 없습니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="modal_btn">
                    <button type="button" class="btn btn_big" onclick="srch_id_close();return false;">
                        <span>취소</span></button>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>

    $(document).ready(function () {
        minDateSet();
        maxDateSet();

    });

    $(function(){
        $('.datepicker').datepicker();
    });

    //// 변수 선언
    let inputRegPhone = document.querySelector("#regi_me");
    let inputRegParentPhone = document.querySelector("#parent_phone");


    //// 숫자만 입력 가능
    inputRegPhone.addEventListener("keyup", onlyNumber);
    inputRegParentPhone.addEventListener("keyup", onlyNumber);

    $("input:radio[id=regi_bemember]").click(function () {
        document.querySelector("#regi_id").value = 'guest';
        $("#btn_searchId").hide();
    });

    $("input:radio[id=regi_member]").click(function () {
        let hidden_id = document.querySelector("#hidden_id").value;
        document.querySelector("#regi_id").value = hidden_id;
        $("#btn_searchId").show();
    });

    //// 둥원 시작일 변경 시 이벤트
    $("#datepicker_go").change(function() {
        let type =  $("input[name='REGIST_FEE_TYPE']:checked").parent();
        let select_date = document.querySelector("#datepicker_go").value;
        let end_date = document.querySelector("#datepicker_go2");
        if (type.hasClass('A')) {
            $("#datepicker_go2").val(select_date);
        } else {
            let date = new Date();
            let year = date.getFullYear();
            let month = ("0" + (1 + date.getMonth())).slice(-2);
            let day = ("0" + date.getDate()).slice(-2);
            let today = year + "-" + month + "-" + day;
            let regist_type = $('input:radio[name="REGIST_FEE_TYPE"]:checked').val();

            if(regist_type == "" || regist_type == null) {
                alert("구분을 선택해 주세요.");
                document.querySelector("#datepicker_go").value = null;
            } else if(select_date < today) {
                alert("미래날짜를 선택해 주세요.");
                document.querySelector("#datepicker_go").value = null;
                return false;
            } else {
                let start_date = new Date(select_date);
                start_date.setDate(start_date.getDate() + 29);
                let year = start_date.getFullYear();
                let month = ("0" + (1 + start_date.getMonth())).slice(-2);
                let day = ("0" + start_date.getDate()).slice(-2);
                end_date.value = year+"-"+month+"-"+day;
                minDateSet();
                maxDateSet();
            }
        }
    });

    //// 등원 종료 기간 변경 시 이벤트
    $("#datepicker_go2").change(function() {
        let select_date = document.querySelector("#datepicker_go").value;
        let end_date = document.querySelector("#datepicker_go2").value;
        let diff_date = dateDiff(select_date, end_date);
        if(diff_date < 27 || diff_date > 59 ) {
            alert('30일 이상 59일 이하만 가능합니다.');
            document.querySelector("#datepicker_go2").value = null;
        }
    });


    function maxDateSet() {
        let select_date = document.querySelector("#datepicker_go").value;
        let start_date = new Date(select_date);
        start_date.setDate(start_date.getDate() + 58);
        let max_date_year =  start_date.getFullYear();
        let max_date_month = ("0" + (1 + start_date.getMonth())).slice(-2);
        let max_date_day = ("0" + start_date.getDate()).slice(-2);
        let max_date_set = max_date_year+"-"+max_date_month+"-"+max_date_day;
        $("#datepicker_go2").datepicker("option", "maxDate", max_date_set);
    }

    function minDateSet() {
        let select_date = document.querySelector("#datepicker_go").value;
        let start_date = new Date(select_date);
        start_date.setDate(start_date.getDate() + 29);
        let min_date_year =  start_date.getFullYear();
        let min_date_month = ("0" + (1 +start_date.getMonth())).slice(-2);
        let min_date_day = ("0" + start_date.getDate()).slice(-2);
        let min_date_set = min_date_year+"-"+min_date_month+"-"+min_date_day;
        $("#datepicker_go2").datepicker("option", "minDate", min_date_set);
    }

    <%--아이디 찾기 팝업--%>
    function srch_id_view() {
        $('#register_id_modal').addClass('view');
    }
    function srch_id_close() {
        $('#register_id_modal').removeClass('view');
    }

    //// Add 버튼 클릭 시 등록 && 수정 팝업 show
    function modal_view() {
        $("#btn_add").show();
        $("#btn_update").hide();
        datepickerSetting('add');
        $('#regist_modal').addClass('view');
    }

    //// 등록 && 수정 팝업 close
    function modal_close() {
        document.forms['formRegist'].reset();
        $('#regist_modal').removeClass('view');
        $('.dan_wrap').empty();
        $('.dan_division').removeClass('view')
        $("#payTypeDan").removeClass('view');
        $("#regist_seq").val('');
        $("#modal_pay_type3").val('CARD_B');
        $("#modal_pay_type4").val('BANK_B');
        $("#modal_pay_type5").val('CASH_B');
        $("#modal_pay_type6").val('ETC_B');
        $("#btn_searchId").show();
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/regist/registList.do");
        $("#form-search").submit();
    }

    //// 리스트 row 수 변경
    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/regist/registList.do");
        $("#form-search").submit();
    }

    ///// 시험 종류 '기타' 선택 시 input 태그 나타내기
    function testSel(el) {
        var _this = $(el);
        var other = _this.find('option:selected').val();
        if ( other == 'TE0' ) {
            $('.check_list_other').addClass('view')
        } else {
            $('.check_list_other').removeClass('view');
        }
    }

    //// 이용료 등록 && 수정 시 유효성 검사
    function registCheck() {

        let regist_type = document.querySelector("#regi_set").value;
        let regist_fee_type = $('input:radio[name="REGIST_FEE_TYPE"]:checked').val();
        let regist_phone_type = $('input:radio[name="REGIST_PHONE_TYPE"]:checked').val();
        let regist_start_date = document.querySelector("#datepicker_go").value;
        let regist_end_date = document.querySelector("#datepicker_go2").value;
        let regist_parent_phone = document.querySelector("#parent_phone").value;
        let regist_channel = document.querySelector("#regi_store").value;
        let regist_room = document.querySelector("#regi_room").value;
        let regist_exam = document.querySelector("#regi_test").value;
        let regist_exam_des = document.querySelector("#regi_other").value;
        let regist_school = document.querySelector("#regi_school").value;
        let regist_grade = document.querySelector("#regi_grade").value;
        let regist_id = document.querySelector("#regi_id").value;

        let type =  $("input[name='REGIST_FEE_TYPE']:checked").parent();

        if(regist_channel == "" || regist_channel == null) {
            alert("지점을 선택해 주세요.");
            return false;
        }

        if(regist_room == "" || regist_room == null) {
            alert("호/실명을 선택해 주세요.");
            return false;
        }

        if(regist_id == "" || regist_id == null) {
            alert("아이디를 입력해 주세요.");
            return false;
        }

        if(regist_type == "" || regist_type == null) {
            alert("등록구분을 선택해 주세요.");
            return false;
        }

        if(type.hasClass('Y')) {
            if(regist_school == "" || regist_school == null) {
                alert("학교를 선택해 주세요.");
                return false;
            } else {
                if(regist_grade == "" || regist_grade == null) {
                    alert("학년을 선택해 주세요.");
                    return false;
                }
            }
            document.querySelector('#student_check').value = 'Y';
        }

        if(type.hasClass('A')) {
            document.querySelector('#student_check').value = 'N';
        }

        if(type.hasClass('N')) {
            if(regist_exam == "" || regist_exam == null) {
                alert("시험을 선택해 주세요.");
                return false;
            }
            if(regist_exam == 'TE0') {
                if(regist_exam_des == "" || regist_exam_des == null) {
                    alert("기타시험을 입력해 주세요.");
                    return false;
                }
            }
            document.querySelector('#student_check').value = 'N';
        }

        if(regist_fee_type == "" || regist_fee_type == null) {
            alert("구분을 선택해 주세요.");
            return false;
        }

        if(regist_start_date == "" || regist_start_date == null) {
            alert("등원 시작일을 선택해 주세요.");
            return false;
        }

        if(regist_end_date == "" || regist_end_date == null) {
            alert("등원 종료일을 선택해 주세요.");
            return false;
        }

        if(regist_parent_phone == "" || regist_parent_phone == null) {
            alert("보호자 연락처를 입력해 주세요.");
            return false;
        }

        return true;
    }

    //// 팝업 내 구분 선택 시
    function transRadio() {
        if($('.check_many_list .radio_label.Y input').is(":checked") == true){
            $('.check_list_view.N').addClass('none');
            $('.check_list_view.Y').removeClass('none');
            $("#regi_test option:eq(0)").prop("selected", true);
            $("#regi_other").val("");
            $(".check_list_other").removeClass('view');
        }else if($('.check_many_list .radio_label.N input').is(":checked") == true) {
            $('.check_list_view.Y').addClass('none');
            $('.check_list_view.N').removeClass('none');
            $("#regi_school option:eq(0)").prop("selected", true);
            $("#regi_grade option:eq(0)").prop("selected", true);
        }else if($('.check_many_list .radio_label.A input').is(":checked") == true) {
            let select_date = document.querySelector("#datepicker_go");
            let end_date = document.querySelector("#datepicker_go2");
            $('.check_list_view.Y').addClass('none');
            $('.check_list_view.N').addClass('none');
            $("#regi_school option:eq(0)").prop("selected", true);
            $("#regi_grade option:eq(0)").prop("selected", true);
            $("#regi_test option:eq(0)").prop("selected", true);
            select_date.value = '';
            end_date.value = '';
        }
    }
    function registEdit(SEQ) {
        $.ajax({
            type: "post",
            url: "/admin/regist/registOneList.do",
            data: 'REGIST_SEQ='+SEQ,
            success: function (data) {
                if (data.success) {
                    let seq = data.result[0].REGIST_SEQ;
                    let muCd = data.result[0].REGIST_MU_CD;
                    let muId = data.result[0].REGIST_MU_ID;
                    let muName = data.result[0].REGIST_MU_NAME;
                    let muPhone = data.result[0].REGIST_MU_PHONE;
                    let muGender = data.result[0].REGIST_MU_GENDER;
                    let feeCode = data.result[0].REGIST_FEE_TYPE;
                    let channel = data.result[0].REGIST_CHANNEL;
                    let roomCode = data.result[0].REGIST_ROOM;
                    let roomName  = data.result[0].ROOM_NAME;
                    let registFirstDate = data.result[0].REGIST_FIRST_DATE;
                    let registStartDate = data.result[0].REGIST_START_DATE;
                    let registEndDate = data.result[0].REGIST_END_DATE;
                    let registTestFirst = data.result[0].REGIST_TEST_FIRST;
                    let registTestSecond = data.result[0].REGIST_TEST_SECOND;
                    let registExam = data.result[0].REGIST_EXAM;
                    let registExamDes = data.result[0].REGIST_EXAM_DES;
                    let seatSeq = data.result[0].REGIST_SEAT;
                    let seatName = data.result[0].SEAT_NAME;
                    let registPhoneType = data.result[0].REGIST_PHONE_TYPE;
                    let parentPhone = data.result[0].REGIST_PARENT_PHONE;
                    let regist_type =data.result[0].REGIST_TYPE;
                    let school = data.result[0].REGIST_MU_SCHOOL;
                    let grade = data.result[0].REGIST_MU_GRADE;
                    let muType = data.result[0].REGIST_MU_TYPE;
                    let payType = data.result[0].REGIST_PAY_TYPE;

                    roomList(channel, roomCode);
                    feeList(channel,feeCode,school, grade, registExam, registExamDes);

                    $("#regi_id").prop('readOnly', true);
                    $(".modal_body #regist_seq").val(seq);
                    $(".modal_body #regi_id").val(muId);
                    $(".modal_body #hidden_id").val(muId);
                    $(".modal_body #regist_mu_cd").val(muCd);
                    $(".modal_body #regi_name2").val(muName);
                    $(".modal_body #regi_me").val(muPhone);
                    if(muType == 'N') {
                        $("#btn_searchId").hide();
                    }
                    $("input:radio[name=REGIST_MU_TYPE]:radio[value="+muType+"]").prop('checked', true);
                    $("input:radio[name=REGIST_MU_GENDER]:radio[value="+muGender+"]").prop('checked', true);
                    $(".modal_body #regi_store").val(channel).prop("select", true);
                    $(".modal_body #regi_set").val(regist_type).prop("select", true);
                    $(".modal_body #datepicker_go").val(registStartDate);
                    $(".modal_body #datepicker_go2").val(registEndDate);
                    $(".modal_body #datepicker_exam1").val(registTestFirst);
                    $(".modal_body #datepicker_exam2").val(registTestSecond);
                    $(".modal_body #parent_phone").val(parentPhone);
                    $("input:radio[name=REGIST_PHONE_TYPE]:radio[value="+registPhoneType+"]").prop('checked', true);
                    if(payType != null && payType != "") {
                        if(payType == 'CARD' || payType == 'BANK') {
                            $(".modal_body #payTypeDan").addClass("view");
                            $("input[name=REGIST_PAY_TYPE]").val(payType);
                        } else {
                            $("input:radio[name=REGIST_PAY_TYPE]:radio[value="+payType+"]").prop('checked', true);
                        }
                    }
                    $("#btn_add").hide();
                    $("#btn_update").show();
                    $('.dan_division').addClass('view')
                    datepickerSetting('setting');
                    $('#regist_modal').addClass('view');

                } else {
                    Alert.err();
                }
            }
        });
    }

    //// Edit 버튼
   /* $(document).on("click", ".open-EditRegist", function () {
        let seq = $(this).data('seq');
        let muCd = $(this).data('cd');
        let muId = $(this).data('id');
        let muName = $(this).data('name');
        let muPhone = $(this).data('phone');
        let muGender = $(this).data('gender');
        let feeCode = $(this).data('fee_code');
        let channel = $(this).data('channel');
        let roomCode = $(this).data('room_code');
        let roomName  = $(this).data('room_name');
        let registFirstDate = $(this).data('regist_first_date');
        let registStartDate = $(this).data('date_start');
        let registEndDate = $(this).data('date_end');
        let registTestFirst = $(this).data('regist_test_first');
        let registTestSecond = $(this).data('regist_test_second');
        let registExam = $(this).data('regist_exam');
        let registExamDes = $(this).data('regist_exam_des');
        let seatSeq = $(this).data('regist_seat');
        let seatName = $(this).data('seat_name');
        let registPhoneType = $(this).data('regist_phone_type');
        let parentPhone = $(this).data('parent_phone');
        let regist_type = $(this).data('regist_type');
        let school = $(this).data('school');
        let grade = $(this).data('grade');
        let muType =$(this).data('mu_type');

        roomList(channel, roomCode);
        feeList(channel,feeCode,school, grade, registExam, registExamDes);


        $("#regi_id").prop('readOnly', true);
        $(".modal_body #regist_seq").val(seq);
        $(".modal_body #regi_id").val(muId);
        $(".modal_body #hidden_id").val(muId);
        $(".modal_body #regist_mu_cd").val(muCd);
        $(".modal_body #regi_name2").val(muName);
        $(".modal_body #regi_me").val(muPhone);
        if(muType == 'N') {
            $("#btn_searchId").hide();
        }
        $("input:radio[name=REGIST_MU_TYPE]:radio[value="+muType+"]").prop('checked', true);
        $("input:radio[name=REGIST_MU_GENDER]:radio[value="+muGender+"]").prop('checked', true);
        $(".modal_body #regi_store").val(channel).prop("select", true);
        $(".modal_body #regi_set").val(regist_type).prop("select", true);
        $(".modal_body #datepicker_go").val(registStartDate);
        $(".modal_body #datepicker_go2").val(registEndDate);
        $(".modal_body #datepicker_exam1").val(registTestFirst);
        $(".modal_body #datepicker_exam2").val(registTestSecond);
        $(".modal_body #parent_phone").val(parentPhone);
        $("input:radio[name=REGIST_PHONE_TYPE]:radio[value="+registPhoneType+"]").prop('checked', true);

        $("#btn_add").hide();
        $("#btn_update").show();
        $('.dan_division').addClass('view')
        datepickerSetting('setting');
        $('#regist_modal').addClass('view');
    });*/


    //// 수정 팝업 호/실 리스트 불러오기
    function roomList(channelCode, roomCode) {

        if(channelCode == null || channelCode == "") {
            channelCode = $("#regi_store").val();
            feeList(channelCode);
        }
        let text = "";
        $.ajax({
            type: "post",
            url: "/admin/regist/roomList.do",
            data: 'searchChannel='+channelCode,
            success: function (data) {
                if (data.success) {
                    text += "<option value=''>선택</option>";
                    for(let i = 0; i < data.roomList.length; i++) {
                    text += "<option value='"+data.roomList[i].ROOM_CODE+"'>"+data.roomList[i].ROOM_NAME+"</option>";
                    }
                    $("#regi_room").html(text);
                    $(".modal_body #regi_room").val(roomCode).prop("select", true);

                } else {
                    Alert.err();
                }
            }
        });
    }

    //// 팝업 내 이용료 불러오기
    function feeList(channelCode, feeCode, school, grade, registExam, registExamDes) {

        if(channelCode == null || channelCode == "") {
            $(".dan_wrap").empty();
        } else {
            let text ="";
            $.ajax({
                type: "post",
                url: "/admin/regist/feeList.do",
                data: 'searchChannel='+channelCode,
                success: function (data) {
                    if (data.success) {
                        for (let i = 0; i < data.feeList.length; i++) {
                            if (data.feeList[i].MANAGER_SET == 'Y') {
                                text += "<label for='regi_ra_"+data.feeList[i].FEE_SEQ+"' class='radio_label A' onclick='transRadio();'>" +
                                    "<input type='radio' value='"+data.feeList[i].FEE_CODE+"' id='regi_ra_"+data.feeList[i].FEE_SEQ+"' name='REGIST_FEE_TYPE'>";
                                text += "<span>"+data.feeList[i].FEE_NAME+"</span></label>";
                            }
                             else if (data.feeList[i].FEE_EXC_SET == 'Y') {
                                text += "<label for='regi_ra_"+data.feeList[i].FEE_SEQ+"' class='radio_label Y' onclick='transRadio();'>" +
                                    "<input type='radio' value='"+data.feeList[i].FEE_CODE+"' id='regi_ra_"+data.feeList[i].FEE_SEQ+"' name='REGIST_FEE_TYPE'>";
                                text += "<span>"+data.feeList[i].FEE_NAME+"</span></label>";
                            } else {
                            text += "<label for='regi_ra_"+data.feeList[i].FEE_SEQ+"' class='radio_label N' onclick='transRadio();'>" +
                                "<input type='radio' value='"+data.feeList[i].FEE_CODE+"' id='regi_ra_"+data.feeList[i].FEE_SEQ+"' name='REGIST_FEE_TYPE'>";
                            text += "<span>"+data.feeList[i].FEE_NAME+"</span></label>";
                            }
                        }

                        $(".dan_wrap").html(text);
                        $("input:radio[name=REGIST_FEE_TYPE]:radio[value="+feeCode+"]").prop('checked', true);
                        $(".modal_body #regi_school").val(school).prop("select", true);
                        $(".modal_body #regi_grade").val(grade).prop("select", true);
                        $(".modal_body #regi_test").val(registExam).prop("select", true);
                        $(".modal_body #regi_other").val(registExamDes);
                        $('.dan_division').addClass('view');
                        transRadio();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }





    //// 팝업 내 등록 버튼
    function registInsert() {
         if (!registCheck()) {
            return false;
        }
        payCheck();
        let params = $("form[name=formRegist]").serialize();
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/regist/registInsert.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/regist/registList.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// Delete 버튼
    function registDelete(SEQ) {
        let check = confirm("삭제하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/regist/registDelete.do",
                data: "REGIST_SEQ=" + SEQ,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/regist/registList.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 팝업 내 수정 버튼
    function registUpdate() {
       if (!registCheck()) {
            return false;
        }
        let check = confirm("저장하시겠습니까?");
        if (check) {
            let params = $("form[name=formRegist]").serialize();
            $.ajax({
                type: "post",
                url: "/admin/regist/registUpdate.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/regist/registList.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 좌석관리 버튼
    function seat_view(CODE, NAME,SEAT, REGIST_START_DATE, REGIST_END_DATE, REGIST_MU_CD, REGIST_SEQ) {
        $("#seat_modal .tit").empty();
        $("#seat_modal .seat_list").empty();
        let name = NAME;
        let code = CODE;
        let seat = SEAT;
        let mu_cd = REGIST_MU_CD;
        let regist_seq = REGIST_SEQ;

        $.ajax({
            type: "post",
            url: "/user/setting/registSeatList.do",
            data: "ROOM_CODE=" + CODE + "&REGIST_START_DATE=" + REGIST_START_DATE +"&REGIST_END_DATE=" + REGIST_END_DATE,
            success: function (data) {
                if(data.success) {
                    showList(data.seatList, name, seat, code, mu_cd, regist_seq);
                }else {
                    Alert.err();
                }
            }
        });
    }

    //// 좌석 상태 값
    function showList(data, name, seat, code, mu_cd, regist_seq) {
        document.querySelector("#regist_seq").value = regist_seq;
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
            } else {
                if(item.REGIST_SEAT == seat) {
                    status_name = "M";
                } else {
                    status_name = "I";
                }
            }
            text += '<li id="seat_li_'+item.SEAT_SEQ+'" class="status_'+status_name+'">'
                + '<a href="#" onclick="seat_update(this,'+item.SEAT_SEQ+','+regist_seq+'); return false;">' +item.SEAT_NAME+ '</a>' +
                '<div class="filter_pop filter_pop_mini">' +
                '<div class="sel">' +
                '<div class="dan">' +
                '<input type="hidden" id="modal_seat_seq" value="'+item.SEAT_SEQ +'">' +
                '</select>' +
                '<span class="arrow">' +
                '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="6 9 12 15 18 9"></polyline></svg>' +
                '</span>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</li>';
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

    //// 좌석 선택 시 좌석 변경
    function seat_update(el,seat_seq,regist_seq) {
        let status = $(el).parent();
        if(status.hasClass('status_M')) {
            alert("현재 사용중인 좌석입니다.")
            return false;
        }
        if (status.hasClass('status_N')) {
            alert("사용불가인 좌석입니다.");
            return false;
        }

        if (status.hasClass('status_I')) {
            alert("사용중인 좌석입니다.");
            return false;
        }
        let newSeat = el.innerText;
        let check = confirm('좌석을 '+newSeat+'번으로 변경하시겠습니까?');
        if(check) {
            $.ajax({
                type: "post",
                url: "/admin/regist/seatUpdate.do",
                data: "REGIST_SEQ=" + regist_seq + "&REGIST_SEAT=" + seat_seq,
                success: function (data) {
                    if(data.success) {
                       Alert.ok();
                       location.href =  '/admin/regist/registList.do';
                    }else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 등록팝업 아이디 검색 기능
    function searchMuId() {
       let searchText = document.querySelector("#input_search_id").value;
       if(searchText == null || searchText == "") {
           alert("검색어를 입력해 주세요.");
           return false;
       }
       let text = "<ul>";
        $.ajax({
            type: "post",
            url: "/admin/regist/searchMuId.do",
            data: "searchText=" + searchText,
            success: function (data) {
                if(data.success) {
                    if (!data.userList.length > 0) {
                        text += "<li class='none'>검색된 결과가 없습니다.</li>";
                    } else {
                        for(let i = 0; i < data.userList.length; i++) {
                            text += "<li>"
                            text += "<a href='#' onclick='muIdPush(this); return false;'>";
                            text += "<input class='cd' type='hidden' value='"+data.userList[i].MU_CD+"'>";
                            text += "<input class='gender' type='hidden' value='"+data.userList[i].MU_GENDER+"'>";
                            text += "<input class='firstDate' type='hidden' value='"+data.userList[i].REGIST_FIRST_DATE+"'>";
                            text += "<span class='id'>"+data.userList[i].MU_ID+"</span>";
                            text += "<span class='name'>"+data.userList[i].MU_NAME+"</span>";
                            text += "<span class='num'>"+data.userList[i].MU_PHONE+"</span>";
                            text += "</a>";
                            text += "</li>";
                        }
                    }
                    text += "</ul>";
                    $(".srch_id_list").html(text);
                }else {
                    Alert.err();
                }
            }
        });
    }

    //// 아이디 검색 후 선택 기능
    function muIdPush (el) {
        let muId = $(el).children('span.id').text();
        let muName = $(el).children('span.name').text();
        let muPhone = $(el).children('span.num').text();
        let muCd = $(el).children('input.cd').val();
        let muGender = $(el).children('input.gender').val();
        let firstDate = $(el).children('input.firstDate').val();

        document.querySelector("#regi_id").value = muId;
        document.querySelector("#regi_name2").value = muName;
        document.querySelector("#regi_me").value = muPhone;
        document.querySelector("#regi_mu_cd").value = muCd;
        document.querySelector("#regi_first_date").value = firstDate;
        document.querySelector("#hidden_id").value = muId;
        $("input:radio[name=REGIST_MU_GENDER]:radio[value="+muGender+"]").prop('checked', true);
        srch_id_close();
    }

    //// 좌석 관리 모달 종료
    function seat_close() {
        $("#seat_modal .seat_list").empty();
        $("#seat_modal .tit").empty();
        $('#seatAdd').val('')
        $('#regist_seq').val('');
        $('#seat_modal').removeClass('view');
        $('.seat_scroll').removeClass('typeScroll');
    }

    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/regist/registList.do';
    }

    //// 금액 확인
    function payCheck () {
        let params = $("form[name=formRegist]").serialize();
        let text = "";
        $.ajax({
            type: "post",
            url: "/user/setting/payCheck.do",
            data: params,
            success: function (data) {
                if (data.success) {
                    if(data.afterSchoolFee > 0) {
                        text += "<span> 종일반 : " + AddComma(data.allDayFee) + "원" + " X " + data.allDay + "일" + " = " + AddComma(data.allDay*data.allDayFee) + "원" + "</span>"
                            +"<span> 방과후반 : " + AddComma(data.afterSchoolFee) + "원" + " X " + data.afterSchool + "일" + " = " + AddComma(data.afterSchool*data.afterSchoolFee) + "원" + "</span>"
                            + "<span> 합계 : " + AddComma((data.afterSchool*data.afterSchoolFee+data.allDay*data.allDayFee)) + "원</span>";
                        $("input[name=PAY_PRICE]").val(AddComma((data.afterSchool*data.afterSchoolFee+data.allDay*data.allDayFee)));

                    } else {
                        text += "<span> 종일반 : " + AddComma(data.allDayFee) + "원" + " X " + data.allDay + "일" + " = " + AddComma(data.allDay*data.allDayFee) + "원" + "</span>";
                        $("input[name=PAY_PRICE]").val(AddComma((data.allDay*data.allDayFee)));
                    }
                    //console.log(text);
                    //$("#div_pay").html(text);
                } else {
                    Alert.err();
                }
            }
        });
    }

    function AddComma(num)
    {
        let regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
    }



</script>