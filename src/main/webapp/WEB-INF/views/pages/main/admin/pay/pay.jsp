<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<div class="area">
    <div class="inner typeScroll">
        <div class="cate">
            <div class="tit">결제관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>결제관리</span>
                <span class="bar"></span>
                <span>결제관리</span>
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
                                                    <option value="PAY_MU_NAME" ${pageInfo.search_type eq 'PAY_MU_NAME' ? 'selected' : ''}>
                                                        결제자
                                                    </option>
                                                    <option value="PAY_MU_PHONE" ${pageInfo.search_type eq 'PAY_MU_PHONE' ? 'selected' : ''}>
                                                        전화번호
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
                                        <%--<div class="dan">
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
                                        </div>--%>

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
                        <%--<div class="list_tool">
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
                            <col class="m_hide" style="width: 5%">
                            <col class="m_hide" style="width: 20%">
                            <col class="m_hide" style="width: 10%">
                            <col>
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 10%">
                            <col style="width:5%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th class="m_hide">결제 유형</th>
                            <th>결제 번호</th>
                            <th class="m_hide">결제자</th>
                            <th class="m_hide">금액</th>
                            <th class="m_hide">전화번호</th>
                            <th class="m_hide">이메일</th>
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
                                   <td class="none" colspan="11"><span>등록된 결제 리스트가 없습니다.</span></td>
                                </tr>
                                <%--리스트에 아무것도없을때--%>
                            </c:when>
                        <c:otherwise>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <input type="hidden" value="${row.PAY_SEQ}">
                                <td class="num"><c:out
                                        value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.PAY_METHOD eq 'CARD' ? '카드' : '계좌이체'}"></c:out></td>
                                <td class="td_tit"><c:out value="${row.PAY_CODE}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.PAY_MU_NAME}"></c:out><br>(${row.REG_ID})</td>
                                <td class="m_hide"><fmt:formatNumber value="${row.PAY_PRICE}" pattern="#,###"></fmt:formatNumber>원</td>
                                <td class="m_hide"><c:out value="${row.PAY_MU_PHONE}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.PAY_MU_EMAIL}"></c:out></td>
                                <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                                <td class="edit">
                                    <c:choose>
                                        <c:when test="${row.CANCEL_YN eq 'N'}">
                                            <div class="action action_left">
                                                <div class="action">
                                                    <button type="button" class="sel_btn balance_btn sel_btn1" onclick="pay_cancel_view('${row.PAY_SEQ}','${row.PAY_CODE}','${row.PAY_MU_NAME}','${row.PAY_PRICE}', '${row.PAY_METHOD}', '${row.PAY_TID}'); return false;">
                                                        <span>결제취소</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <span>취소 완료</span>
                                        </c:otherwise>
                                    </c:choose>

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
<div class="add_modal typeScroll" id="pay_modal">
    <div class="modal_bg" onclick="pay_modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    결제 취소
                </div>
                <div class="close">
                    <button type="button" onclick="pay_modal_close();return false;">
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
                <form name="formPayCancel" id="frmCancel_innopay" action="/" >
                    <input type="hidden" id="modal_pay_method" name="svcCd">
                    <input type="hidden" id="modal_pay_tid" name="tid">
                    <input type="hidden" id="modal_pay_seq" name="seq">
                    <div class="modal_get typeScroll">
                        <div class="dan">
                            <label for="modal_pay_name" class="necessary">결제자</label>
                            <div class="srch_set dan_see">
                                <input type="text" name="PAY_MU_NAME" id="modal_pay_name" maxlength="15" readonly>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="modal_pay_code" class="necessary">주문번호</label>
                            <div class="srch_set dan_see">
                                <input type="text" name="payCode" id="modal_pay_code" maxlength="15" readonly>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="modal_pay_price" class="necessary">결제 금액</label>
                            <div class="srch_set dan_see">
                                <input type="text" name="cancelAmt" id="modal_pay_price" maxlength="15" readonly>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="modal_cancel_msg" class="necessary">취소 사유</label>
                            <div class="srch_set dan_see">
                                <input type="text" name="cancelMsg" id="modal_cancel_msg" maxlength="10">
                            </div>
                        </div>
                        <div class="dan">
                            <div class="srch_set dan_see">
                                <button type="button" id="btn_canel_pay" onclick="pay_cancel();return false" class="btn btn_center sel_btn1"><span>결제 취소</span></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>


    function pay_cancel_view(SEQ, CODE, NAME, PRICE, METHOD, TID) {

        if(METHOD == 'CARD') {
            document.querySelector("#modal_pay_method").value='01';
        } else if (METHOD == 'BANK') {
            document.querySelector("#modal_pay_method").value='02';
        }

        document.querySelector("#modal_pay_seq").value = SEQ;
        document.querySelector("#modal_pay_code").value = CODE;
        document.querySelector("#modal_pay_name").value = NAME;
        document.querySelector("#modal_pay_price").value = PRICE;
        document.querySelector("#modal_pay_tid").value = TID;

        $('#pay_modal').addClass('view');
    }

    function pay_modal_close() {
        $('#pay_modal').removeClass('view');
    }

    function pay_cancel() {
        let cancelMsg = document.querySelector("#modal_cancel_msg").value;
        if(cancelMsg == null || cancelMsg == '') {
            alert('취소 사유를 입력해 주세요.');
            return false;
        }
        let param = $("#frmCancel_innopay").serializeObject();
        if (confirm("결제를 취소 하시겠습니까?")) {
           $.ajax({
                type: 'POST',
                contentType: 'application/json',
                url: "/admin/pay/payCancel.json",
                data: JSON.stringify(param),
                success: function (data) {
                    if (data.result) {
                        alert("처리되었습니다.");
                        location.reload();
                    } else {
                        alert("오류가 발생하였습니다." + "("+data.message+")");
                    }
                },
                error: function (xhr, status, error) {
                    alert("오류가 발생하였습니다.");
                }
            });
        }
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/pay/payList.do");
        $("#form-search").submit();
    }

    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/pay/payList.do';
    }



</script>