<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-20
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            <div class="menu_set">
                <div class="set_tit">
                    <div class="set_coment">
                        <div class="coment_tit">메뉴관리</div>
                        <div class="coment_sub">노출순서 변경후 Save 한후 다시 로그인 하셔야 적용됩니다.</div>
                    </div>
                    <div class="set_tool">
                        <div class="tool_btn">
                            <button type="button" class="btn btn_02" >
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-device-floppy" width="22" height="22" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M6 4h10l4 4v10a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2"></path>
                                        <circle cx="12" cy="14" r="2"></circle>
                                        <polyline points="14 4 14 8 8 8 8 4"></polyline>
                                    </svg>
                                </span>
                                <span>Save</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu_detail">
                    <div class="cate_depth">
                        <div class="cate_depth_tit">
                            <span>1차메뉴<i>아이콘설정은 1차메뉴만 가능합니다.</i></span>
                            <span>
                                <button type="button" class="btn btn_01 btn_03" onclick="modal_view('1'); return false;">
                                    <span>메뉴추가</span>
                                </button>
                            </span>
                        </div>
                        <div class="cate_depth_list typeScroll">
                            <ul id="ui_menu_1">
                            <c:forEach var="menu1" items="${menuList}" varStatus="status">
                             <li id="ui_menu_1_${status.count}">
                                    <input type="hidden" name="menuSeq" id="menuSeq" value="${menu1.menuSeq}">
                                    <input type="hidden" name="menuLevel" id="menuLevel" value="${menu1.menuLevel}">
                                    <input type="hidden" name="setIcon" id="setIcon" value="${menu1.setIcon}">
                                    <input type="hidden" name="rowIndex" id="rowIndex" value="${menu1.rowIndex}">
                                    <input type="hidden" name="parentMenuSeq" id="parentMenuSeq" value="${menu1.parentMenuSeq}">
                                    <input type="hidden" name="programUrl" id="programUrl" value="${menu1.programUrl}">
                                    <input type="hidden" name="programParameter" id="programParameter" value="${menu1.programParameter}">
                                    <input type="hidden" name="newDisplayOrder" id="newDisplayOrder" value="${menu1.newDisplayOrder}">
                                    <input type="hidden" name="displayOrder" id="displayOrder" value="${menu1.displayOrder}">
                                    <input type="hidden" name="displayYn" id="displayYn" value="${menu1.displayYn}">
                                    <button type="button" class="drag ui_menu_1">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-autofit-height" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M12 20h-6a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h6"></path>
                                            <path d="M18 14v7"></path>
                                            <path d="M18 3v7"></path>
                                            <path d="M15 18l3 3l3 -3"></path>
                                            <path d="M15 6l3 -3l3 3"></path>
                                        </svg>
                                    </button>
                                    <a href="#">
                                        <span>${menu1.menuName}</span>
                                        <span class="${menu1.displayYn eq 'Y' ? 'use_btn use_btn_s' : 'use_btn_n use_btn_s'}   ">${menu1.displayYn eq 'Y' ? '노출' : '노출안함'}</span>
                                    </a>
                                    <button type="button" class="btn btn_03" onclick="goModifyPop('${menu1.menuLevel}','${status.count}', 'S'); return false;">
                                        <span>Edit</span>
                                    </button>
                                </li>
                            </c:forEach>

								
                            </ul>
                        </div>
                    </div>
                    <div class="cate_depth">
                        <div class="cate_depth_tit">
                            <span>2차메뉴 <i id="underMenu1"></i></span>
                            <span>
                                <button type="button" class="btn btn_01 btn_03" onclick="modal_view('2'); return false;">
                                    <span>메뉴추가</span>
                                </button>
                            </span>
                        </div>
                        <div class="cate_depth_list typeScroll">
                            <ul id="ui_menu_2">
                            
                            </ul>
                        </div>
                    </div>
                    <div class="cate_depth">
                        <div class="cate_depth_tit">
                            <span>3차메뉴 <i id="underMenu2"></i></span>
                            <span>
                                <button type="button" class="btn btn_01 btn_03" onclick="modal_view('3'); return false;">
                                    <span>메뉴추가</span>
                                </button>
                            </span>
                        </div>
                        <div class="cate_depth_list typeScroll">
                            <ul id="ui_menu_3">
                               
 
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="add_modal typeScroll" id="menu_set_modal" >
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    메뉴<i id="trans"></i>
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
                <form id="registMenuForm" name="registMenuForm">
                <!-- <input type="hidden" id="parentMenuSeq" name="parentMenuSeq"> -->
                <!-- <input type="hidden" id="parentMenuName" name="parentMenuName"> -->
				<input type="hidden" id="menuSeq" name="menuSeq">
				<input type="hidden" id="displayOrder" name="displayOrder">
				<input type="hidden" id="registState">
                    <div class="modal_get typeScroll">
                        <%--1차메뉴부터 노출--%>
                        <div class="dan overX" id="iconId"  style="display: none;">
                            <label for="" class="necessary">아이콘</label>
                            <div class="set_icon">
                                <label for="set_icon_1">
                                    <input type="radio" id="set_icon_1" name="set_icon" value="icon-tabler-brand-open-source" checked>
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" classname="icon icon-tabler icon-tabler-brand-open-source" width="24" height="24" viewBox="0 0 24 24" strokewidth="2" stroke="currentColor" fill="none" strokelinecap="round" strokelinejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M12 3a9 9 0 0 1 3.618 17.243l-2.193 -5.602a3 3 0 1 0 -2.849 0l-2.193 5.603a9 9 0 0 1 3.617 -17.244z"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_2">
                                    <input type="radio" id="set_icon_2" name="set_icon" value="icon-tabler-table-export">
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-table-export" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M11.5 20h-5.5a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v7.5m-16 -3.5h16m-10 -6v16m4 -1h7m-3 -3l3 3l-3 3"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_3">
                                    <input type="radio" id="set_icon_3" name="set_icon" value="icon-tabler-credit-card">
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-credit-card" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <rect x="3" y="5" width="18" height="14" rx="3"></rect>
                                            <line x1="3" y1="10" x2="21" y2="10"></line>
                                            <line x1="7" y1="15" x2="7.01" y2="15"></line>
                                            <line x1="11" y1="15" x2="13" y2="15"></line>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_4">
                                    <input type="radio" id="set_icon_4" name="set_icon" value="icon-tabler-calendar-stats">
                                    <span>
                                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-stats" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M11.795 21h-6.795a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v4"></path>
                                            <path d="M18 14v4h4"></path>
                                            <circle cx="18" cy="18" r="4"></circle>
                                            <path d="M15 3v4"></path>
                                            <path d="M7 3v4"></path>
                                            <path d="M3 11h16"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_5">
                                    <input type="radio" id="set_icon_5" name="set_icon" value="icon-tabler-settings">
                                    <span>
                                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-settings" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_6">
                                    <input type="radio" id="set_icon_6" name="set_icon" value="icon-tabler-chart-donut">
                                    <span>
                                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chart-donut" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                           <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                           <path d="M10 3.2a9 9 0 1 0 10.8 10.8a1 1 0 0 0 -1 -1h-3.8a4.1 4.1 0 1 1 -5 -5v-4a0.9 .9 0 0 0 -1 -.8"></path>
                                           <path d="M15 3.5a9 9 0 0 1 5.5 5.5h-4.5a9 9 0 0 0 -1 -1v-4.5"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_7">
                                    <input type="radio" id="set_icon_7" name="set_icon" value="icon-tabler-notification">
                                    <span>
                                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-notification" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                           <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                           <path d="M10 6h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"></path>
                                           <circle cx="17" cy="7" r="3"></circle>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_8">
                                    <input type="radio" id="set_icon_8" name="set_icon" value="icon-tabler-box-multiple">
                                    <span>
                                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-box-multiple" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                           <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                           <rect x="7" y="3" width="14" height="14" rx="2"></rect>
                                           <path d="M17 17v2a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2v-10a2 2 0 0 1 2 -2h2"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_9">
                                    <input type="radio" id="set_icon_9" name="set_icon" value="icon-tabler-bookmarks">
                                    <span>
                                      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-bookmarks" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                           <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                           <path d="M13 7a2 2 0 0 1 2 2v12l-5 -3l-5 3v-12a2 2 0 0 1 2 -2h6z"></path>
                                           <path d="M9.265 4a2 2 0 0 1 1.735 -1h6a2 2 0 0 1 2 2v12l-1 -.6"></path>
                                        </svg>
                                    </span>
                                </label>
                                <label for="set_icon_10">
                                    <input type="radio" id="set_icon_10" name="set_icon" value="icon-tabler-device-analytics">
                                    <span>
                                      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-device-analytics" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                           <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                           <rect x="3" y="4" width="18" height="12" rx="1"></rect>
                                           <line x1="7" y1="20" x2="17" y2="20"></line>
                                           <line x1="9" y1="16" x2="9" y2="20"></line>
                                           <line x1="15" y1="16" x2="15" y2="20"></line>
                                           <path d="M8 12l3 -3l2 2l3 -3"></path>
                                        </svg>
                                    </span>
                                </label>
                            </div>
                        </div>
                        <%--1차메뉴부터 노출--%>
                        <%--2차메뉴부터 노출--%>
                        <div class="dan" id="parentMenuNameDiv">
                            <label for="menu_set_up" class="necessary">상위메뉴</label>
                            <div class="sel_type">
                                <select name="parentMenuSeq" id="menu_set_up">
                                
                              <%--   <c:forEach var="menu1" items="${menuList}">
                                    <option value="${menu1.menuSeq}">${menu1.menuName}</option>
                                </c:forEach> --%>
                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                            <%--2차메뉴부터 노출--%>
                        <div class="dan">
                            <label for="menu_set_name" class="necessary">메뉴이름</label>
                            <input type="text" id="menu_set_name"  name="menuName" alt="메뉴이름">
                        </div>
                        <div class="dan">
                            <label for="menu_set_url" class="necessary">메뉴경로</label>
                            <input type="text" id="menu_set_url" name="programUrl" >
                        </div>
                        <div class="dan">
                            <label for="manager_use" class="necessary">노출여부</label>
                            <div class="sel_type">
                                <select name="displayYn" id="manager_use">
                                    <option value="Y">노출</option>
                                    <option value="N">노출안함</option>
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
                            <label for="menu_set_pa" >파라미터</label>
                            <input type="text" id="menu_set_pa"  name="programParameter">
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;"><span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big registMenuBtn"><span></span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>

    $(document).ready(function() {
        $("#ui_menu_1").sortable({
			handle : ".ui_menu_1",
			cancel : '',
			update : ''
		});
		$("#ui_menu_2").sortable({
			handle : ".ui_menu_2",
			cancel : '',
			update : ''
		});
		$("#ui_menu_3").sortable({
			handle : ".ui_menu_3",
			cancel : '',
			update :''
		});
		
		$("#ui_menu_1 li").click(function(e) {
			e.preventDefault();
	        let idx = $(this).index()+1;
	        $('#ui_menu_1 li').removeClass('active'); 
			$('#ui_menu_1 li:nth-child('+idx+')').addClass('active'); 
			let menuSeq = $("#ui_menu_1 .active #menuSeq").val();
			
			getMenuListJson(menuSeq, '2', 'T');
			
			let menuName = $("#ui_menu_1 .active > a > span").eq(0).text();
			
			$('#underMenu1').text(menuName + ' - 하위메뉴');
			
		  });
		
		$("#ui_menu_2").on("click", "li", function(e) {
			e.preventDefault();
	        let idx = $(this).index()+1;
	        $('#ui_menu_2 li').removeClass('active'); 
			$('#ui_menu_2 li:nth-child('+idx+')').addClass('active'); 
			let menuSeq = $("#ui_menu_2 .active #menuSeq").val();
			
			getMenuListJson(menuSeq, '3', 'T');
			
			let menuName = $("#ui_menu_2 .active > a > span").eq(0).text();
			
			$('#underMenu2').text(menuName + ' - 하위메뉴');
			
		  });
		
		
    })
     
	function modal_close() {
		$('#menu_set_modal').removeClass('view');
	}

	//저장(등록, 수정) 버튼 클릭시
	$(".registMenuBtn").on("click", function() {
		registManager();
	});
	
	$(".btn_02").on("click", function() {
		disPlayOrderManager();
	});

	//등록, 수정, 상세 화면 이동
	function registManager() {
		let targetUrl = "";
		if ($("#registState").val() == "regist")
			targetUrl = "/master/supervisor/createMenu.json";
		   
		if ($("#registState").val() == "modify")
			targetUrl = "/master/supervisor/updateMenu.json";
		if (checkManagerValid() && confirm("저장 하시겠습니까?")) {
			$(".registMenuBtn").off("click");
			let param = $("form[name=registMenuForm]").serializeObject();
			/*
			if(param.parentMenuSeq == null || parentMenuSeq == ""){
				param.parentMenuSeq = 0;
			}
			*/
			

			
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
									"#registMenuForm input[name='"
											+ response.code + "']").focus();
						}
						$(".registMenuBtn").on("click", function() {
							registManager();
						});
					});

		} else {
			alert('이건가?');
		}
	}

	//벨리데이션
	function checkManagerValid() {
		var valid = true;
		$.each($("#registMenuForm #menu_set_name"), function() {
			if ($(this).val() == '') {
				alert($(this).prop('alt') + "(은)는 필수 입력 항목 입니다.");
				$(this).focus();
				valid = false;
				return false;
			}
		});
		return valid;
	}
	
	function getMenuListJson(menuSeq, menuLevel, type) {
		
		 $.ajax({
				type : "POST",
				url : '/master/supervisor/getMenuList.json',
				contentType : "application/json",
				dataType : "json",
				async: false,
				data : JSON.stringify({
					menuSeq : menuSeq,
					menuLevel : menuLevel
				}),
				success : function(data) {
					let array = data.storeData;

					let text = "";
					if(type == 'S'){
						$('#menu_set_up').empty();
						for ( var i in array) {
							var option = $("<option value="+ array[i].menuSeq +">"
									+ array[i].menuName + "</option>");
							$('#menu_set_up').append(option);
						}
					}else{
						$("#ui_menu_3").empty();
					
						for (var i in array){
							let cnt = Number(i)+1;
							text += '<li id="ui_menu_'+menuLevel+'_'+ cnt +'">';
							text += ' <input type="hidden" name="menuSeq" id="menuSeq" value='+array[i].menuSeq+'>';
							text += ' <input type="hidden" name="menuLevel" id="menuLevel" value='+array[i].menuLevel+'>';
							text += ' <input type="hidden" name="parentMenuSeq" id="parentMenuSeq" value='+array[i].parentMenuSeq+'>';
							text += ' <input type="hidden" name="displayYn" id="displayYn" value='+array[i].displayYn+'>';
							text += ' <input type="hidden" name="programUrl" id="programUrl" value='+array[i].programUrl+'>';
							text += ' <input type="hidden" name="programParameter" id="programParameter" value='+array[i].programParameter+'>';
							text += ' <input type="hidden" name="displayOrder" id="displayOrder" value='+array[i].displayOrder+'>';
							text += ' <button type="button" class=\"drag ui_menu_'+menuLevel+'\">';
						    text += '   <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-autofit-height" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">';
							text += '     <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>';
							text += '     <path d="M12 20h-6a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h6"></path>';
							text += '      <path d="M18 14v7"></path>';
							text += '    <path d="M18 3v7"></path>';
							text += '    <path d="M15 18l3 3l3 -3"></path>';
							text += '   <path d="M15 6l3 -3l3 3"></path>';
						    text += '  </svg>';
							text += ' </button>';
							text += ' <a href="#">';
							text += '   <span id="menuName">'+array[i].menuName+'</span>';
							if(array[i].displayYn == 'Y'){
						    text += '   <span class=\"use_btn use_btn_s\">노출</span>';
							}
							else{
							text += '   <span class=\"use_btn_n use_btn_s\">노출안함</span>';	
							}
						    text += ' </a>';
							text += ' <button type="button" class=\"btn btn_03\" onClick="javascript:goModifyPop(\'' + menuLevel +'\',\'' + cnt + '\',\'' + 'S' + '\')">';
							text += '  <span>Edit</span>';
							text += ' </button>';
						    text += ' </li>';
						} 
						$("#ui_menu_" + menuLevel).html(text);
                    
					}
				}
			});
	}
	// 등록 화면
	function modal_view(level) {
 	   $("#registMenuForm")[0].reset();
 	   $('#trans').text('추가');
 	   $(".registMenuBtn > span").text("추가");
 	   $("input:radio[name=displayYn]").attr("checked", false);
		   $("input:radio[name=displayYn][value=Y]").attr("checked", true);
		   $("#iconId").css("display", "block");
		   $("#menu_set_up option:selected").removeAttr("selected");
     if(level==1){
         $("#parentMenuNameDiv").css("display", "none");
			//$("#registMenuForm #menu_set_up").val(Number("0"));
			/* $("#registMenuForm #parentMenuName").val(''); */
			 let menulength = $("#ui_menu_1 li").length + 1;
			 $("#registMenuForm #displayOrder").val(menulength);
		} else if (level == 2) {
			$("#iconId").val("");
			let index = $("#ui_menu_1 .active").index() + 1;
			if (index == null || index == "") {
				alert("상위 메뉴를 선택해주세요.");
				return;
			}
			$("#parentMenuNameDiv").css("display", "block");
			$("#iconId").css("display", "none");
			let span = $("#ui_menu_1 .active > a > span");
			let menuSeq = $("#ui_menu_1 .active #menuSeq").val();
			let parentMenuId = menuSeq;
			/* let parentMenuName = span.eq(0).text(); */
			//$("#registMenuForm #parentMenuSeq").val(Number(parentMenuId));
			$('#menu_set_up').empty();
			<c:forEach var="menu1" items="${menuList}">
			var option = document.createElement('option');
			option.setAttribute('value', '${menu1.menuSeq}');
			option.innerHTML = '${menu1.menuName}';
			$('#menu_set_up').append(option);
			</c:forEach>
			 $("#menu_set_up").val(parentMenuId).attr("selected", "selected");
			 
			 let menulength = $("#ui_menu_2 li").length + 1;
			 $("#registMenuForm #displayOrder").val(menulength);
			 
		} else if (level == 3) {
			$("#iconId").val("");
			let index = $("#ui_menu_2 .active").index() + 1;
			if (index == null || index == "") {
				alert("상위 메뉴를 선택해주세요.");
				return;
			}
			$("#parentMenuNameDiv").css("display", "block");
			$("#iconId").css("display", "none");
			let menuSeq1 = $("#ui_menu_1 .active #menuSeq").val();
			getMenuListJson(menuSeq1, '2', 'S');
			let span = $("#ui_menu_2 .active > a > span");
			let menuSeq = $("#ui_menu_2 .active input[name=menuSeq]").val();
			let parentMenuId = menuSeq;
			/* let parentMenuName = span.eq(0).text(); */
			$("#registMenuForm #parentMenuSeq").val(parentMenuId);
			$("#registMenuForm #menu_set_up").val(parentMenuId);
			 
			 let menulength = $("#ui_menu_3 li").length + 1;
			 $("#registMenuForm #displayOrder").val(menulength);
		}

		$("#registState").val("regist");
		$('#menu_set_modal').addClass('view');
	}
	
	
	//수정 화면
    function goModifyPop(menuLevel, cnt, type){
		
		$('#trans').text('수정');
 
    	$("#registMenuForm")[0].reset();
    	$(".registMenuBtn > span").text("수정");
   	    $("#manager_use").attr("checked", false);
        //$("#registMenuForm #displayOrder").val(	$("#ui_menu_"+menuLevel+"_"+cnt+" #displayOrder").val());
        $("#registMenuForm #displayOrder").val(	$("#ui_menu_"+menuLevel+"_"+cnt+"").index()+1);
        $("#registMenuForm #menuSeq").val($("#ui_menu_"+menuLevel+"_"+cnt+" #menuSeq").val());
        $("#menu_set_name").val($("#ui_menu_"+menuLevel+"_"+cnt+" a span").eq(0).text());
        $("#menu_set_url").val($("#ui_menu_"+menuLevel+"_"+cnt+" #programUrl").val());
        $("#menu_set_pa").val($("#ui_menu_"+menuLevel+"_"+cnt+" #programParameter").val());
        $("#registMenuForm #parentMenuSeq").val($("#ui_menu_"+menuLevel+"_"+cnt+" #parentMenuSeq").val());
        $("#manager_use").val($("#ui_menu_"+menuLevel+"_"+cnt+" #displayYn").val()).attr('selected', true);
       
        $("#registState").val("modify");
        
          
        if(menuLevel == "1"){
            //$("#parentMenuSeq").val($("#parentMenuSeq").val());
            $("#iconId").css("display", "block");
            $("#parentMenuNameDiv").css("display", "none");
            $("input:radio[name='set_icon'][value='"+$("#ui_menu_"+menuLevel+"_"+cnt+" #setIcon").val()+"']").prop('checked', true);
        }else if(menuLevel == "2"){
        	$("#iconId").val("");
            $("#parentMenuNameDiv").css("display", "block");
            $("#iconId").css("display", "none");
            var parentMenuId =  $("#ui_menu_1 .active #menuSeq").val();
            //var parentMenuName = $("#ui_menu_1 .active a span").eq(0).text();
            //$("#registMenuForm #parentMenuSeq").val(parentMenuId);
            //$("#registMenuForm #parentMenuName").val(parentMenuName);
            
            $('#menu_set_up').empty();
            <c:forEach var="menu1" items="${menuList}">
			var option = document.createElement('option');
			option.setAttribute('value', '${menu1.menuSeq}');
			option.innerHTML = '${menu1.menuName}';
			$('#menu_set_up').append(option);
			</c:forEach>
            
            $("#menu_set_up").val(parentMenuId);
        }else if(menuLevel == "3"){
        	$("#iconId").val("");
            $("#parentMenuNameDiv").css("display", "block");
            $("#iconId").css("display", "none");
            let menuSeq1 = $("#ui_menu_1 .active #menuSeq").val();
            
            getMenuListJson(menuSeq1, '2', 'S');
            
            var parentMenuId = $("#ui_menu_2 .active #menuSeq").val();
            //var parentMenuName = $("#ui_menu_2 .active a span").eq(0).text();
            //$("#registMenuForm #parentMenuSeq").val(parentMenuId);
            //$("#registMenuForm #parentMenuName").val(parentMenuName);
            
            $("#menu_set_up").val(parentMenuId);
        }
        
        $('#menu_set_modal').addClass('view');
    }
	
	
	
  
	//저장 버튼
	function disPlayOrderManager() {
		
		let menulength = $("#ui_menu_1 li").length;
		let menulength2 = $("#ui_menu_2 li").length;
		let menulength3 = $("#ui_menu_3 li").length;
		
		let item = {};
		let array = [];
		
	    if (menulength > 0) {
			for (var i = 0; i < menulength; i++) {
				let displayOrder = i+1;
				let menuSeq = $("#ui_menu_1 li #menuSeq").eq(i).val();
				item = {displayOrder : displayOrder, menuSeq : menuSeq};
				array.push(item);
			}
		}

		if (menulength2 > 0) {
			for (var i = 0; i < menulength2; i++) {
				let displayOrder = i+1;
				let menuSeq = $("#ui_menu_2 li #menuSeq").eq(i).val();
				item = {displayOrder : displayOrder, menuSeq : menuSeq};
				array.push(item);
			}
		}

		if (menulength3 > 0) {
			for (var i = 0; i < menulength3; i++) {
				let displayOrder = i+1;
				let menuSeq = $("#ui_menu_3 li #menuSeq").eq(i).val();
				item = {displayOrder : displayOrder, menuSeq : menuSeq};
				array.push(item);
			}
		}
		update2(array);
	}
	
	
	
	function update2(array) {
		
		 $.ajax({
				type : "POST",
				url : '/master/supervisor/updateOrder.json',
				contentType : "application/json",
				dataType : "json",
				async: false,
				data : JSON.stringify(array),
				success : function(response) {
					if (response.success) {
						alert("저장되었습니다.");
						location.reload();
					} else {
						alert("저장시 오류가 발생하였습니다." + response.message);
					}
					
				}	
			});
	}
	
	
	
	
</script>