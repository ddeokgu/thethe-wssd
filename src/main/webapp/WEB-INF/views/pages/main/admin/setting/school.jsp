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
            <div class="tit">학교관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>환경설정</span>
                <span class="bar"></span>
                <span>학교관리</span>
            </div>
        </div>
        <div class="cont">
            <div class="list">
                <form action="#" name="frmSearch2" id="form-search" method="post" class="clearfix">
                    <input type="hidden" name="currentPage" value="<c:out value='${pageInfo.currentPage}'/>"/>
                    <input type="hidden" name="rowsPerPage" value="<c:out value='${pageInfo.rowsPerPage}'/>"/>
                    <div class="list_tit">
                        <div class="list_srch">
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
                                            <div class="sel_type">
                                                <select name="search_type" id="option_1">
                                                    <option value="">옵션선택</option>
                                                    <option value="SCHOOL_NAME" ${pageInfo.search_type == 'SCHOOL_NAME' ? 'selected' : ''}>학교명</option>
                                                    <option value="SCHOOL_ADDRESS" ${pageInfo.search_type == 'SCHOOL_ADDRESS' ? 'selected' : ''}>학교주소</option>
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
                                                <select name="searchSchoolUse" id="option_2">
                                                    <option value="Y" ${pageInfo.searchSchoolUse == 'Y' ? 'selected' : ''}>사용</option>
                                                    <option value="N" ${pageInfo.searchSchoolUse == 'N' ? 'selected' : ''}>사용안함</option>
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
                                            <button type="button" class="btn btn_01 btn_center" onclick="filterSet(); return false;"><span>필터적용</span>
                                            </button>
                                        </div>
                                    </div>
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
                                <input type="text" placeholder="Search" name="searchText" value="${pageInfo.searchText}">
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
                            <col class="m_hide" style="width: 8%">
                            <col class="m_hide" style="width: 25%">
                            <col class="m_hide" style="width: 10%">
                            <col class="m_hide" style="width: 10%">
                            <col class="m_hide" style="width: 10%">
                            <col class="m_hide" style="width:11%">
                            <col style="width:5%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>학교명</th>
                            <th class="m_hide">학교코드</th>
                            <th class="m_hide">주소</th>
                            <th class="m_hide">전화번호</th>
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
                                  <td class="none" colspan="8"><span>등록된 학교가 없습니다.</span></td>
                               </tr>
                              </c:when>
                         <c:otherwise>
                        <c:forEach items="${list}" var="row" varStatus="status">
                        <tr>
                            <td class="num"><c:out
                                    value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                            <td class="td_tit">
                                <span><a href="#" onclick="schoolEdit('${row.SCHOOL_SEQ}'); return false;"><c:out value="${row.SCHOOL_NAME}"></c:out></a></span>
                            </td>
                            <td class="m_hide"><c:out value="${row.SCHOOL_CODE}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.SCHOOL_ADDRESS} ${row.SCHOOL_ADDRESS_DETAIL}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.SCHOOL_PHONE}"></c:out></td>
                            <td class="m_hide">
                                <button type="button"
                                onclick="useYn('${row.SCHOOL_SEQ}', '${row.USE_YN}')"
                                        class="${row.USE_YN eq 'Y' ? 'use_btn' : 'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함'}</button>
                            </td>
                            <td class="m_hide"><c:out value="${row.REG_ID}"></c:out></td>
                            <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                            <td class="edit">
                                <div class="action">
                                    <button type="button" class="sel_btn balance_btn" onclick="vacation_view('${row.SCHOOL_CODE}');">
                                        <span>방학관리</span>
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
                                            <li><a href="#" onclick="schoolEdit('${row.SCHOOL_SEQ}'); return false;">Edit</a></li>
                                            <li><a href="#"
                                                   onclick="schoolDelete('${row.SCHOOL_SEQ}'); return false;">Delete</a>
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
                                            <span class="tit">코드</span>
                                            <span><c:out value="${row.SCHOOL_CODE}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">주소</span>
                                            <span><c:out value="${row.SCHOOL_ADDRESS}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">전화번호</span>
                                            <span><c:out value="${row.SCHOOL_PHONE}"></c:out></span>
                                        </li>
                                        <li>
                                            <span class="tit">사용설정</span>
                                            <span><button onclick="useYn(${row.SCHOOL_SEQ})"
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
                                <select name="" id="count" onchange="return rowsChange(this.value);">
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
<div class="add_modal typeScroll" id="school_modal">
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    학교 <i id="trans">등록</i>
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
                <form id="form_school" name="formSchool" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="CODE_TYPE" id="code_type" value="SC">
                        <input type="hidden" name="ADD_CODE" id="add_code">
                        <input type="hidden" name="SCHOOL_SEQ" id="school_seq">
                        <div class="dan">
                            <label for="school_name" class="necessary">학교명</label>
                            <input type="text" name="SCHOOL_NAME" id="school_name" maxlength="15">
                        </div>
                        <div class="dan">
                            <label for="school_zip" class="">학교주소</label>
                            <div class="address_box">
                                <span class="address_num">
                                    <input type="text" name="SCHOOL_ZIP" readonly id="school_zip"><button type="button" onclick="zipCode()" class="btn btn_center" ><span>학교찾기</span></button>
                                </span>
                                <span class="address_detail">
                                    <input type="text" name="SCHOOL_ADDRESS" id="school_address" readonly>
                                    <input type="text" placeholder="상세주소" name="SCHOOL_ADDRESS_DETAIL" id="school_address_detail" maxlength="20">
                                </span>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="school_phone" class="">전화번호</label>
                            <input type="text" name="SCHOOL_PHONE" id="school_phone" onkeypress="return checkNum(event)" maxlength="15">
                        </div>
                        <div class="dan">
                            <label for="school_use" class="">사용여부</label>
                            <div class="sel_type">
                                <select name="USE_YN" id="school_use">
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
                                onclick="schoolRegist(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="schoolUpdate(); return false;"><span>수정</span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="add_modal typeScroll" id="vacation_modal">
    <div class="modal_bg" onclick="vacation_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    방학관리
                </div>
                <div class="close">
                    <button type="button" onclick="vacation_close();return false;">
                        <input type="hidden" id="modal_school_code" value="">
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
                <form name="formVaction" action="/" >
                    <div class="modal_get typeScroll">

                        <div class="dan dan40 dan_r">
                            <label for="school_zip" class="necessary">방학기간</label>
                            <div class="datePicker datePickerAll">
                                <input type="text"  id="datepicker_vcat" class="picker_form">
                            </div>

                        </div>
                        <div class="dan dan40 dan_b dan_l">
                            <div class="datePicker datePickerAll">
                                <input type="text"  id="datepicker_vcat2" class="picker_form">
                            </div>
                        </div>
                        <div class="dan dan20 dan_b dan_ll">
                            <button type="button" class="btn btn_01 btn_all" onclick="vacation_insert();"><span>추가</span></button>
                        </div>
                        <div class="dan">
                            <div class="vcat_list">
                                <ul id="vacation_list">

                                </ul>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="add_modal typeScroll" id="company_address_modal">
    <div class="modal_bg" onclick="address_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">

            <div class="modal_tit">
                <div class="tit">
                   학교찾기
                </div>
                <div class="close">
                    <button type="button" onclick="address_close();return false;">
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
            <div class="modal_body modal_address" >
                <div class="address_inner " id="address_layer"></div>
            </div>

        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    //// 공통 변수 선언
    let schoolName = document.querySelector("#school_name");
    let schoolAddress = document.querySelector("#school_address");
    let schoolCodeid = document.querySelector("#school_code");
    let schoolPhone = document.querySelector("#school_phone");


    function modal_view() {
        $('#school_modal').addClass('view');
    }
    function vacation_view(CODE) {
        document.querySelector("#modal_school_code").value=CODE;
        let text='';
        $.ajax({
            type: "post",
            url: "/admin/setting/schoolVacationList.do",
            data: "SCHOOL_CODE="+CODE,
            success: function (data) {
                if (data.success) {
                    if(data.list.length > 0) {
                      for(let i=0; i < data.list.length; i++) {
                        text +='<li data-startdate='+data.list[i].VACATION_START+' data-enddate='+data.list[i].VACATION_END+'>';
                        text += '<span class="vcat_icon"> <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-event" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">';
                        text +='<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>';
                        text += '<rect x="4" y="5" width="16" height="16" rx="2"></rect>';
                        text += '<line x1="16" y1="3" x2="16" y2="7"></line>';
                        text += '<line x1="8" y1="3" x2="8" y2="7"></line>';
                        text += '<line x1="4" y1="11" x2="20" y2="11"></line>';
                        text += ' <rect x="8" y="15" width="2" height="2"></rect>';
                        text += '</svg>';
                        text += '</span>';
                        text += '<span>';
                        text += '<i>'+data.list[i].VACATION_START+' ~ '+data.list[i].VACATION_END+'</i>';
                        text += '</span>';
                        text += '<span class="vcat_del">';
                        text += "<button type='button' class='del_icon' onclick='vacation_delete(\""+data.list[i].VACATION_START+"\", \""+data.list[i].VACATION_END+"\""+","+"this)'>";
                        text += '<span>';
                        text += '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-square-x" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">';
                        text += '<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>';
                        text += '<rect x="4" y="4" width="16" height="16" rx="2"></rect>';
                        text += '<path d="M10 10l4 4m0 -4l-4 4"></path>';
                        text += '</svg>';
                        text += '</span>';
                        text += '</button>';
                        text += '</span>';
                        text += '</li>';
                     }
                    } else {
                        text +='<li class="none"><span><i>등록된 방학기간이 없습니다.</i></span></li>';
                    }
                    $("#vacation_list").html(text);
                } else {
                    Alert.err();
                }
            }
        });
        $('#vacation_modal').addClass('view');
    }
    function vacation_close() {
         $('#vacation_modal').removeClass('view');
    }
    function modal_close() {
        document.forms['formSchool'].reset();
        let add_code = document.querySelector("#add_code").value;
        $(".modal_body #school_code option[value="+"'"+add_code+"'"+"]").remove();
        $('#school_modal').removeClass('view');
    }
    function address_close() {
        $('#company_address_modal').removeClass('view');
    }
    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/setting/school.do");
        $("#form-search").submit();
    }

    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/setting/school.do");
        $("#form-search").submit();
    }

    ///// 우편번호 버튼클릭 이벤트
    let element_layer = document.getElementById('address_layer');
    let element_all = $('#company_address_modal');
    function zipCode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var fullAddr = '';
                    let extraAddr = '';
                    if (data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }
                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
                        }
                        fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
                    }
                    document.getElementById('school_zip').value =  data.zonecode;
                    document.getElementById('school_address').value = fullAddr;
                    element_all.removeClass('view');
                },
                width: '100%',
                height: '100%',
                maxSuggestItems: 5
            }).embed(element_layer);

        element_all.addClass('view');
    }


    //// 지점 등록 시 유효성 검사
    function schoolRegCheck() {
        if (schoolName.value == "" || schoolName.value == null) {
            alert("학교명을 입력해 주세요.");
            return false;
        }
        return true;
    }

    function schoolEdit(SEQ) {
        $.ajax({
            type: "post",
            url: "/admin/setting/schoolOneList.do",
            data: 'SCHOOL_SEQ='+SEQ,
            success: function (data) {
                if (data.success) {
                    let school_seq = data.result[0].SCHOOL_SEQ;
                    let school_code = data.result[0].SCHOOL_CODE;
                    let school_name = data.result[0].SCHOOL_NAME;
                    let school_zip = data.result[0].SCHOOL_ZIP;
                    let school_address = data.result[0].SCHOOL_ADDRESS;
                    let school_address_detail = data.result[0].SCHOOL_ADDRESS_DETAIL;
                    let school_phone = data.result[0].SCHOOL_PHONE;
                    let use_yn = data.result[0].USE_YN;
                    let text = "<option value=" + school_code + ">" + school_code + "</option>";
                    $(".modal_body #add_code").val(school_code);
                    $(".modal_body #school_seq").val(school_seq);
                    $(".modal_body #school_code").append(text);
                    $(".modal_body #school_code").val(school_code).prop("select", true);
                    $(".modal_body #school_name").val(school_name);
                    $(".modal_body #school_zip").val(school_zip);
                    $(".modal_body #school_address").val(school_address);
                    $(".modal_body #school_address_detail").val(school_address_detail);
                    $(".modal_body #school_phone").val(school_phone);
                    $(".modal_body #code_use").val(use_yn).prop("select", true);
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
   /* $(document).on("click", ".open-EditSchool", function () {
        let school_seq = $(this).data('seq');
        let school_code = $(this).data('id');
        let school_name = $(this).data('name');
        let school_zip = $(this).data('zip');
        let school_address = $(this).data('address');
        let school_address_detail = $(this).data('detail');
        let school_phone = $(this).data('phone');
        let use_yn = $(this).data('use');
        let text = "<option value=" + school_code + ">" + school_code + "</option>";
        $(".modal_body #add_code").val(school_code);
        $(".modal_body #school_seq").val(school_seq);
        $(".modal_body #school_code").append(text);
        $(".modal_body #school_code").val(school_code).prop("select", true);
        $(".modal_body #school_name").val(school_name);
        $(".modal_body #school_zip").val(school_zip);
        $(".modal_body #school_address").val(school_address);
        $(".modal_body #school_address_detail").val(school_address_detail);
        $(".modal_body #school_phone").val(school_phone);
        $(".modal_body #code_use").val(use_yn).prop("select", true);
        $("#btn_add").hide();
        $("#btn_update").show();
        modal_view();
    });*/

    //// 등록 버튼
    function schoolRegist() {
        let params = $("form[name=formSchool]").serialize();
        if (!schoolRegCheck()) {
            return false;
        }
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/schoolRegist.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/school.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// delete 버튼
    function schoolDelete(SEQ) {
        let check = confirm("삭제하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/schoolDelete.do",
                data: "SCHOOL_SEQ=" + SEQ,
                success: function (data) {
                    if (data.success) {
                        location.href = "/admin/setting/school.do";
                        Alert.ok();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 수정 버튼
    function schoolUpdate() {
        if (!schoolRegCheck()) {
            return false;
        }
            let params = $("form[name=formSchool]").serialize();
            $.ajax({
                type: "post",
                url: "/admin/setting/schoolUpdate.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/school.do";
                    } else {
                        Alert.err();
                    }
                }
            });
    }

    //// 사용설정 버튼
    function useYn(SEQ, USEYN) {
        let USE_YN = "";
        if (USEYN == 'Y') {
            USE_YN = 'N';
        } else {
            USE_YN = 'Y';
        }
        $.ajax({
            type: 'post',
            url: "/admin/setting/schoolUpdate.do",
            data: 'SCHOOL_SEQ=' + SEQ + '&USE_YN='+USE_YN,
            success: function (data) {
                if (data.success) {
                    location.reload();
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// 방학 관리 팝업 추가 버튼
    function vacation_insert() {
        let vacation_start = document.querySelector("#datepicker_vcat").value;
        let vacation_end = document.querySelector("#datepicker_vcat2").value;
        let school_code = document.querySelector("#modal_school_code").value;
        let list = document.querySelectorAll("#vacation_list li");
        let checkFlag = false;

        for (let j = 0; j < list.length; j++) {
            if (list[j].dataset.startdate == vacation_start && list[j].dataset.enddate == vacation_end) {
                checkFlag = true;
                break;
            }
        }
        if (checkFlag) {
            alert("이미 등록된 방학기간 입니다.");
            return false
        }

        let text ='<li data-startdate='+vacation_start+' data-enddate='+vacation_start+'>';
        text += '<span class="vcat_icon"> <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-event" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">';
        text +='<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>';
        text += '<rect x="4" y="5" width="16" height="16" rx="2"></rect>';
        text += '<line x1="16" y1="3" x2="16" y2="7"></line>';
        text += '<line x1="8" y1="3" x2="8" y2="7"></line>';
        text += '<line x1="4" y1="11" x2="20" y2="11"></line>';
        text += ' <rect x="8" y="15" width="2" height="2"></rect>';
        text += '</svg>';
        text += '</span>';
        text += '<span><i>'+vacation_start+' ~ '+vacation_end+'</i></span>';
        text += '<span class="vcat_del">';
        text += "<button type='button' class='del_icon' onclick='vacation_delete(\""+vacation_start+"\", \""+vacation_end+"\""+","+"this)'>";
        text += '<span>';
        text += '<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-square-x" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">';
        text += '<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>';
        text += '<rect x="4" y="4" width="16" height="16" rx="2"></rect>';
        text += '<path d="M10 10l4 4m0 -4l-4 4"></path>';
        text += '</svg>';
        text += '</span>';
        text += '</button>';
        text += '</span>';
        text += '</li>';
        $.ajax({
            type: 'post',
            url: "/admin/setting/schoolVacationInsert.do",
            data: 'SCHOOL_CODE='+school_code+'&VACATION_START='+vacation_start+"&VACATION_END="+vacation_end,
            success: function (data) {
                if (data.success) {

                    $("#vacation_list").append(text);
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// 방학 관리 팝업 삭제 버튼
    function vacation_delete(START,END, obj) {
        let school_code = document.querySelector("#modal_school_code").value;
        $.ajax({
            type: 'post',
            url: "/admin/setting/schoolVacationDelete.do",
            data: 'SCHOOL_CODE='+school_code+'&VACATION_START='+START+"&VACATION_END="+END,
            success: function (data) {
                if (data.success) {
                    $(obj).parent().parent().remove();
                } else {
                    Alert.err();
                }
            }
        });

    }


    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/setting/school.do';
    }

</script>