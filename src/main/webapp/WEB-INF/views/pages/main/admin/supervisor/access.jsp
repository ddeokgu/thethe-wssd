<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-18
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <form action="#" id="searchForm" name="searchForm">
                    <div class="list_tit">
                        <div class="list_srch">
                            <div class="srch_filter">
                                <button type="button" class="btn mr">
                                <span class="icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-filter" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                       <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                       <path d="M5.5 5h13a1 1 0 0 1 .5 1.5l-5 5.5l0 7l-4 -3l0 -4l-5 -5.5a1 1 0 0 1 .5 -1.5"></path>
                                    </svg>
                                </span>
                                    <span>Filter</span>
                                </button>
                                <div class="filter_pop">
                                    <div class="tit"><span>Filter Options</span></div>
                                    <div class="sel">
                                        <!-- <div class="dan">
                                            <label for="option_1">권한</label>
                                            <div class="sel_type">
                                                <select name="" id="option_1">
                                                    <option value="">옵션선택</option>
                                                </select>
                                                <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                            </span>
                                            </div>
                                        </div> -->
                                        <div class="dan">
                                            <label for="option_1">사용여부</label>
                                            <div class="sel_type">
                                                <select name="useYn" id="option_1">
                                                    <option value="">옵션선택</option>
                                                    <option value="Y">사용</option>
                                                    <option value="N">사용안함</option>
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
                                <input type="text" name="authGroupName" placeholder="Search">
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
                            <col  class="m_hide" style="width: 11%">
                            <col class="m_hide" style="width: 15%">
                            <col class="m_hide" style="width: 11%">

                            <col style="width: 8%">
                            <col class="m_show">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="num">#</th>
                                <th>권한이름</th>
                                <th class="m_hide">등록자 일련번호</th>
                                <th class="m_hide">등록일</th>
                                <th class="m_hide">사용설정</th>
                                <th class="m_hide">수정자 일련번호</th>
                                <th class="m_hide">수정일</th>
                                <th class="edit">관리</th>
                               <th class="m_show">더보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:choose>
                            <c:when test="${empty list}">
                             <tr>
                                   <td class="none" colspan="8"><span>등록되어 관리자 권한그룹이 없습니다.</span></td>
                               </tr>
                            </c:when>
                            <c:otherwise>
                            
                            <c:forEach var="item" items="${list}" varStatus="status">
                            
                            <tr id="auth_${item.authGroupSeq}">
                                <td class="num"><c:out value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out></td>
                                <td class="td_tit">
                                    <span><a href="#" onclick="editview(${item.authGroupSeq})">${item.authGroupName}</a></span>
                                </td>
                                <td class="m_hide">${item.registBy}</td>
                                <td class="m_hide">${item.registDate} </td>
                                <td class="m_hide">
                                <c:choose>
                                <c:when test="${item.useYn eq 'Y'}">
                                 <a href="#" onclick="useEdit('N', '${item.authGroupSeq}');"><span class="use_btn">사용</span></a>
                                </c:when>
                                <c:otherwise>
                                 <a href="#" onclick="useEdit('Y', '${item.authGroupSeq}');"><span class="use_btn_n">사용안함</span></a>
                                </c:otherwise>
                                </c:choose>
                               </td>
                                <td class="m_hide">${item.updateBy}</td>
                                <td class="m_hide">${item.updateDate}</td>

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
                                                <li><a href="#" onclick="editview(${item.authGroupSeq})">Edit</a></li>
                                                <li><a href="#" onclick="deleteItem(${item.authGroupSeq})">Delete</a></li>
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
                                                <span class="tit">등록자 일련번호</span>
                                                <span>${item.registBy}</span>
                                            </li>

                                            <li>
                                                <span class="tit">등록일</span>
                                                <span>${item.registDate}</span>
                                            </li>
                                            <li>
                                                <span class="tit">사용설정</span>
                                                <span>
                                                 <c:choose>
																	<c:when test="${item.useYn eq 'Y'}">
																		<a href="#"
																			onclick="useEdit('N', '${item.authGroupSeq}');"><span
																			class="use_btn">사용</span></a>
																	</c:when>
																	<c:otherwise>
																		<a href="#"
																			onclick="useEdit('Y', '${item.authGroupSeq}');"><span
																			class="use_btn_n">사용안함</span></a>
																	</c:otherwise>
												</c:choose>
												</span>
                                            </li>
                                            <li>
                                                <span class="tit">수정자 일련번호</span>
                                                <span>${item.updateBy}</span>
                                            </li>
                                            <li>
                                                <span class="tit">수정일</span>
                                                <span>${item.updateDate}</span>
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
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-left" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="15 6 9 12 15 18"></polyline>
                                </svg>
                            </a>
                            <c:if test="${!empty list}">
                                ${dh:pagingA(pageInfo.totalCount, pageInfo.currentPage, pageInfo.rowsPerPage, 10)}
                            </c:if>
                            <a href="#" class="next">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-right" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
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
<div class="add_modal typeScroll" id="control_modal" >
    <div class="modal_bg" onclick="modal_close();return false;"></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    관리자 권한그룹 <i id="trans">등록</i>
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
                <form action="" id="registManagerForm">
                  <input type="hidden" id="registState">
			      <input type="hidden" id="authGroupSeq" name="authGroupSeq">
                    <div class="modal_get typeScroll">
                        <div class="dan">
                            <label for="authGroupName" class="necessary">권한명</label>
                            <input type="text" id="authGroupName" name="authGroupName" class="required" placeholder="권한명 입력" alt="권한 명">
                        </div>
                        <div class="dan dan50 dan_r">
                            <label for="control_use" class="necessary">사용여부</label>
                            <div class="sel_type">
                                <select name="useYn" id="control_use">
                                    <option value="Y">사용</option>
                                    <option value="N">사용안함</option>
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
                            <label for="toDate" >등록일 (최종수정일)</label>
                            <input type="text" id="toDate" name="toDate"  readonly>
                        </div>
                        <div class="dan">
                            <label >접근권한 메뉴<span class="label_coment">※ 접근 메뉴 설정은 메뉴의 상세 설정 하위 메뉴 중 최소 1개 이상 설정하셔야 합니다.</span></label>
                            <div class=" menu_depth_list typeScroll">
                                <ul id="menu_list_cl">
                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="modal_btn">
                        <button type="button" class="btn mr btn_big" onclick="modal_close();return false;"><span>취소</span></button>
                        <button type="button" class="btn btn_01 btn_big" id="registManagerBtn"><span></span></button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    //등록 버튼 클릭 시 PopUp 화면 이동
    function modal_view() {
           $('#control_modal').addClass('view');
           $("#registManagerForm")[0].reset();
           //$('#menu_list_cl').children().removeClass('view');
           //$('#menu_list_cl').children().children().removeClass('view');
           $('.col-box').removeClass('view');
           $("input[name='viewStaus']").val('N');
   	       $("#control_use option:selected").removeAttr("selected");
   	       $("#control_use").val("Y");
           $("#registState").val("regist");
           goRegistPage();
    }
    
    
    function editview(seq) {
        $('#control_modal').addClass('view');
        $("#registManagerForm")[0].reset();
        $('.col-box').removeClass('view');
        $("input[name='viewStaus']").val('N');
	    $("#control_use option:selected").removeAttr("selected");
	    $("#control_use").val("Y");
	    $("#authGroupSeq").val(seq);
        $("#registState").val("modify");
        goRegistPage();
    }
    
    
    function modal_close() {
           $('#control_modal').removeClass('view');
           $("#menu_list_cl").empty();
    }
    
    function deleteItem(seq) {
    	 $("#authGroupSeq").val(seq);
    	 goRegistSubmit("delete");
     }
    
  //등록 및 수정화면 분기 및 데이터 셋팅
	function goRegistPage(){
        if($("#menuGuide").val() == null){
    	    getRegistTreeMenu();
    	}
	    var state = $("#registState").val();
	    if(state == "modify") {
	        $("#trans").text("수정");
	        $("#registManagerBtn > span").text("수정");
	        getDetailTreeMenu();
	    }
	    if(state == "regist") {
	    	$("#trans").text("등록");
	        setToDay();
	        $("#registManagerBtn > span").text("등록");
	    }
	}
  
  //저장(등록, 수정) 버튼 클릭시
    $("#registManagerBtn").on("click", function(){
	    var state = $("#registState").val();
	    goRegistSubmit(state);
	});

    //삭제버튼 클릭시
	$("#deleteManagerBtn").on("click", function(){
        goRegistSubmit("delete");
    });
    
	$("#filterSave").on("click", function() {
		 $('.mr').removeClass('view');
	});
	
	$("#filterReset").on("click", function() {
		$("#option_1 option").prop("selected", false); 
	})
	
	
	
  //등록 및 수정 화면 진입 시 등록된 사용 메뉴들 호출
    function getRegistTreeMenu(){
		$('#registManagerForm')[0].reset();
		
        var param = $("#registManagerForm").serializeObject();

        $.ajax({
		    type : "post",
			url : "/master/supervisor/getTreeMenu.json",
			contentType: "application/json",
			dataType : "json",
			async : false,
			data: JSON.stringify(param),
			success : function(data){
				var level1 = 0;
				var level2 = 0;
				var level3 = 0;
				
			    var menuId1, menuId2, menuId3, colBoxMenu = "";
			   <%-- $("#menu_list_cl").append("<p id='menuGuide' class='sup'>※ 접근 메뉴 설정은 메뉴의 상세 설정 하위 메뉴 중 최소 1개 이상 설정하셔야 합니다.</p>");--%>
			    
			    let array = data.data;
			    

			    for(var i in array){
			    	var v = array[i];
			    	/* for(var j in array){
			    		var k = array[j];
				    	if(v.menuLevel == 1){
				    	if(k.menuLevel == 2){
				        	

				    	}
				    	}
			    		
			    	} */
			    	
			    	if(v.menuLevel == 1){
                        menuId1 = "treeMenu_"+v.menuLevel+"_"+v.displayOrder;
                        if(level1 == 0){
                            colBoxMenu = menuId1;
                            $("#menu_list_cl").append("<li id='"+menuId1+"_Li' class='col-box'></li>");
                        }
                        $("#"+colBoxMenu+"_Li").append("<label for='menuLevel1_"+v.menuSeq+"' class='check_label'><input type='checkbox' id='menuLevel1_"+v.menuSeq+"' name='menuSeq' value='"+v.menuSeq+"' class='menuLevel1' onClick='checkMenu(this);'><span>"+v.menuName+"</span></label>");
                        $("#"+colBoxMenu+"_Li").append("<input type='hidden' id='"+menuId1+"_viewStaus' name='viewStaus' value='N'>");
                        for(var j in array){
    			    		var k = array[j];
    				    	if(k.menuLevel == 2 && k.parentMenuSeq == v.menuSeq){
    			        		$("#"+colBoxMenu+"_Li").append("<a href='#' onClick='liOnView(\""+menuId1+"\")' class='view'><span>하위메뉴보기</span></a>");
       				    	   }
    				    }
                        $("#"+colBoxMenu+"_Li").append("<div id='"+menuId1+"_Div' class='menu_depth_list'></div>");
                        $("#"+menuId1+"_Div").append("<ul id='"+menuId1+"_Ul'></ul>");
                        level1++;
                        if((level1%1)==0) {
                            $("#menu_list_cl").append("<div class=\"bar\"></div>"); level1 = 0;
                        } 
                    }
			    	
			    	
			    	
			    	
			    	if(v.menuLevel == 2){
                        menuId2 = "treeMenu_"+v.menuLevel+"_"+v.parentMenuSeq+"_"+v.displayOrder;
                        if(level2 == 0){
                            $("#"+menuId1+"_Ul").append("<li id='"+menuId2+"_Li' class='col-box'></li>"); 
                        }
                        $("#"+menuId2+"_Li").append("<label for='menuLevel2_"+v.menuSeq+"' class='check_label'><input type='checkbox' id='menuLevel2_"+v.menuSeq+"' name='menuSeq' class='menuLevel1_"+v.parentMenuSeq+"' value='"+v.menuSeq+"' onClick='checkMenu(this);'><span>"+v.menuName+"</span></label>");
                        $("#"+menuId2+"_Li").append("<input type='hidden' id='"+menuId2+"_viewStaus' name='viewStaus' value='N'>");
                        for(var h in array){
    			    		var q = array[h];
    				    	if(q.menuLevel == 3 && q.parentMenuSeq == v.menuSeq){
    				    		 $("#"+menuId2+"_Li").append("<a href='#' onClick='liOnView(\""+menuId2+"\")' class='view'><span>하위메뉴보기</span></a>");
       				    	   }
    				    }
                        $("#"+menuId2+"_Li").append("<div id='"+menuId2+"_Div' class='menu_depth_list'></div>");
                        $("#"+menuId2+"_Div").append("<ul id='"+menuId2+"_Ul'></ul>");
                        level2++;
                        if((level2%1)==0) {
                            $("#"+menuId1+"_Ul").append("<div class=\"bar\"></div>"); level2 = 0;
                        } 
                       
                    }
			    	
			    	if(v.menuLevel == 3){
                        menuId3 = "treeMenu_"+v.menuLevel+"_"+v.parentMenuSeq+"_"+v.displayOrder;
                        if(level3 == 0){
                            $("#"+menuId2+"_Ul").append("<li id='"+menuId3+"_Li'></li>"); 
                        }
                        $("#"+menuId3+"_Li").append("<label for='menuLevel3_"+v.menuSeq+"' class='check_label'><input type='checkbox' class='menuLevel2_"+v.parentMenuSeq+"' id='menuLevel3_"+v.menuSeq+"' name='menuSeq' value='"+v.menuSeq+"' onClick='checkMenu(this);'><span>"+v.menuName+"</span></label>");
                        $("#"+menuId3+"_Li").append("<div id='"+menuId3+"_Div' class='menu_depth_list'></div>");
                        $("#"+menuId3+"_Div").append("<ul id='"+menuId3+"_Ul'></ul>");
                        level3++;
                        if((level3%1)==0) {
                            $("#"+menuId2+"_Ul").append("<div class=\"bar\"></div>"); level3 = 0;
                        } 
                       
                    }

			    }
						
					},
					error : function(e) {
						alert("조회시 오류가 발생하였습니다." + e.responseText);
					}
				});
        
	}
  
  
  //등록, 수정, 삭제 버튼 이벤트
	function goRegistSubmit(state){
	    var targetUrl = "";
	    let stateText = ";"
	    if(state == null){ state = $("#registState").val(); }
        if(state == "modify"){ targetUrl = "/master/supervisor/updateAuth.json"; stateText = "수정"; }
        if(state == "regist"){ targetUrl = "/master/supervisor/createAuth.json"; stateText = "저장"; }
        if(state == "delete"){ targetUrl = "/master/supervisor/deleteAuth.json"; stateText = "삭제"; }

        if(checkManagerValid() && confirm(stateText + " 하시겠습니까?")){
			$("#registManagerBtn").off("click");
			$("#deleteManagerBtn").off("click");

			var param = $("#registManagerForm").serializeObject();
			
            var menuSeqList = [];
			var checkMenuSeq = $("#registManagerForm input[name=menuSeq]:checked").each(function(){
			    var menuSeqVal = {
			        "menuSeq": $(this).val()
			    }
			    menuSeqList.push(menuSeqVal);
			});
			param.menuSeqList = menuSeqList;
			

			$.ajax({
				type : "post",
				url : targetUrl,
				contentType: "application/json",
				dataType : "json",
				async : false,
				data: JSON.stringify(param)
			}).done(function(response) {
				if (response.success) {
					alert(stateText+"되었습니다.");
					//$("#jqGrid_1").jqGrid().trigger("reloadGrid");
					location.reload();
					$('#control_modal').removeClass('view');
				} else {
					alert(stateText+"시 오류가 발생하였습니다." + response.message);
    				$("#registManagerForm input[name='"+response.code+"']").focus();
				}
    			$("#registManagerBtn").on("click", function(){goRegistSubmit();});
    			$("#deleteManagerBtn").on("click", function(){goRegistSubmit("delete");});
			});
			
			
		}
	}
  
  
	//상세 및 수정 화면진입 시 정보 호출
    function getDetailTreeMenu(){
        let authSeq = $("#authGroupSeq").val();
		let rowParam = $("#auth_"+authSeq);
		let td = rowParam.children();
		let useYnText = td.eq(4).text();
		let userYn = "";
		

		if(useYnText.trim() == '사용'){
			userYn = "Y";
		}else{
			userYn = "N";
		}
		
		/* console.log(td);
		console.log(td.eq(6).text().trim()); */
		
        //$("#authGroupSeq").val(rowParam.authGroupSeq);
        
		$("#authGroupName").val(td.eq(1).text().trim());
        $("#toDate").val(td.eq(6).text());
        $("#control_use").val(userYn);
        var param = {
            authGroupSeq: authSeq
        }
        
        $.ajax({
		    type : "post",
			url : "/master/supervisor/getDetailTreeMenu.json",
			contentType: "application/json",
			dataType : "json",
			async : false,
			data: JSON.stringify(param),
			success : function(data){
                for(var i in data.data){
                    var v = data.data[i];
                    $("#menu_list_cl input:checkbox[name=menuSeq]:input[value="+v.menuSeq+"]").prop("checked", true);
			    }
			},
			error : function(e){
			    alert("조회시 오류가 발생하였습니다." + e.responseText);
			}
		});
    }
  
  
  
  
  
  
    function liOnView(id) {
    	//alert(id);
    	let status = $('#'+ id +'_viewStaus').val(); 
    	
    	if(status == 'N'){
    		$('#'+ id+"_Li").addClass('view'); 
    		$('#'+ id+"_viewStaus").val('Y');
    	}else{
    		$('#'+ id+"_Li").removeClass('view');
    		$('#'+ id+"_viewStaus").val('N');
    	}
	}
    
    
    
    
  //오늘 날짜 text로 출력
    function setToDay(){
        var today = new Date();
    	var dd = today.getDate();
    	var mm = today.getMonth()+1;
    	var yyyy= today.getFullYear();

    	if(dd<10) { dd="0"+dd; }
    	if(mm<10) { mm="0"+mm; }

    	today = yyyy+"-"+mm+"-"+dd;
    	$("#toDate").val(today);
    }
    
  //checkBox 선택 시 상위 및 하위 checked 컨트롤
    function checkMenu(elem){
        var menuId = $(elem).attr("id");
        var menuClass = $(elem).attr("class");
        var menuClass2 = $("#"+menuClass).attr("class");
        var menuChecked =  $("#"+menuId).prop("checked");
        var menu1Checked =  $("#"+menuClass).prop("checked");
        var menu2Checked =  $("#"+menuClass2).prop("checked");
        var checkLength = $("input:checkbox[class="+menuClass+"]:checked").length;
        var checkLength2 = $("input:checkbox[class="+menuClass2+"]:checked").length;
        
        //1레벨 선택시 전체 선택 or 해제
        if(menuClass == "menuLevel1"){
            var parentId = $("#"+menuId).parent().parent().attr("id");
            if(menuChecked == true){
                $("#"+parentId+" input:checkbox[name=menuSeq]").prop("checked", true);
            }else if(menuChecked == false){
                $("#"+parentId+" input:checkbox[name=menuSeq]").prop("checked", false);
            }
        }
        //2레벨 선택시 전체 선택 or 해제
        if(menuId != null){
            if(menuChecked == true){
                $("."+menuId).prop("checked", true);
            }else if(menuChecked == false){
                $("."+menuId).prop("checked", false);
            }
        }
        //상위 메뉴 체크 or 해제
        if(menu1Checked == false){
            $("#"+menuClass).prop("checked", true);
            if(menu2Checked == false){
                $("#"+menuClass2).prop("checked", true);
            }
        }else if(menu1Checked == true && checkLength == 0 ){
            $("#"+menuClass).prop("checked", false);
            if(menu2Checked == true && checkLength2 == 1){
                $("#"+menuClass2).prop("checked", false);
            }
        }
        
        
        
    }
  
  //벨리데이션
    function checkManagerValid(){
        var valid = true;
        $.each($("#registManagerForm #authGroupName"), function(){
            if($(this).val() == '') {
	            alert($(this).prop('alt') + "(은)는 필수 입력 항목 입니다.");
    			$(this).focus();
    			valid = false;
    			return false;
            }
        });
        return valid;
    }
  
  
    $("#searchManagerBtn").on("click", function() {
		 searchManagerList();
	});
    
    
    function searchManagerList() {
		 var postData = document.getElementById("searchForm");
		    postData.action="/master/supervisor/access";
			postData.currentPage = 1;
	        postData.rowsPerPage = $("#rowsPerPage_1 option:selected").val();
	        

	        postData.method = "GET";
	        postData.submit();
	    }
    
    function useEdit(status, seq) {
		let targetUrl = "/master/supervisor/accessUseYnEdit.json";
		
		let param = {useYn : status, authGroupSeq : seq};
		
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
    
    
</script>