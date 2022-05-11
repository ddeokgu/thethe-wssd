<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-18
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<div class="area">
    <div class="inner typeScroll">
        <div class="cate">
             <div class="tit">${manage.menuName}</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main.do">HOME</a>
                <span class="bar"></span>
                <span>${manageParent.menuName}</span>
                <span class="bar"></span>
                <span>${manage.menuName}</span>
            </div>
        </div>
        <div class="cont">
            <div class="list">
                <form id="searchForm">
                <input type="hidden" name="currentPage" id="currentPage">
                <input type="hidden" name="rowsPerPage" id="rowsPerPage">
                 <div class="list_tit">
                    <div class="list_srch">
                        <div class="srch_filter">
                            <button type="button" class="btn mr">
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-filter" width="22" height="22" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
                                        <label for="option_1">권한</label>
                                        <div class="sel_type">
                                            <select name="authGroupSeq" id="option_1">
                                             <option value="0">옵션선택</option>
                                             <c:forEach var="auth" items="${authGroupList}">
                                              <option value="${auth.authGroupSeq}">${auth.authGroupName}</option>
                                             </c:forEach>
                                               
                                            </select>
                                            <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="dan">
                                        <label for="option_2">사용여부</label>
                                        <div class="sel_type">
                                            <select name="useYn" id="option_2">
                                                <option value="">옵션선택</option>
                                                <option value="1">사용</option>
                                                <option value="0">사용안함</option>
                                            </select>
                                            <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="dan">
                                        <label for="option_3">키워드</label>
                                        <div class="sel_type">
                                            <select name="searchKeyword" id="option_3">
                                                <option value="all">옵션선택</option>
                                                <option value="managerId">관리자</option>
                                                <option value="managerName">관리자명</option>
                                                <option value="managerEmail">이메일</option>
                                                <option value="registName">등록자</option>
                                            </select>
                                            <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="sel_add">
                                        <button type="button" class="btn mr btn_center" id="filterReset"><span>초기화</span></button>
                                        <button type="button" class="btn btn_01 btn_center" id="filterSave"><span>필터적용</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="srch_form">
                            <button type="button" class="icon" id="searchManagerBtn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                    <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black"></path>
                                </svg>
                            </button>
                            <input type="text" placeholder="Search" name="searchText">
                        </div>

                    </div>
                    <div class="list_tool">

                        <div class="tool_btn">
                            <button type="button" class="btn btn_01" onclick="modal_view(); return false;">
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
                            <col >
                            <col class="m_hide" style="width: 15%">
                            <col  class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 11%">
                            <col  class="m_hide" style="width: 11%">
                            <col style="width: 8%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="num">#</th>
                                <th>관리자</th>
                                <th class="m_hide">이메일</th>
                                <th class="m_hide">사용설정</th>
                                <th class="m_hide">최근로그인</th>
                                <th class="m_hide">등록자</th>
                                <th class="m_hide">등록일</th>
                                <th class="edit">관리</th>
                                <th class="m_show">더보기</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%--리스트에 아무것도없을때--%>
                         <%--   <tr>
                                <td class="none" colspan="8"><span>등록되어 있는 관리자가 없습니다.</span></td>
                            </tr>--%>
                        <%--리스트에 아무것도없을때--%>
                        
                        <c:choose>
                        <c:when test="${MangerList eq null}">
									<tr>
										<td class="none" colspan="8"><span>등록되어 있는 관리자가 없습니다.</span></td>
									</tr>
						</c:when>
                        <c:otherwise>
                        <c:forEach var="manger" items="${MangerList}" varStatus="status">
                            <tr>
                                <td class="num"><c:out value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                <td class="td_tit">
                                    <span><a href="javascript:editMenu('${manger.managerId}');">${manger.managerId}</a></span>
                                    <span>${manger.managerName}<i class="bar"></i>${manger.authGroupName}</span>
                                </td>
                                <td class="m_hide">${manger.managerEmail}</td>
                                <td class="m_hide">
                                <c:choose>
                                <c:when test="${manger.useyn_txt eq '사용'}">
                                <a href="#" onclick="useEdit('0', '${manger.managerSeq}');"><span class="use_btn">${manger.useyn_txt}</span></a>
                                </c:when>
                                <c:otherwise>
                                <a href="#" onclick="useEdit('1', '${manger.managerSeq}');"><span class="use_btn_n">${manger.useyn_txt}</span></a>
                                </c:otherwise>
                                </c:choose>
                                </td>
                                <td class="m_hide">${manger.loginDate}</td>
                                <td class="m_hide">${manger.registBy}</td>
                                <td class="m_hide">${manger.registDate}</td>
                                <td class="edit">
                                    <div class="action">
                                        <button type="button" class="sel_btn">
                                            <span>관리</span>
                                            <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                        </button>
                                        <div class="action_info">
                                            <ul>
                                                <li><a href="javascript:editMenu('${manger.managerId}');">Edit</a></li>
                                                <li><a href="javascript:deleteM('${manger.managerSeq}');" id="deleteBtn">Delete</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_show">
                                    <a href="#" class="more">
                                         <span class="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
                                                <span class="tit">이메일</span>
                                                <span>${manger.managerEmail}</span>
                                            </li>
                                            <li>
                                                <span class="tit">사용설정</span>
                                                <span>
                                                <c:choose>
																	<c:when test="${manger.useyn_txt eq '사용'}">
																		<a href="#"
																			onclick="useEdit('0', '${manger.managerSeq}');"><span
																			class="use_btn">${manger.useyn_txt}</span></a>
																	</c:when>
																	<c:otherwise>
																		<a href="#"
																			onclick="useEdit('1', '${manger.managerSeq}');"><span
																			class="use_btn_n">${manger.useyn_txt}</span></a>
																	</c:otherwise>
												</c:choose>
												</span>
                                            </li>
                                            <li>
                                                <span class="tit">최근로그인</span>
                                                <span>${manger.loginDate}</span>
                                            </li>
                                            <li>
                                                <span class="tit">등록자</span>
                                                <span>${manger.registBy}</span>
                                            </li>
                                            <li>
                                                <span class="tit">등록일</span>
                                                <span>${manger.registDate}</span>
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
                                <select name="rowsPerPage" id="rowsPerPage_1">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>

                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
                            <c:if test="${!empty MangerList}">
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
<div class="add_modal typeScroll" id="manager_modal" >
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    관리자 <i id="trans">등록</i>
                </div>
                <div class="close">
                    <button type="button" onclick="modal_close();return false;">
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
            <div class="modal_body">
                <form name="managerRegistForm" id="managerRegistForm">
                    <input type="hidden" name="managerSeq">
				    <input type="hidden" name="changePasswordYn" value="N">
				    <input type="hidden" name="mbCode">
                    <div class="modal_get typeScroll">
                        <div class="dan">
                            <label for="manager_id" class="necessary">아이디</label>
                            <input type="text" id="manager_id" name="managerId" class="required" placeholder="아이디 입력" alt="아이디">
                        </div>
                        <div class="dan">
                            <label for="manager_name" class="necessary">이름</label>
                            <input type="text" id="manager_name" name="managerName" class="required" placeholder="이름 입력" alt="이름">
                        </div>
                        <div class="dan">
                            <label for="manager_password" class="necessary">비밀번호</label>
                            <input type="password" id="manager_password" name="password" >
                        </div>
                        <div class="dan">
                            <label for="manager_email" class="necessary">이메일</label>
                            <input type="email" name="managerEmail" id="manager_email" placeholder="test@email.com" class="required" alt="이메일">
                        </div>
                        <div class="dan dan50 dan_r">
                            <label for="manager_authority" class="necessary">권한</label>
                            <div class="sel_type">
                                <select name="authGroupSeq" id="manager_authority">
                                <c:forEach var="auth" items="${authGroupList}">
                                    <option value="${auth.authGroupSeq}">${auth.authGroupName}</option>
                                </c:forEach>
                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="dan dan50 dan_l">
                            <label for="manager_use" class="necessary">사용여부</label>
                            <div class="sel_type">
                                <select name="useYn" id="manager_use">
                                    <option value="1">사용</option>
                                    <option value="0">사용안함</option>
                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="dan">
                            <label for="manager_note" >비고</label>
                            <input type="text" name="description" id="manager_note" placeholder="ex) 게시판 운영 담당">
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;"><span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big" id="registBtn"  onclick="registManager(); return false;"><span></span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>

function checkPassword(passwordStr) {
    var regexPattern = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
    return (new RegExp(regexPattern)).test(passwordStr);
}

function checkEmail(emailStr) {
    var regexPattern =  /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;
    return (new RegExp(regexPattern)).test(emailStr);
}

    function modal_view() {
           $('#trans').text('');
    	   $('#trans').text('등록');
    	   $("#registBtn > span").text("등록");
           $('#manager_modal').addClass('view');
    }
    function modal_close() {
           $('#manager_modal').removeClass('view');
    }
    
  //저장(등록, 수정) 버튼 클릭시
	/* $(".btn_big").on("click", function() {
		registManager();
	}); */
  
	$("#filterSave").on("click", function() {
		 $(".mr").removeClass('view');
	});
	
	$("#filterReset").on("click", function() {
		$("#option_1 option").prop("selected", false); 
		$("#option_2 option").prop("selected", false); 
		$("#option_3 option").prop("selected", false); 
	})
  
	
  
	//등록, 수정, 상세 화면 이동
	function registManager() {
		
		let targetUrl = "/master/supervisor/createManager.json";
		if($("#managerRegistForm input[name='managerSeq']").val() != "")
	        targetUrl = "/master/supervisor/updateManager.json";
		
		if (checkManagerValid() && confirm("저장 하시겠습니까?")) {
			$("#registBtn").off("click");
			let param = $("form[name=managerRegistForm]").serializeObject();
			let passwordChange = param.password;
			if(passwordChange == "" || passwordChange == null){
				param.changePasswordYn = "N";
			}else{
				param.changePasswordYn = "Y"; 
				
			}

			$.ajax({
				type : "POST",
				url : targetUrl,
				contentType : "application/json",
				dataType : "json",
				data : JSON.stringify(param)
			}).done(
					function(response) {
						if (response.success) {
							alert("저장되었습니다.");
							location.reload();

							// $('#menu_set_modal').removeClass('view');
						} else {
							alert("저장시 오류가 발생하였습니다." + response.message);
							$(
									"#managerRegistForm input[name='"
											+ response.code + "']").focus();
						}
						$(".btn_big").on("click", function() {
							registManager();
						});
					});
			

		} 
	}
	
	function checkManagerValid() {
	    var valid = true;
   		$.each($("#managerRegistForm .required"), function(){
            if($(this).val() == '') {
	            alert($(this).prop('alt') + "(은)는 필수 입력 항목 입니다.");
    			$(this).focus();
    			valid = false;
    			return false;
            }
        });
        if(valid) {
        	/*
            if($('#managerRegistForm input[name="changePasswordYn"]').val() == "Y") {
                //수정시 패스워드 변경
                if(!checkPassword($("#managerRegistForm input[name='newPassword']").val())) {
                    alert("비밀번호는 영문(1자이상), 숫자(1자이상)을 포함하는 8~16자를 입력해 주십시오.");
                    $("#managerRegistForm input[name='newPassword']").focus();
                    return false;
                }
                if($("#managerRegistForm input[name='newPassword']").val() != $("#managerRegistForm input[name='newPasswordConfirm']").val()) {
                    alert("새 비밀번호 확인 이 새 비밀번호와 다릅니다.");
                    $("#managerRegistForm input[name='newPasswordConfirm']").focus();
                    return false;
                }
            } else 
            */
            	
            if($('#managerRegistForm input[name="managerSeq"]').val() == "") {
                //신규 등록
                if($("#managerRegistForm input[name='managerId']").val().length > 20) {
                    alert("관리자 아이디는 최대 20자 입니다.");
                    $("#managerRegistForm input[name='managerId']").focus();
                    return false;
                }
                if(!checkPassword($("#managerRegistForm input[name='password']").val())) {
                    alert("비밀번호는 영문(1자이상), 숫자(1자이상)을 포함하는 8~16자를 입력해 주십시오.");
                    $("#managerRegistForm input[name='password']").focus();
                    return false;
                }
            }

            if($("#managerRegistForm input[name='managerName']").val().length > 20) {
                alert("이름은 최대 20자 입니다.");
                $("#managerRegistForm input[name='managerName']").focus();
                return false;
            }
            if($("#managerRegistForm input[name='managerEmail']").val().length > 50) {
                alert("이메일은 최대 50자 입니다.");
                $("#managerRegistForm input[name='managerEmail']").focus();
                return false;
            }
            if(!checkEmail($("#managerRegistForm input[name='managerEmail']").val())) {
                alert("올바른 이메일 형식을 입력해 주십시오.");
                $("#managerRegistForm input[name='managerEmail']").focus();
                return false;
            }
        }
	    return valid;
	}
  
  
	$("#searchManagerBtn").on("click", function() {
		 searchManagerList();
	});
	
	function editMenu(id) {
		$('#trans').text('');
		$('#trans').text('수정');
		$("#registBtn > span").text("수정");
		let targetUrl = "/master/supervisor/getManagerList.json";
		
		let param = {searchKeyword: "managerId", searchText : id};
		
		$.ajax({
			type : "POST",
			url : targetUrl,
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(param)
		}).done(function(response) {
			
			let data =  response.storeData;
			
			$('#manager_modal').addClass('view');
			
			$("#managerRegistForm input[name='managerSeq']").val(data[0].managerSeq);
			$("#managerRegistForm input[name='managerName']").val(data[0].managerName);
			$("#managerRegistForm input[name='managerId']").val(data[0].managerId);
			$("#managerRegistForm input[name='password']").val(data[0].password);		
			$("#managerRegistForm input[name='managerEmail']").val(data[0].managerEmail);		
			$("#managerRegistForm select[name='useYn']").val(data[0].useYn);		
			$("#managerRegistForm select[name='authGroupSeq']").val(data[0].authGroupSeq);		
			$("#managerRegistForm input[name='description']").val(data[0].description);		
			$("#managerRegistForm input[name='mbCode']").val(data[0].mbCd);		
				});
		 
	}
	
	
	
	
	function deleteM(seq) {
		let targetUrl = "/master/supervisor/deleteManager.json";
		
		let param = {managerSeq : seq};
		
		$.ajax({
			type : "POST",
			url : targetUrl,
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(param)
		}).done(function(response) {
			alert("삭제되었습니다.")
			location.reload();
				});
		 
	}
	
	
	function useEdit(status, seq) {
		let targetUrl = "/master/supervisor/useYnEdit.json";
		
		let param = {useYn : status, managerSeq : seq};
		
		$.ajax({
			type : "POST",
			url : targetUrl,
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(param)
		}).done(function(response) {
			alert("수정되었습니다.")
			location.reload();
				});
		 
	}
	
	
	
	function searchManagerList() {
		 var postData = document.getElementById("searchForm");
		    postData.action="/master/supervisor/supervisor";
			postData.currentPage = 1;
	        postData.rowsPerPage = $("#rowsPerPage_1 option:selected").val();
	        postData.method = "GET";
	        postData.submit();
	    }
	
	
	//수정시 비번 변경 버튼 클릭
	/* $("#managerRegistForm #changePasswordBtn").click(function(){
		$('#managerRegistForm .changePasswordSpan').show();
		$('#managerRegistForm input[name="changePasswordYn"]').val("Y");
	}); */
</script>