<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-14
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<div class="area">
    <div class="inner typeScroll">
        <div class="cate">
                <div class="tit">회원관리</div>
                <div class="bar"></div>
                <div class="cate_list">
                    <a href="/master/main">HOME</a>
                    <span class="bar"></span>
                    <span>회원관리</span>
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
                                                    <option value="MU_NAME" ${pageInfo.search_type eq 'MU_NAME' ? 'selected' : ''}>
                                                        이름
                                                    </option>
                                                    <option value="MU_ID" ${pageInfo.search_type eq 'MU_ID' ? 'selected' : ''}>
                                                        아이디
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
                                            <label for="option_2">성별</label>
                                            <div class="sel_type">
                                                <select name="REGIST_MU_TYPE" id="option_2">
                                                    <option value="">옵션 선택</option>
                                                    <option value="M" ${pageInfo.MU_GENDER eq 'M' ? 'selected' : ''}>
                                                        남
                                                    </option>
                                                    <option value="F" ${pageInfo.MU_GENDER eq 'F' ? 'selected' : ''}>
                                                        여
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
                    </div>
                </form>
                <div class="list_detail">
                    <table class="table_type01">
                        <colgroup>
                            <col class="num" style="width: 35px">
                            <col>
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 10%">
                            <col class="m_hide" style="width: 9%">
                            <col class="m_hide" style="width: 40%">
                            <col class="m_hide" style="width: 9%">
                            <col style="width:5%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="num">#</th>
                                <th >아이디</th>
                                <th class="m_hide">이름</th>
                                <th class="m_hide">전화번호</th>
                                <th class="m_hide">성별</th>
                                <th class="m_hide">주소</th>
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
                                    <td class="none" colspan="9"><span>등록된 리스트가 없습니다.</span></td>
                                </tr>
                                <%--리스트에 아무것도없을때--%>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="row" varStatus="status">
                                    <tr>
                                        <input type="hidden" value="${row.MU_SEQ}">
                                        <td class="num"><c:out
                                                value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>

                                        <td class="td_tit"><c:out value="${row.MU_ID}"></c:out></td>
                                        <td class="m_hide"><c:out value="${row.MU_NAME}"></c:out></td>
                                        <td class="m_hide"><c:out value="${row.MU_PHONE}"></c:out></td>
                                        <td class="m_hide"><c:out value="${row.MU_GENDER eq 'M' ? '남' : '여'}"></c:out></td>
                                        <td class="m_hide"> <c:out value="(${row.MU_ZIP})"></c:out> </span>
                                                <c:out value="${row.MU_ADDRESS}"></c:out></span></td>
                                        <td class="m_hide"><c:out value="${row.REG_DATE}"></c:out></td>

                                        <td class="edit">
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
                                                        <li><a href="#" onclick="passwordReset('${row.MU_ID}','${row.MU_SEQ}', '${row.MU_CD}'); return false;">비밀번호 초기화</a></li>
                                                        <li><a href="#"
                                                               onclick="memberDeleteCheck('${row.MU_ID}','${row.MU_SEQ}', '${row.MU_CD}'); return false;">Delete</a>
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
                                                        <span class="tit">이름</span>
                                                        <span><c:out value="${row.MU_NAME}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">전화번호</span>
                                                        <span><c:out value="${row.MU_PHONE}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">성별</span>
                                                        <span><c:out value="${row.MU_GENDER eq 'M' ? '남' : '여'}"></c:out></span>
                                                    </li>
                                                    <li>
                                                        <span class="tit">주소</span>
                                                        <span><c:out value="(${row.MU_ZIP})"></c:out></span>
                                                        <span><c:out value="${row.MU_ADDRESS}"></c:out></span>
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

<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>

    function passwordReset(ID, SEQ, CD) {
        let param = {"MU_ID" : ID, "loginUserSeq": SEQ, "mbCd" :CD};
        let check = confirm("'"+ID+"' 회원 비밀번호를 초기화 하시겠습니까?");
        if(check) {
            $.ajax({
                type: "post",
                url: "/admin/member/passwordReset.do",
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/admin/member/userList.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }


    function memberDeleteCheck(ID, SEQ, CD) {
        let param = {"MU_ID" : ID, "loginUserSeq": SEQ, "mbCd" :CD};
        let check = confirm("'"+ID+"' 회원을 삭제 하시겠습니까?");
        if(check) {
            $.ajax({
                type: "post",
                url: "/admin/member/memberDeleteCheck.do",
                contentType: 'application/json',
                data: JSON.stringify(param),
                success: function (data) {
                    if (data.success) {
                        if(data.count > 0) {
                            alert("등록된 등록 정보가 존재합니다.");
                            return false;
                        } else {
                            memberDelete(param);
                        }
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    function memberDelete(param) {
        $.ajax({
            type: "post",
            url: "/admin/member/memberDelete.do",
            contentType: 'application/json',
            data: JSON.stringify(param),
            success: function (data) {
                if (data.success) {
                   Alert.ok();
                   location.reload();
                } else {
                    Alert.err();
                }
            }
        });
    }

    //// 페이지 이동
    function linkPage(pageNo) {
        document.frmSearch2.currentPage.value = pageNo;
        $("#form-search").attr("action", "/admin/member/userList.do");
        $("#form-search").submit();
    }

    //// 필터 초기화 버튼
    function filterClear() {
        location.href = '/admin/member/userList.do';
    }


</script>
