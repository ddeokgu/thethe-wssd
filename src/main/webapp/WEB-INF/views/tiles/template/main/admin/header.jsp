<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<sec:authentication property="principal.allowedMenuMap['MASTER_MENU']"
	var="menuItems" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SERVLET_PATH" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<c:set var="query" value="${pageContext.request.queryString}" />
<div class="m_bg"></div>
<!-- header -->
<header id="header">
    <div class="hd_menu">
    <button type="button">
        <img src="/resources/main/admin/img/icon/master_menu.png" alt="전체메뉴">
    </button>
    </div>
    <div class="hd_logo">
        <a href="/master/main.do"><img src="/resources/main/admin/img/common/master_logo.png" alt="와신상담 관리자"></a>
    </div>
    <div class="hd_util">
        <ul>
           <%-- <li class="srch ">
                <a href="#"><img src="/resources/main/admin/img/icon/master_srch.png" alt="검색"></a>
                <div class="srch_form">
                    <form action="#">
                        <div class="form_inner">
                            <input type="search">
                            <a href="#"><img src="/resources/main/admin/img/icon/master_srch.png" alt="검색"></a>
                        </div>
                    </form>
                </div>

            </li>--%>
            <li class="user">
                <a href="#" ><span><img src="/resources/main/admin/img/icon/master_user.png" alt="사람"></span><span>
                <sec:authentication property="principal.id"/>
                </span></a>
                <div class="user_info">
                    <ul>
                        <li><a href="#" onclick="pw_modal_view(); return false">Edit Password</a></li>
                        <li><a href="#" onclick="document.getElementById('logoutForm').submit();">Log Out</a></li>
                    </ul>
                </div>
            </li>
            <form:form id="logoutForm" method="POST" action="/logout">
						<sec:authentication property="principal.mbType" var="type" />
						<input type="hidden" id="mb_type" name="mb_type" value="${type }" />
		    </form:form>
		    <c:if test="${empty query}">
						<c:set var="url" value="${SERVLET_PATH}" />
			</c:if>
			<c:if test="${!empty query}">
						<c:set var="url" value="${SERVLET_PATH}?${fn:substring(query,0,10)}" />
						<c:set var="url2" value="${SERVLET_PATH}?${fn:substring(query,0,30)}" />
						<c:set var="promoUrl" value="${SERVLET_PATH}?${fn:substring(query,0,13)}" />
			</c:if>
            <li class="m_menu"><a href="#"><img src="/resources/main/admin/img/icon/master_menu.png" alt="전체메뉴"></a></li>
        </ul>
    </div>
</header>
<!-- header -->
<nav id="nav">
    <div class="nav_inner typeScroll">
        <div class="nav_user ">
            <span><img src="/resources/main/admin/img/icon/master_user.png" alt="사람"></span><span><i>
            <sec:authentication property="principal.id" />
            </i><i><sec:authentication property="principal.name" /></i></span>
            <a href="#" class="m_close">

                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-x" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <line x1="18" y1="6" x2="6" y2="18"></line>
                    <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
            </a>
        </div>
        <div class="nav_tit">
            <span>CORE</span>
        </div>
        <div class="nav_menu nav_main">
            <%-- <ul>
                <li>
                    <a href="/master/main" class="<c:if test="${SERVLET_PATH == '/master/main'}">active</c:if>">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-activity" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M3 12h4l3 8l4 -16l3 8h4"></path>
                            </svg>
                        </i>
                        <i class="name">Dashboard</i>
                    </a>
                </li>
            </ul> --%>
            
             <ul>
               <c:forEach var="mdepth" items="${menuItems}" varStatus="loop">
               <c:if test="${mdepth.menuSeq eq '17'}">
                <li data-seq="${mdepth.menuSeq}">
                    <a href="${mdepth.programUrl}?${mdepth.programParameter}&menuSeq=${mdepth.menuSeq}" class="<c:if test="${mdepth.selected || SERVLET_PATH == '/master/main.do'}">active</c:if>"
                    onclick="if('${mdepth.menuSeq}' == '17'){location.href='${mdepth.programUrl}?menuSeq=17';}else{}" >
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler ${mdepth.setIcon}" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M3 12h4l3 8l4 -16l3 8h4"></path>
                            </svg>
                        </i>
                        <i class="name">${mdepth.menuName}</i>
                    </a>
                </li>
                </c:if>
                </c:forEach>
            </ul>
            
            
            
        </div>
        <div class="nav_tit">
            <span>VIEWS</span>
        </div>
        <div class="nav_menu nav_color">
            <ul>
             <%--
                <li>
                    <a href="/master/member/list" class="<c:if test="${SERVLET_PATH == '/master/member/list'}">active</c:if>">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" className="icon icon-tabler icon-tabler-brand-open-source" width=24 height=24 viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" fill="none" strokeLinecap="round" strokeLinejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M12 3a9 9 0 0 1 3.618 17.243l-2.193 -5.602a3 3 0 1 0 -2.849 0l-2.193 5.603a9 9 0 0 1 3.617 -17.244z"></path>
                            </svg>
                        </i>
                        <i class="name">회원관리</i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-table-export" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M11.5 20h-5.5a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v7.5m-16 -3.5h16m-10 -6v16m4 -1h7m-3 -3l3 3l-3 3"></path>
                            </svg>
                        </i>
                        <i class="name">등록관리</i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-credit-card" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <rect x="3" y="5" width="18" height="14" rx="3"></rect>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                                <line x1="7" y1="15" x2="7.01" y2="15"></line>
                                <line x1="11" y1="15" x2="13" y2="15"></line>
                            </svg>
                        </i>
                        <i class="name">결제관리</i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-stats" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M11.795 21h-6.795a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v4"></path>
                                <path d="M18 14v4h4"></path>
                                <circle cx="18" cy="18" r="4"></circle>
                                <path d="M15 3v4"></path>
                                <path d="M7 3v4"></path>
                                <path d="M3 11h16"></path>
                            </svg>
                        </i>
                        <i class="name">출석부관리</i>
                    </a>
                </li>
                <li class="arrow">
                    <a href="#">
                        <i class="icon_m">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-settings" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </i>
                        <i class="name">환경설정</i>
                        <i class="icon_a">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </i>
                    </a>
                    <div class="nav_depth">
                        <ul>
                            <li><a href="/admin/setting/room.do"><i class="name">실/좌석관리</i></a></li>
                      <%--      <li class="arrow">
                                <a href="#">
                                    <i class="name">좌석관리</i>
                                    <i class="icon_a">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <polyline points="6 9 12 15 18 9"></polyline>
                                        </svg>
                                    </i>
                                </a>
                                <div class="nav_depth nav_depth1">
                                    <ul>
                                        <li><a href="#"><i class="name">뎁스테스트3</i></a></li>
                                        <li><a href="#"><i class="name">뎁스테스트3</i></a></li>
                                    </ul>
                                </div>
                            </li>--%>
                  <%--           
                            <li><a href="/admin/setting/fee.do"><i class="name">이용료관리</i></a></li>
                            <li><a href="/admin/setting/code.do"><i class="name">코드관리</i></a></li>
                            <li><a href="/admin/setting/channel.do"><i class="name">지점관리</i></a></li>
                        </ul>
                    </div>
                </li>
                
                --%>
             
                <c:forEach var="depth1" items="${menuItems}" varStatus="loop">
               
                <c:if test="${depth1.depth == 1 && depth1.menuSeq ne 17}">
                 <li class="arrow <c:if test="${depth1.selected}">view</c:if>" data-seq="${depth1.menuSeq}">
                    <c:set var="doneLoop" value="true"/>
                    <a href="#" class="<c:if test="${depth1.selected}">active</c:if>">
                        <i class="icon_m">
                            <c:choose>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-brand-open-source' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-open-source" width="24" height="24" viewBox="0 0 24 24" strokewidth="2" stroke="currentColor" fill="none" strokelinecap="round" strokelinejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M12 3a9 9 0 0 1 3.618 17.243l-2.193 -5.602a3 3 0 1 0 -2.849 0l-2.193 5.603a9 9 0 0 1 3.617 -17.244z"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-table-export' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-table-export" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M11.5 20h-5.5a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v7.5m-16 -3.5h16m-10 -6v16m4 -1h7m-3 -3l3 3l-3 3"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-credit-card' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-credit-card" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <rect x="3" y="5" width="18" height="14" rx="3"></rect>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                        <line x1="7" y1="15" x2="7.01" y2="15"></line>
                                        <line x1="11" y1="15" x2="13" y2="15"></line>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-calendar-stats' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-stats" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M11.795 21h-6.795a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v4"></path>
                                        <path d="M18 14v4h4"></path>
                                        <circle cx="18" cy="18" r="4"></circle>
                                        <path d="M15 3v4"></path>
                                        <path d="M7 3v4"></path>
                                        <path d="M3 11h16"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-settings' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-settings" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-chart-donut' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chart-donut" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M10 3.2a9 9 0 1 0 10.8 10.8a1 1 0 0 0 -1 -1h-3.8a4.1 4.1 0 1 1 -5 -5v-4a0.9 .9 0 0 0 -1 -.8"></path>
                                        <path d="M15 3.5a9 9 0 0 1 5.5 5.5h-4.5a9 9 0 0 0 -1 -1v-4.5"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-notification' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-notification" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M10 6h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"></path>
                                        <circle cx="17" cy="7" r="3"></circle>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-box-multiple' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-box-multiple" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <rect x="7" y="3" width="14" height="14" rx="2"></rect>
                                        <path d="M17 17v2a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2v-10a2 2 0 0 1 2 -2h2"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-bookmarks' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-bookmarks" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M13 7a2 2 0 0 1 2 2v12l-5 -3l-5 3v-12a2 2 0 0 1 2 -2h6z"></path>
                                        <path d="M9.265 4a2 2 0 0 1 1.735 -1h6a2 2 0 0 1 2 2v12l-1 -.6"></path>
                                    </svg>
                                </c:when>
                                <c:when test="${depth1.setIcon  eq 'icon-tabler-device-analytics' }">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-device-analytics" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <rect x="3" y="4" width="18" height="12" rx="1"></rect>
                                        <line x1="7" y1="20" x2="17" y2="20"></line>
                                        <line x1="9" y1="16" x2="9" y2="20"></line>
                                        <line x1="15" y1="16" x2="15" y2="20"></line>
                                        <path d="M8 12l3 -3l2 2l3 -3"></path>
                                    </svg>
                                </c:when>

                            </c:choose>
                        </i>
                        <i class="name">${depth1.menuName}</i>
                        
                        <c:forEach var="depth2" items="${menuItems}" varStatus="loop">
                        <c:if test="${depth2.depth == 2 && depth1.menuSeq == depth2.parentMenuSeq && doneLoop}">
                        <c:set var="doneLoop" value="false"/>
                        <i class="icon_a">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </i>
                        </c:if>
                        </c:forEach>
                    </a>
                <c:if test="${!doneLoop}">
                    <div class="nav_depth">
                        <ul>
                             <c:forEach var="depth2" items="${menuItems}" varStatus="loop">
                             <c:if test="${depth2.depth == 2 and depth2.parentMenuSeq == depth1.menuSeq}">
                             <c:set var="doneLoop3" value="true"/>
                             <li>
                             <a href="#" 
                             onclick="if('${depth2.programUrl}' != ''){location.href='${depth2.programUrl}?${depth2.programParameter}&menuSeq=${depth2.menuSeq}';}else{}"
                             class="<c:if test="${depth2.selected}">active</c:if>">
                             <i class="name">${depth2.menuName}</i>
                                    <c:forEach var="depth3" items="${menuItems}" varStatus="loop">
														<c:if test="${depth3.depth == 3 && depth2.menuSeq == depth3.parentMenuSeq && doneLoop3}">
															<c:set var="doneLoop3" value="false" />
														</c:if>
									</c:forEach>
							</a>
                             </li>
                            </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                 </c:if>
                  </li>
                  </c:if>
               
              
                
                </c:forEach>
                
            </ul>
        </div>
       
        <div class="m_nav">
            <div class="nav_tit">
                <span>USER</span>
            </div>
            <div class="nav_menu">
                <ul>
                    <li>
                        <a href="#" onclick="pw_modal_view(); return false">
                            <i class="icon_m">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-key" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <circle cx="8" cy="15" r="4"></circle>
                                    <line x1="10.85" y1="12.15" x2="19" y2="4"></line>
                                    <line x1="18" y1="5" x2="20" y2="7"></line>
                                    <line x1="15" y1="8" x2="17" y2="10"></line>
                                </svg>
                            </i>
                            <i class="name">Edit Password</i>
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="document.getElementById('logoutForm').submit();">
                            <i class="icon_m">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-logout out" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" >
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path d="M14 8v-2a2 2 0 0 0 -2 -2h-7a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2 -2v-2"></path>
                                    <path d="M7 12h14l-3 -3m0 6l3 -3"></path>
                                </svg>
                            </i>
                            <i class="name">Log Out</i>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
    <div class="nav_copy">
        <span>© 2022 와신상담 All Rights Reserved</span>
    </div>
</nav>
<div class="add_modal edit_modal typeScroll" id="pw_edit_modal" >
    <div class="modal_bg" onclick="pw_modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    비밀번호 <i id="trans2">확인</i>
                </div>
                <div class="close">
                    <button type="button" onclick="pw_modal_close();return false;">
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
            <div class="modal_body modal_pw_body pw_prev_view">
                <form action="" id="editform">
                  <sec:authentication property="principal.id" var="prId"/>
                  <sec:authentication property="principal.managerSeq" var="mSeq"/>
                
                    <div class="modal_get typeScroll">
                        <div class="dan">
                            <label for="pw_edit_id" >아이디</label>
                            
                            <input type="text" name="editId" id="pw_edit_id" readonly value="${prId}">
                        </div>
                        <div class="dan">
                            <label for="pw_edit_password">현재 비밀번호</label>
                            <input type="password" name="editPassword" id="pw_edit_password">
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="pw_modal_close();return false;"><span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big" onclick="pw_next_view('${mSeq}'); return false;"><span>확인</span></button>
                    </div>
                </form>
            </div>
            <div class="modal_body modal_pw_body pw_next_view">
                <form action="" id="editNewform">
                 <sec:authentication property="principal.managerSeq" var="mSeq"/>
                 <sec:authentication property="principal.mbCd" var="mbCd" />
                    <div class="modal_get typeScroll">
                        <div class="dan">
                            <label for="pw_edit_new_id" >아이디</label>
                            <input type="text" id="pw_edit_new_id" value="${prId}" readonly>
                        </div>
                        <div class="dan">
                            <label for="pw_edit_new_password" class="necessary">신규 비밀번호</label>
                            <input type="password" id="pw_edit_new_password" name="newPassword">
                        </div>
                        <div class="dan">
                            <label for="pw_edit_re_password" class="necessary">비밀번호 확인</label>
                            <input type="password" id="pw_edit_re_password" name="newPasswordConfirm">
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="pw_modal_close();return false;"><span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big" onclick="pw_modal_update('${mbCd}');return false;"><span>변경</span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    function pw_next_view(seq) {
    	$("#trans2").text("확인");
    	passwordEditCheck(seq);
    }
    function pw_modal_view() {
        var winW = $(window).innerWidth();
    	   $("#editform")[0].reset();   
            $('.modal_pw_body').removeClass('view');
           $('#pw_edit_modal,.pw_prev_view').addClass('view');
           if (winW < 1025) {
             $('.wrap').removeClass('m_view');
           }
    }
    function pw_modal_close() {
           $('#pw_edit_modal,.modal_pw_body').removeClass('view');
            $('.pw_prev_view').addClass('view');
    }
    
    function pw_modal_update(code) {
    	let targetUrl = "/common/member/updatePassword.json";
    	var param = {};
		
		if($("#editNewform input[name='newPassword']").val() != $("#editNewform input[name='newPasswordConfirm']").val()) {
            alert("새 비밀번호 확인 이 새 비밀번호와 다릅니다.");
            $("#editNewform input[name='newPasswordConfirm']").focus();
            return false;
        }
		param.mbCd = code;
		param.password = $("#editNewform input[name=newPassword]").val();

		 $.ajax({
			type : "POST",
			url : targetUrl,
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(param),
		}).done(function(response) {
			if (response.success) {
				alert("패스워드가 변경 되었습니다.");
				location.reload();
			} else {
				alert("오류 발생했습니다.");
			}
		}); 
     }
    
    
    function passwordEditCheck(seq) {
		let targetUrl = "/common/member/checkPassword.json";
		var param = $("#editform").serializeObject();
		param.managerSeq = seq;
		
		$.ajax({
			type : "POST",
			url : targetUrl,
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(param),
		}).done(function(response) {
			if (response.success) {
				alert("인증 되었습니다.");
				$("#editNewform")[0].reset();
				 $("#trans2").text("변경");
				$('.modal_pw_body').removeClass('view');
		        $('.pw_next_view').addClass('view');
			} else {
				alert("패스워드가 다릅니다.");
			}
		});
	}
    
</script>