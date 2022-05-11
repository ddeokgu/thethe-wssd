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
            <div class="tit">시험관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>환경설정</span>
                <span class="bar"></span>
                <span>시험관리</span>
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
                                            <label for="option_2">키워드</label>
                                            <div class="sel_type">
                                                <select name="search_type" id="option_1">
                                                    <option value="">옵션 선택</option>
                                                    <option value="TEST_NAME" ${pageInfo.search_type eq 'TEST_NAME' ? 'selected' : ''}>시험 이름</option>
                                                    <option value="TEST_CODE" ${pageInfo.search_type eq 'TEST_CODE' ? 'selected' : ''}>시험 코드</option>
                                                    <option value="REG_ID" ${pageInfo.search_type eq 'REG_ID' ? 'selected' : ''}>등록자</option>
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
                                                <select name="searchTestUse" id="option_2">
                                                    <option value="">옵션 선택</option>
                                                    <option value="Y" ${pageInfo.searchTestUse eq 'Y' ? 'selected' : ''}>사용</option>
                                                    <option value="N" ${pageInfo.searchTestUse eq 'N' ? 'selected' : ''}>사용안함</option>
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
                                <input type="text" placeholder="Search" name="searchText"  value="${pageInfo.searchText}" >
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
                            <col class="m_hide" style="width: 20%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 15%">
                            <col style="width:8%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>시험명</th>
                            <th class="m_hide">시험코드</th>
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
                                    <td class="none" colspan="11"><span>등록된 시험이 없습니다.</span></td>
                                </tr>
                            </c:when>
                            <%--리스트에 아무것도없을때--%>
                            <c:otherwise>
                                <c:forEach items="${list}" var="row" varStatus="status">
                                    <tr>
                                        <td class="num"><c:out
                                                value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                        <td class="td_tit">
                                <span><a href="#" onclick="testEdit('${row.TEST_SEQ}'); return false;"><c:out value="${row.TEST_NAME}"></c:out></a></span>
                                        </td>
                                        <td class="m_hide"><c:out value="${row.TEST_CODE}"></c:out></td>
                                        <td class="m_hide">
                                            <button type="button"
                                                    onclick="useYn(${row.TEST_SEQ})"
                                                    class="${row.USE_YN eq 'Y' ? 'use_btn' : 'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함'}</button>
                                        </td>
                                        <td class="m_hide"><c:out value="${row.REG_ID}"></c:out></td>
                                        <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>
                                        <td class="edit">
                                            <div class="action">
                                                <button type="button" class="sel_btn">
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
                                                </button>
                                                <div class="action_info">
                                                    <ul>
                                                            <%-- <li><a href="#" onclick="codeUpdate('${row.CODE_SEQ}'); return false;">Edit</a></li>--%>
                                                        <li><a href="#" onclick="testEdit('${row.TEST_SEQ}'); return false;">Edit</a></li>
                                                        <li><a href="#"
                                                               onclick="testDelete('${row.TEST_SEQ}'); return false;">Delete</a>
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
                                                        <span class="tit">시험코드</span>
                                                        <span><c:out value="${row.TEST_CODE}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">사용설정</span>
                                                        <span><button onclick="useYn(${row.TEST_SEQ})"
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
<div class="add_modal typeScroll" id="test_modal">
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
                <form id="form_test" name="formTest" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="CODE_TYPE" id="code_type" value="TE">
                        <input type="hidden" name="ADD_CODE" id="add_code">
                        <input type="hidden" name="TEST_SEQ" id="test_seq">
                        <div class="dan">
                            <label for="test_name" class="necessary">시험명</label>
                            <input type="text" name="TEST_NAME" id="test_name" maxlength="15">
                        </div>
                        <div class="dan">
                            <label for="test_use" class="necessary">사용여부</label>
                            <div class="sel_type">
                                <select name="USE_YN" id="test_use">
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
                                onclick="testRegist(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="testUpdate(); return false;"><span>수정</span></button>
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
    let testName = document.querySelector("#test_name");

    function modal_view() {
        $('#test_modal').addClass('view');
    }

    function modal_close() {
        document.forms['formTest'].reset();
        $('#test_modal').removeClass('view');
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/setting/test.do");
        $("#form-search").submit();
    }

    function rowsChange(value) {
        document.frmSearch2.rowsPerPage.value = value;
        $("#form-search").attr("action", "/admin/setting/test.do");
        $("#form-search").submit();
    }


    //// 이용료 등록 시 유효성 검사
    function testRegCheck() {
        if (testName.value == "" || testName.value == null) {
            alert("이용료명을 입력해 주세요.");
            return false;
        }
        return true;
    }

    function testEdit(SEQ) {
        $.ajax({
            type: "post",
            url: "/admin/setting/testOneList.do",
            data: 'SEQ='+SEQ,
            success: function (data) {
                if (data.success) {
                    let test_seq = data.result[0].TEST_SEQ;
                    let test_code = data.result[0].TEST_CODE;
                    let test_name = data.result[0].TEST_NAME;
                    let use_yn = data.result[0].USE_YN;
                    $(".modal_body #test_seq").val(test_seq);
                    $(".modal_body #test_name").val(test_name);
                    $(".modal_body #test_use").val(use_yn).prop("select", true);
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
/*    $(document).on("click", ".open-EditTest", function () {
        let test_seq = $(this).data('seq');
        let test_code = $(this).data('id');
        let test_name = $(this).data('name');
        let use_yn = $(this).data('use');
        $(".modal_body #test_seq").val(test_seq);
        $(".modal_body #test_name").val(test_name);
        $(".modal_body #test_use").val(use_yn).prop("select", true);
        $("#btn_add").hide();
        $("#btn_update").show();
        modal_view();
    });*/

    //// 등록 버튼
    function testRegist() {
        let params = $("form[name=formTest]").serialize();
        if (!testRegCheck()) {
            return false;
        }
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/testRegist.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/test.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// delete 버튼
    function testDelete(SEQ) {
        let check = confirm("삭제하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/testDelete.do",
                data: "TEST_SEQ=" + SEQ,
                success: function (data) {
                    if (data.success) {
                        location.href = "/admin/setting/test.do";
                        Alert.ok();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 수정 버튼
    function testUpdate() {
        if (!testRegCheck()) {
            return false;
        }
            let params = $("form[name=formTest]").serialize();
            $.ajax({
                type: "post",
                url: "/admin/setting/testUpdate.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/setting/test.do";
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
            url: "/admin/setting/testUseYn.do",
            data: 'TEST_SEQ=' + SEQ,
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
        location.href = '/admin/setting/test.do';
    }



</script>