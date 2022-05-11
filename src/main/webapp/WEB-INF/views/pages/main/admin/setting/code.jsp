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
            <div class="tit">코드관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>환경설정</span>
                <span class="bar"></span>
                <span>코드관리</span>
            </div>
        </div>
        <div class="cont">
            <div class="list">
                <form action="#" id="form-search">
                    <input type="hidden" name="currentPage" value="<c:out value="${pageInfo.currentPage}" />">
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
                                            <label for="option_1">코드명</label>
                                            <div class="sel_type">
                                                <select name="" id="option_1">
                                                    <option value="">옵션선택</option>
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
                                                <select name="USE_YN" id="option_2" onchange="goSearch()">
                                                    <option value="">사용여부</option>
                                                    <option value="Y">사용</option>
                                                    <option value="N">사용안함</option>
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
                                            <button type="button" class="btn mr btn_center"><span>초기화</span></button>
                                            <button type="button" class="btn btn_01 btn_center"><span>필터적용</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="srch_form">
                                <button type="button" class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                              transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                              fill="black"></path>
                                    </svg>
                                </button>
                                <input type="text" placeholder="Search">
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
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width:11%">
                            <col style="width:8%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="num">#</th>
                            <th>코드이름</th>
                            <th class="m_hide">코드</th>
                            <th class="m_hide">코드분류</th>
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
                                    <td class="none" colspan="11"><span>등록된 코드가 없습니다.</span></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="row" varStatus="status">
                                    <tr>
                                        <td class="num"><c:out
                                                value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                        <td class="td_tit">
                                <span><a data-toggle="modal" data-seq="${row.CODE_SEQ}" data-id="${row.CODE_ID}"
                                         data-name="${row.CODE_NAME}" data-des="${row.CODE_DES}"
                                         data-type="${row.CODE_TYPE}" data-use="${row.USE_YN}" class="open-EditCode"
                                         href="#code_modal"><c:out value="${row.CODE_NAME}"></c:out></a></span>
                                        </td>
                                        <td class="m_hide"><c:out value="${row.CODE_ID}"></c:out></td>
                                        <td class="m_hide"><c:out value="${row.CODE_TYPE}"></c:out></td>
                                        <td class="m_hide">
                                            <button type="button"
                                                    onclick="useYn(${row.CODE_SEQ}); return false;"
                                                    class="${row.USE_YN eq 'Y' ? 'use_btn':'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함 '}</button>
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
                                                        <li><a data-toggle="modal" data-seq="${row.CODE_SEQ}"
                                                               data-id="${row.CODE_ID}" data-name="${row.CODE_NAME}"
                                                               data-des="${row.CODE_DES}" data-type="${row.CODE_TYPE}"
                                                               data-use="${row.USE_YN}" class="open-EditCode"
                                                               href="#code_modal">Edit</a></li>

                                                        <li><a href="#" onclick="codeDelete('${row.CODE_SEQ}','${row.CODE_ID}'); return false;">Delete</a>
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
                                                        <span class="tit">코드이름</span>
                                                        <span><c:out value="${row.CODE_NAME}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">코드</span>
                                                        <span><c:out value="${row.CODE_ID}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">코드분류</span>
                                                        <span><c:out value="${row.CODE_TYPE}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">사용설정</span>
                                                        <span><button onclick="useYn(${row.CODE_SEQ}); return false;"
                                                                      class="${row.USE_YN eq 'Y' ? 'use_btn':'use_btn_n'}">${row.USE_YN eq 'Y' ? '사용' : '사용안함 '}</button></span>

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
                                <select name="" id="count">
                                    <option value="">10</option>
                                    <option value="">25</option>
                                    <option value="">50</option>
                                    <option value="">100</option>
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
<div class="add_modal typeScroll" id="code_modal">
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    코드 <i id="trans">등록</i>
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
                <form id="form_code" name="formCode" method="post" action="/" enctype="multipart/form-data">
                    <div class="modal_get typeScroll">
                        <input type="hidden" name="CODE_SEQ" id="code_seq">
                        <div class="dan">
                            <label for="code_id" class="necessary">코드</label>
                            <input type="text" name="CODE_ID" id="code_id">
                        </div>
                        <div class="dan">
                            <label for="code_name" class="necessary">코드이름</label>
                            <input type="text" name="CODE_NAME" id="code_name">
                        </div>
                        <div class="dan">
                            <label for="code_des" class="necessary">코드설명</label>
                            <input type="text" name="CODE_DES" id="code_des">
                        </div>
                        <div class="dan dan50 dan_r">
                            <label for="code_type" class="necessary">코드분류</label>
                            <div class="sel_type">
                                <select name="CODE_TYPE" id="code_type">
                                    <c:forEach items="${codeGroupList}" var="row2">
                                        <option value="<c:out value="${row2.CODE_GROUP_KEY}"></c:out>" ${row2.CODE_GROUP_KEY == pageInfo.codeGroupId ? ' selected' : ''}>
                                            <c:out value="${row2.CODE_GROUP_NAME}"></c:out></option>
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
                            <label for="code_use" class="necessary">사용여부</label>
                            <div class="sel_type">
                                <select name="USE_YN" id="code_use">
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
                                onclick="codeRegist(); return false;"><span>등록</span></button>
                        <button id="btn_update" type="button" style="display: none" class="btn btn_01 btn_big"
                                onclick="codeUpdate(); return false;"><span>수정</span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>

    function modal_view() {
        $('#code_modal').addClass('view');
    }

    function modal_close() {
        document.forms['formCode'].reset();
        $('#code_modal').removeClass('view');
    }

    //// 공통 변수 선언
    let codeId = document.querySelector("#code_id");
    let codeName = document.querySelector("#code_name");
    let codeDes = document.querySelector("#code_des");
    let orgCodeId = "";

    //// 코드 등록 시 유효성 검사
    function codeRegCheck() {
        if (codeId.value == "" || codeId.value == null) {
            alert("코드를 입력해 주세요.");
            return false;
        }
        if (codeName.value == "" || codeName.value == null) {
            alert("코드이름을 입력해 주세요.");
            return false;
        }
        if (codeDes.value == "" || codeDes.value == null) {
            alert("코드설명을 입력해 주세요.");
            return false;
        }
        return true;
    }

    //// 코드 edit 버튼
    $(document).on("click", ".open-EditCode", function () {
        let code_seq = $(this).data('seq');
        let code_id = $(this).data('id');
        let code_name = $(this).data('name');
        let code_des = $(this).data('des');
        let code_type = $(this).data('type');
        let use_yn = $(this).data('use');
        orgCodeId = code_id;
        $(".modal_body #code_seq").val(code_seq);
        $(".modal_body #code_id").val(code_id);
        $(".modal_body #code_name").val(code_name);
        $(".modal_body #code_des").val(code_des);
        $(".modal_body #code_type").val(code_type).prop("select", true);
        $(".modal_body #code_use").val(use_yn).prop("select", true);
        $("#btn_add").hide();
        $("#btn_update").show();
        modal_view();
    });

    //// 등록 버튼
    function codeRegist() {
        let params = $("form[name=formCode]").serialize();
        let code = codeId.value;
        if (!codeRegCheck()) {
            return false;
        }
        let check = confirm("저장하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/codeCheck.do",
                data: "CODE_ID=" + code,
                success: function (data) {
                    if (data.success) {
                        $.ajax({
                            type: "post",
                            url: "/admin/setting/codeRegist.do",
                            data: params,
                            success: function (data) {
                                if (data.success) {
                                    Alert.ok();
                                    location.href = "/admin/setting/code.do";
                                } else {
                                    Alert.err();
                                }
                            }
                        });
                    } else {
                        alert("중복되는 코드가 존재합니다.");
                    }
                }
            });
        }
    }

/*    function deleteCheck(ID) {
        $.ajax({
            type: "post",
            url: "/admin/setting/channelCodeDeleteCheck.do",
            data: "CODE_ID=" + ID,
            success: function (data) {
                if (data.result > 0) {
                    alert("코드를 사용중인 지점이 존재합니다.");
                    return false;
                } else {

                }
            }
        });
    }*/

    //// 삭제 버튼
    function codeDelete(SEQ, ID) {
        let check = confirm("삭제하시겠습니까?");
        if (check) {
            $.ajax({
                type: "post",
                url: "/admin/setting/codeDelete.do",
                data: "CODE_SEQ=" + SEQ,
                success: function (data) {
                    if (data.success) {
                        location.href = "/admin/setting/code.do";
                        Alert.ok();
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    //// 수정 버튼
    function codeUpdate() {
        if (!codeRegCheck()) {
            return false;
        }
        let params = $("form[name=formCode]").serialize();
        let code_id = $("#form_code [name='CODE_ID']").val()
        if (orgCodeId != code_id) {
            $.ajax({
                type: "post",
                url: "/admin/setting/codeCheck.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        $.ajax({
                            type: "post",
                            url: "/admin/setting/codeUpdate.do",
                            data: params,
                            success: function (data) {
                                if (data.success) {
                                    Alert.ok();
                                    location.href = "/admin/setting/code.do";
                                } else {
                                    Alert.err();
                                }
                            }
                        });
                    } else {
                        alert("중복되는 코드가 존재합니다.");
                    }
                }
            });
        } else {
            let check = confirm("저장하시겠습니까?");
            if (check) {
                $.ajax({
                    type: "post",
                    url: "/admin/setting/codeUpdate.do",
                    data: params,
                    success: function (data) {
                        if (data.success) {
                            Alert.ok();
                            location.href = "/admin/setting/code.do";
                        } else {
                            Alert.err();
                        }
                    }
                });
            }
        }
    }

    function useYn(SEQ) {
        $.ajax({
            type: 'post',
            url: "/admin/setting/codeUseYn.do",
            data: 'CODE_SEQ=' + SEQ,
            success: function (data) {
                if (data.success) {
                    location.reload();
                } else {
                    Alert.err();
                }
            }
        });
    }
</script>