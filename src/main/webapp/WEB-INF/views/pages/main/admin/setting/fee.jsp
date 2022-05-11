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
            <div class="tit">이용료관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>환경설정</span>
                <span class="bar"></span>
                <span>이용료관리</span>
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
                                            <label for="option_2">키워드</label>
                                            <div class="sel_type">
                                                <select name="search_type" id="option_1">
                                                    <option value="">옵션 선택</option>
                                                    <option value="FEE_NAME" ${pageInfo.search_type eq 'FEE_NAME' ? 'selected' : ''}>
                                                        이용료 이름
                                                    </option>
                                                    <option value="FEE_CODE" ${pageInfo.search_type eq 'FEE_CODE' ? 'selected' : ''}>
                                                        이용료 코드
                                                    </option>
                                                    <option value="REG_ID" ${pageInfo.search_type eq 'REG_ID' ? 'selected' : ''}>
                                                        등록자
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
                                            <label for="option_2">사용여부</label>
                                            <div class="sel_type">
                                                <select name="searchFeeUseYn" id="option_2">
                                                    <option value="" selected>옵션선택</option>
                                                    <option value="Y" ${pageInfo.searchFeeUseYn eq 'Y' ? 'selected' : ''}>사용
                                                    </option>
                                                    <option value="N" ${pageInfo.searchFeeUseYn eq 'N' ? 'selected' : ''}>사용안함
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
                                    <select name="searchChannel" id="" onchange="goSearch()">
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
                                                     height="24" viewBox="0 0 24 24" stroke-width="2"ㄴ
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
                            <col>
                            <col class="m_hide" style="width: 18%">
                            <col class="m_hide" style="width: 10%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width:8%">
                            <col style="width: 7%">
                            <col  style="width:5%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>이용료명</th>
                            <th class="m_hide">지점명</th>
                            <th class="m_hide">이용료코드</th>
                            <th class="m_hide">이용료</th>
                            <th class="m_hide">방과후이용료</th>
                            <th class="m_hide">사용설정</th>
                            <th class="m_hide">등록자</th>
                            <th class="m_hide">등록일</th>
                            <th class="switch">관리자전용</th>
                            <th class="edit">관리</th>
                            <th class="m_show">더보기</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <%--리스트에 아무것도없을때--%>
                               <tr>
                                   <td class="none" colspan="11"><span>등록된 이용료가 없습니다.</span></td>
                                </tr>
                                <%--리스트에 아무것도없을때--%>
                            </c:when>
                        <c:otherwise>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <td class="num"><c:out
                                        value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                <td class="td_tit">
                                <span><a href="#" onclick="feeEdit('${row.FEE_SEQ}'); return false;"><c:out value="${row.FEE_NAME}"></c:out></a></span>
                                </td>
                                <td class="m_hide"><c:out value="${row.CHANNEL_NAME}"></c:out></td>

                                <td class="m_hide"><c:out value="${row.FEE_CODE}"></c:out></td>
                                <td class="m_hide"><fmt:formatNumber value='${row.FEE_SET}' pattern='#,###'/></td>
                                <td class="m_hide"><c:if test="${row.FEE_EXC_SET != 'N'}"><fmt:formatNumber value='${row.FEE_EXC}' pattern='#,###'/></c:if></td>
                                <td class="m_hide">
                                    <button type="button"
                                            onclick="useYn(${row.FEE_SEQ}, 'useYn')"
                                            class="${row.USE_YN eq 'Y' ? 'use_btn' : 'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함'}</button>
                                </td>
                                <td class="m_hide"><c:out value="${row.REG_ID}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                                <td class="switch">
                                    <label for="stack_${row.FEE_SEQ}" class="check_switch check_switch_list">
                                        <input type="checkbox" id="stack_${row.FEE_SEQ}" value="${row.FEE_SEQ}" ${row.MANAGER_SET eq 'Y' ? 'checked' : '' } onclick="useYn(${row.FEE_SEQ}, 'managerSet')">
                                        <span>체크유무</span>
                                    </label>
                                </td>
                                <td class="edit">
                                    <div class="action">
                                        <button type="button" class="sel_btn sel_btn_trans">
                                            <span>관리</span>
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
                                                <li><a href="#" onclick="feeEdit('${row.FEE_SEQ}'); return false;">Edit</a></li>
                                                <li><a href="#"
                                                       onclick="feeDelete('${row.FEE_SEQ}'); return false;">Delete</a>
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
                                                <span class="tit">지점명</span>
                                                <span><c:out value="${row.CHANNEL_NAME}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">이용료코드</span>
                                                <span><c:out value="${row.FEE_CODE}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">이용료</span>
                                                <span><c:out value="${row.FEE_SET}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">방과후이용료</span>
                                                <span><c:out value="${row.FEE_EXC}"></c:out></span>
                                            </li>
                                            <li>
                                                <span class="tit">사용설정</span>
                                                <span><button onclick="useYn(${row.FEE_SEQ}, 'useyn')"
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
<div class="add_modal typeScroll" id="fee_modal">
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    이용료 <i id="trans">등록</i>
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
                <form id="form_fee" name="formFee" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="CODE_TYPE" id="code_type" value="FE">
                        <input type="hidden" name="ADD_CODE" id="add_code">
                        <input type="hidden" name="FEE_SEQ" id="fee_seq">
                        <div class="dan dan_stack">
                            <div class="stack_txt">
                                <span>이용료 관리자전용</span>
                                <span>체크시 이용료의 정보를 관리자페이지에서만 확인가능합니다.</span>
                            </div>
                            <div class="stack_switch">
                                <label for="manager_set" class="check_switch">
                                    <input type="hidden" id="managerSetYn" name="MANAGER_SET" value="">
                                    <input type="checkbox" id="manager_set">
                                    <span>체크유무</span>
                                </label>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="fee_name" class="necessary">이용료명</label>
                            <input type="text" name="FEE_NAME" id="fee_name" maxlength="15">
                        </div>
                        <div class="dan dan50 dan_r">
                            <label for="fee_set" class="necessary">이용료</label>
                            <input type="text" name="FEE_SET" id="fee_set" onkeydown="return checkNum(event)" maxlength="15">
                        </div>
                        <div class="dan dan50 dan_l">
                            <label for="fee_use" class="">사용여부</label>
                            <div class="sel_type">
                                <select name="USE_YN" id="fee_use">
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
                        <div class="dan ">
                            <label for="fee_use" class="necessary">지점선택</label>
                            <div class="sel_type">
                                <select name="CHANNEL_CODE" id="channel_code">
                                    <option value="">선택</option>
                                    <c:forEach var="row" items="${channelList}">
                                        <option value="${row.CHANNEL_CODE}">${row.CHANNEL_NAME}</option>
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
                        <div class="dan dan_see">
                            <label for="fee_night" class="check_label">
                                <input type="hidden" value="" id="feeExcSet" name="FEE_EXC_SET">
                                <input type="checkbox" id="fee_night" class="input_trans">
                                <span>방과후반요금</span>
                            </label>
                            <div class="hide_input" id="div_fee_exc">
                                <input type="text" id="feeExc" name="FEE_EXC" onkeydown="return checkNum(event);" maxlength="10" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;">
                            <span>취소</span></button>
                        <button id="btn_add" type="button" class="btn btn_01 btn_big"
                                onclick="feeRegist(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="feeUpdate(); return false;"><span>수정</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>

    //// 공통 변수 선언
    let feeName = document.querySelector("#fee_name");
    let feeSet = document.querySelector("#fee_set");
    let feeChannel = document.querySelector("#channel_code");

    //// 등록 && 수정 팝업 show
    function modal_view() {
        $('#fee_modal').addClass('view');
    }

    //// 등록 && 수정 팝업 close
    function modal_close() {
        document.forms['formFee'].reset();
        $('#fee_modal').removeClass('view');
        $("#div_fee_exc").removeClass("view");
        $("#feeExc").prop("readonly", true);
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/setting/fee.do");
        $("#form-search").submit();
    }

    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/setting/fee.do");
        $("#form-search").submit();
    }

    //// 이용료 등록 && 수정 시 유효성 검사
    function feeRegCheck() {
        if (feeName.value == "" || feeName.value == null) {
            alert("이용료명을 입력해 주세요.");
            return false;
        }
        if (feeSet.value == "" || feeSet.value == null) {
            alert("이용료를 입력해 주세요.");
            return false;
        }

        if (feeChannel.value == "" || feeChannel.value == null) {
            alert("지점을 선택해 주세요.");
            return false;
        }

        if($("#fee_night").prop("checked")) {
            if($("#feeExc").val() == "" || $("#feeExc").val() == null) {
                alert("방과후반 요금을 입력해 주세요.");
                return false;
            }
            $("#feeExcSet").val("Y");
        } else {
            $("#feeExcSet").val("N");
        }
        if($("#manager_set").prop("checked")) {
            $("#managerSetYn").val("Y");
        } else {
            $("#managerSetYn").val("N");
        }


        return true;
    }

    function feeEdit(SEQ) {
        $.ajax({
            type: "post",
            url: "/admin/setting/feeOneList.do",
            data: 'FEE_SEQ='+SEQ,
            success: function (data) {
                if (data.success) {
                    let fee_seq = data.result[0].FEE_SEQ;
                    let fee_code = data.result[0].FEE_CODE;
                    let fee_name = data.result[0].FEE_NAME;
                    let fee_set = data.result[0].FEE_SET;
                    let use_yn = data.result[0].USE_YN;
                    let channel = data.result[0].CHANNEL_CODE;
                    let manager_set = data.result[0].MANAGER_SET;
                    let fee_exc = data.result[0].FEE_EXC;
                    let fee_exc_set = data.result[0].FEE_EXC_SET;

                    $(".modal_body #fee_seq").val(fee_seq);
                    $(".modal_body #fee_name").val(fee_name);
                    $(".modal_body #fee_set").val(fee_set);
                    $(".modal_body #fee_use").val(use_yn).prop("select", true);
                    $(".modal_body #channel_code").val(channel).prop("select", true);
                    if(manager_set == 'Y' ? $(".modal_body #manager_set").prop('checked', true) : $(".modal_body #manager_set").prop('checked', false));
                    if(fee_exc_set == 'Y'){
                        $(".modal_body #fee_night").prop('checked', true);
                        $("#div_fee_exc").addClass("view");
                        $("#feeExc").prop("readonly", false);
                    }
                    $(".modal_body #feeExc").val(fee_exc);
                    $("#btn_add").hide();
                    $("#btn_update").show();
                    modal_view();
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// Edit 버튼
/*    $(document).on("click", ".open-EditFee", function () {
        let fee_seq = $(this).data('seq');
        let fee_code = $(this).data('id');
        let fee_name = $(this).data('name');
        let fee_set = $(this).data('set');
        let use_yn = $(this).data('use');
        let channel = $(this).data('channel');
        let manager_set = $(this).data('manager');
        let fee_exc = $(this).data('exc');
        let fee_exc_set = $(this).data('exc_set');

        $(".modal_body #fee_seq").val(fee_seq);
        $(".modal_body #fee_name").val(fee_name);
        $(".modal_body #fee_set").val(fee_set);
        $(".modal_body #fee_use").val(use_yn).prop("select", true);
        $(".modal_body #channel_code").val(channel).prop("select", true);
        if(manager_set == 'Y' ? $(".modal_body #manager_set").prop('checked', true) : $(".modal_body #manager_set").prop('checked', false));
        if(fee_exc_set == 'Y'){
            $(".modal_body #fee_night").prop('checked', true);
            $("#div_fee_exc").addClass("view");
            $("#feeExc").prop("readonly", false);
        }
        $(".modal_body #feeExc").val(fee_exc);
        $("#btn_add").hide();
        $("#btn_update").show();
        modal_view();
    });*/

    //// 등록 버튼
    function feeRegist() {


          if (!feeRegCheck()) {
            return false;
        }
        let params = $("form[name=formFee]").serialize();
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/feeRegist.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/fee.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// Delete 버튼
    function feeDelete(SEQ) {
        let check = confirm("삭제하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/feeDelete.do",
                data: "FEE_SEQ=" + SEQ,
                success: function (data) {
                    if (data.success) {
                        location.href = "/admin/setting/fee.do";
                        Alert.ok();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 수정 버튼
    function feeUpdate() {
        if (!feeRegCheck()) {
            return false;
        }
            let params = $("form[name=formFee]").serialize();
            $.ajax({
                type: "post",
                url: "/admin/setting/feeUpdate.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/fee.do";
                    } else {
                        Alert.err();
                    }
                }
            });
    }

    //// 사용설정 버튼
    function useYn(SEQ, gubun) {
        $.ajax({
            type: 'post',
            url: "/admin/setting/feeUseYn.do",
            data: 'FEE_SEQ=' + SEQ + '&GUBUN=' + gubun,
            success: function (data) {
                if (data.success) {
                    if(gubun == 'useYn') {
                        location.reload();
                    }
                } else {
                    Alert.err();
                }
            }
        });
    }


    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/setting/fee.do';
    }



</script>